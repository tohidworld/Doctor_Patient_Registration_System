from django import forms
from .models import Appointment, AppointableDoctor

class AppointmentForm(forms.ModelForm):
    class Meta:
        model = Appointment
        fields = ('doctor', 'patient', 'required_speciality', 'date', 'start_time')

        widgets = {
            'doctor': forms.Select(attrs={"class": "form-control",'id': 'doctor'}),
            'patient': forms.Select(attrs={"class": "form-control",'id': 'patient'}),
            'required_speciality': forms.TextInput(attrs={"class": "form-control col-md-6"}),
            #'date': forms.DateField(attrs={"class": "form-control"}),
            #'start_time': forms.TimeField(attrs={"class": "form-control"}),
            #'end_time': forms.TimeField(attrs={"class": "form-control"}),
            #'draft': forms.CheckboxInput(attrs={"class": "form-control"})
        }
    

