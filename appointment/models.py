from django.db import models
from accounts.models import Doctor, Patient

# Create your models here.

class AppointableDoctor(models.Model):
    doctor = models.OneToOneField(Doctor, on_delete=models.CASCADE, primary_key=True)
    credentials = models.CharField(max_length=30)
    def __str__(self):
        return self.doctor.user.username

class Appointment(models.Model):
    doctor = models.ForeignKey(AppointableDoctor, on_delete=models.CASCADE)
    patient = models.ForeignKey(Patient, on_delete=models.CASCADE)
    required_speciality = models.CharField("Required speciality",max_length=250)
    date = models.DateField("Date")
    start_time = models.TimeField("Appointment time")
    end_time = models.TimeField()
    created_calender_id = models.CharField("Created Calendar Id",max_length=250, blank=True)

    
    def __str__(self):
        return 'Appointment Of '+self.patient.user.username+" With "+self.doctor.doctor.user.username
