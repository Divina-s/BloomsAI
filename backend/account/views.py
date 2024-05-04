from django.contrib.auth import authenticate
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework_jwt.settings import api_settings
from .models import Profile
from .serializers import UserSignupSerializer, UserLoginSerializer, ProfileSerializer
from rest_framework.authtoken.models import Token
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from rest_framework.permissions import IsAuthenticated
from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from django.core.mail import send_mail
import random
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required
from django.views.decorators.http import require_POST



jwt_payload_handler = api_settings.JWT_PAYLOAD_HANDLER
jwt_encode_handler = api_settings.JWT_ENCODE_HANDLER

from django.db import IntegrityError

class UserSignup(APIView):
    def post(self, request):
        user_serializer = UserSignupSerializer(data=request.data)
        if user_serializer.is_valid():
            email = user_serializer.validated_data['email']
            password = user_serializer.validated_data['password']
            phone_number = user_serializer.validated_data.get('phone_number')  # Optional
            
            try:
                # Create User
                user = user_serializer.save()
                user.set_password(password)  # Set password
                user.save()

                # Check if the user already has a profile
                if not hasattr(user, 'profile'):
                    # Create Profile (if name and phone_number provided)
                    profile = Profile.objects.create(user=user, phone_number=phone_number)  # Always create a profile
                
                return Response(user_serializer.data, status=status.HTTP_201_CREATED)
            except IntegrityError as e:
                if 'UNIQUE constraint failed: auth_user.username' in str(e):
                    return Response({"error": "Username is already in use."}, status=status.HTTP_400_BAD_REQUEST)
                else:
                    return Response({"error": "An error occurred while processing your request."}, status=status.HTTP_400_BAD_REQUEST)
        return Response(user_serializer.errors, status=status.HTTP_400_BAD_REQUEST)







class UserLogin(APIView):
    def post(self, request):
        serializer = UserLoginSerializer(data=request.data)
        if serializer.is_valid():
            email = serializer.validated_data['email']
            password = serializer.validated_data['password']
            user = authenticate(request, username=email, password=password)
            print("User:", user)  # Debug message
            if user:
                payload = jwt_payload_handler(user)
                token = jwt_encode_handler(payload)
                return Response({'token': token}, status=status.HTTP_200_OK)
            else:
                print("Authentication failed for email:", email)  # Debug message
                return Response({'error': 'Invalid credentials'}, status=status.HTTP_401_UNAUTHORIZED)
        print("Serializer errors:", serializer.errors)  # Debug message
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)






class UserLogout(APIView):
    authentication_classes = [JSONWebTokenAuthentication]
    permission_classes = [IsAuthenticated]

    def post(self,request):
        # Simply return a success response
        # No action is required on the server-side for JWT logout
        return Response({'message': 'Successfully logged out'}, status=status.HTTP_200_OK)
    

# views.py

from django.http import JsonResponse
from django.contrib.auth.models import User
from django.core.mail import send_mail
from django.conf import settings
import random
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.models import AnonymousUser
import json
@csrf_exempt




def forgot_password(request):
    print('Request Body:', request.body)  # Debugging statement

    if request.method == 'POST':
        try:
            # Parse JSON data from the request body
            data = json.loads(request.body)
            email = data.get('email')
            print('email:', email)  # Debugging statement
        except json.JSONDecodeError:
            return JsonResponse({'error': 'Invalid JSON format in request body.'}, status=400)

        # Ensure that email is provided and not empty
        if not email:
            return JsonResponse({'error': 'Email is required.'}, status=400)

        try:
            # Check if the user exists
            user = User.objects.get(email=email)
        except User.DoesNotExist:
            # If the user does not exist, return an error response
            return JsonResponse({'error': 'User with this email does not exist.'}, status=400)

        # Generate a 5-digit random code
        code = ''.join(random.choices('0123456789', k=5))

        # Send the code to the user's email
        subject = 'Password Reset Code'
        message = f'Your password reset code is: {code}'
        from_email = settings.EMAIL_HOST_USER
        to_email = [email]
        try:
            send_mail(subject, message, from_email, to_email, fail_silently=False)
        except Exception as e:
            print("Error sending email:", e)  # Debugging statement
            return JsonResponse({'error': 'Failed to send email. Error: {}'.format(str(e))}, status=500)

        # Store the code in the session for verification
        request.session['reset_code'] = code
        request.session['reset_email'] = email

        return JsonResponse({'message': 'Code sent successfully.'})

    return JsonResponse({'error': 'Invalid request method.'}, status=405)


def verify_code(request):
    if request.method == 'POST':
        code = request.POST.get('code')
        if code == request.session.get('reset_code'):
            # Code is correct, return success response
            del request.session['reset_code']
            email = request.session.get('reset_email')
            del request.session['reset_email']
            return JsonResponse({'success': True, 'email': email})
        else:
            return JsonResponse({'error': 'Invalid code. Please try again.'}, status=400)
    return JsonResponse({'error': 'Invalid request method.'}, status=405)

def change_password(request):
    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('password')
        confirm_password = request.POST.get('confirm_password')

        if password == confirm_password:
            try:
                user = User.objects.get(email=email)
            except User.DoesNotExist:
                return JsonResponse({'error': 'User with this email does not exist.'}, status=400)

            user.set_password(password)
            user.save()
            return JsonResponse({'success': True})
        else:
            return JsonResponse({'error': 'Passwords do not match. Please try again.'}, status=400)
    return JsonResponse({'error': 'Invalid request method.'}, status=405)




 
class CompleteProfileAPIView(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        serializer = ProfileSerializer(data=request.data)
        if serializer.is_valid():
            # Update the user's profile
            profile, created = Profile.objects.get_or_create(user=request.user)
            profile.name = serializer.validated_data.get('name')
            profile.phone_number = serializer.validated_data.get('phone_number')
            profile.gender = serializer.validated_data.get('gender')
            profile.address = serializer.validated_data.get('address')
            profile.email = serializer.validated_data.get('email')
            profile.save()
            return Response({'success': True, 'message': 'Profile completed successfully.'})
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)