from django.db import models
from django.conf import settings
User = settings.AUTH_USER_MODEL
from django.urls import reverse
# Create your models here.

class Category(models.Model):
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name

class Post(models.Model):
    title = models.CharField(max_length=255)
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    image = models.ImageField(upload_to='post')
    category = models.CharField(max_length=255, default='Mental Health')
    summary = models.TextField()
    content = models.TextField()
    draft = models.BooleanField(default=False)
    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return reverse("doctor_dashboard")
    
