from django.db import models
from django.urls import reverse

# Create your models here.
from django.contrib.auth.models  import AbstractUser

class User(AbstractUser):
    is_doctor = models.BooleanField(default=False)
    is_patient = models.BooleanField(default=False)

class Doctor(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    profile_picture = models.ImageField(upload_to='profile')
    email = models.EmailField()
    address_line_1 = models.CharField("Address line 1", max_length=1024)
    city = models.CharField("City", max_length=1024)
    state = models.CharField("State",max_length=1024,)
    pin_code = models.CharField("Pin code", max_length=12)
    
    def __str__(self):
        return self.user.username

class Patient(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    profile_picture = models.ImageField(upload_to='profile')
    email = models.EmailField()
    address_line_1 = models.CharField("Address line 1", max_length=1024)
    city = models.CharField("City", max_length=1024)
    state = models.CharField("State",max_length=1024,)
    pin_code = models.CharField("Pin code", max_length=12)

    def __str__(self):
        return self.user.username

    
