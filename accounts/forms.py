from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.db import transaction

from accounts.models import Doctor, User, Patient

class DoctorSignUpForm(UserCreationForm):
    first_name = forms.CharField(required=True)
    last_name = forms.CharField(required=True)
    profile_picture = forms.ImageField(required=False)
    email = forms.EmailField(required=True)
    address_line_1 = forms.CharField(required=True)
    city = forms.CharField(required=True)
    state = forms.CharField(required=True)
    pin_code = forms.CharField(required=True)
    

    class Meta(UserCreationForm.Meta):
        model = User

    @transaction.atomic
    def save(self):
        user = super().save(commit=False)
        user.email = self.cleaned_data.get('email')
        user.is_doctor = True
        user.save()
        doctor = Doctor.objects.create(user=user)
        doctor.first_name = self.cleaned_data.get('first_name')
        doctor.last_name = self.cleaned_data.get('last_name')
        doctor.profile_picture = self.cleaned_data.get('profile_picture')
        doctor.email = self.cleaned_data.get('email')
        doctor.address_line_1 = self.cleaned_data.get('address_line_1')
        doctor.city = self.cleaned_data.get('city')
        doctor.state = self.cleaned_data.get('state')
        doctor.pin_code = self.cleaned_data.get('pin_code')
        doctor.save()
        return user

class PatientSignUpForm(UserCreationForm):
    first_name = forms.CharField(required=True)
    last_name = forms.CharField(required=True)
    profile_picture = forms.ImageField(required=False)
    email = forms.EmailField(required=True)
    address_line_1 = forms.CharField(required=True)
    city = forms.CharField(required=True)
    state = forms.CharField(required=True)
    pin_code = forms.CharField(required=True)
    

    class Meta(UserCreationForm.Meta):
        model = User

    @transaction.atomic
    def save(self):
        user = super().save(commit=False)
        user.email = self.cleaned_data.get('email')
        user.is_patient = True
        user.save()
        patient = Patient.objects.create(user=user)
        patient.first_name = self.cleaned_data.get('first_name')
        patient.last_name = self.cleaned_data.get('last_name')
        patient.profile_picture = self.cleaned_data.get('profile_picture')
        patient.email = self.cleaned_data.get('email')
        patient.address_line_1 = self.cleaned_data.get('address_line_1')
        patient.city = self.cleaned_data.get('city')
        patient.state = self.cleaned_data.get('state')
        patient.pin_code = self.cleaned_data.get('pin_code')
        patient.save()
        return user