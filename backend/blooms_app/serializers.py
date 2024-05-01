from rest_framework import serializers
from blooms_app.models import Farm

class MyModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = Farm
        fields = '__all__'