from rest_framework import serializers
from django.contrib.auth import get_user_model
from .models import Profile
from django.utils.text import slugify
from django.contrib.auth.password_validation import validate_password

User = get_user_model()

class UserSignupSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)
    username=serializers.CharField(write_only=True)
    phone_number = serializers.CharField(write_only=True)

    class Meta:
        model = User
        fields = ('id', 'password', 'email', 'phone_number','username')

    def create(self, validated_data):
        phone_number = validated_data.pop('phone_number')
        password = validated_data.pop('password')
        username = validated_data.pop('username')  # Use the provided username directly
        email = validated_data.get('email')

        user = User.objects.create_user(username=username, email=email, password=password)
        user.phone_number = phone_number
        user.save()

        # Retrieve the user instance to ensure it's the newly created one
        user = User.objects.get(username=username)

        Profile.objects.create(user=user, phone_number=phone_number)
        return user

class UserLoginSerializer(serializers.Serializer):
    email = serializers.EmailField()
    password = serializers.CharField()
    #password = serializers.CharField(validators=[validate_password])

# serializers.py

from rest_framework import serializers

class ForgotPasswordSerializer(serializers.Serializer):
    email = serializers.EmailField()
