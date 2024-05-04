from django.db import models

# Create your models here.
# disease_detection/models.py
from keras.models import load_model

class DiseaseDetector:
    def __init__(self):
        self.model = self.load_model()

    def load_model(self):
        return load_model('disease_detection/models/crop_disease_detection_model.h5')

    def predict(self, image):
        return self.model.predict(image)







# models.py

from django.db import models

class Disease(models.Model):
    name = models.CharField(max_length=100)
    summary = models.TextField(null=True)
    how_to_identify = models.TextField()
    how_to_prevent = models.TextField()
    how_to_treat = models.TextField()
