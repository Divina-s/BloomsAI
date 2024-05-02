from django.urls import path

from . import views

urlpatterns = [
    path('api/submitfeedback/',views.submit_feedback, name='submit_feedback'),
  
]