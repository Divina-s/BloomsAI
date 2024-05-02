from django.contrib import admin

# Register your models here.
from django.contrib import admin
from .models import Farm, Feedback  # Import your models here

admin.site.register(Farm)
admin.site.register(Feedback)
