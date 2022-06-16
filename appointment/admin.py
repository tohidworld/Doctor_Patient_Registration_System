from django.contrib import admin
from .models import AppointableDoctor, Appointment

# Register your models here.
admin.site.register(AppointableDoctor)
admin.site.register(Appointment)
