from django.urls import path
from .views import detect_disease, recommend_info

urlpatterns = [
    path('api/detect/', detect_disease, name='detect_disease'),
    path('api/recommend/', recommend_info, name='recommend_info'),
]
