from django.shortcuts import render, redirect
from django.contrib.auth import login
from django.contrib.auth.decorators import login_required

# Create your views here.
from django.views.generic import CreateView

from .forms import DoctorSignUpForm, PatientSignUpForm
from .models import  User, Doctor

@login_required
def dashboardView(request):
    return render(request, 'dashboard.html')

def index(request):
    return render(request, 'index.html')

def login(request):
    return render(request, 'login.html')

def signup(request):
    return render(request, 'signup.html')

class DoctorSignupView(CreateView):
    model = User
    form_class = DoctorSignUpForm
    template_name = 'doctor_signup.html'

    def get_context_data(self, **kwargs):
        kwargs['user_type'] = 'doctor'
        return super().get_context_data(**kwargs)
    
    def form_valid(self, form):
        user = form.save()
        return redirect('home')

class DoctorSignupView(CreateView):
    model = User
    form_class = DoctorSignUpForm
    template_name = 'doctor_signup.html'

    def get_context_data(self, **kwargs):
        kwargs['user_type'] = 'doctor'
        return super().get_context_data(**kwargs)
    
    def form_valid(self, form):
        user = form.save()
        return redirect('home')

class PatientSignupView(CreateView):
    model = User
    form_class = PatientSignUpForm
    template_name = 'patient_signup.html'

    def get_context_data(self, **kwargs):
        kwargs['user_type'] = 'patient'
        return super().get_context_data(**kwargs)
    
    def form_valid(self, form):
        user = form.save()
        return redirect('home')