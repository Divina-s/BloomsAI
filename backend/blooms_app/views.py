from django.shortcuts import render

# Create your views here.
from rest_framework import viewsets
from blooms_app.models import Farm
from blooms_app.serializers import MyModelSerializer

class FarmViewset(viewsets.ModelViewSet):
    queryset = Farm.objects.all()
    serializer_class = MyModelSerializer