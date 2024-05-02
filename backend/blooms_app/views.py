from django.shortcuts import render
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import json

# Create your views here.
from rest_framework import viewsets
from blooms_app.models import Farm
from blooms_app.serializers import MyModelSerializer
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required
from django.views.decorators.http import require_POST
from .models import Feedback
from django.views.decorators.csrf import csrf_exempt




class FarmViewset(viewsets.ModelViewSet):
    queryset = Farm.objects.all()
    serializer_class = MyModelSerializer







from django.contrib.auth.decorators import login_required

@csrf_exempt
@login_required
def submit_feedback(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        feedback_message = data.get('message')
        
        if not feedback_message:
            return JsonResponse({'error': 'Message field is required.'}, status=400)
        
        else:
            # Save the feedback to the database
            feedback = Feedback.objects.create(user=request.user, message=feedback_message)
            return JsonResponse({'success': True, 'message': 'Feedback submitted successfully.'})

    else:
        return JsonResponse({'error': 'Only POST requests are allowed.'}, status=405)

