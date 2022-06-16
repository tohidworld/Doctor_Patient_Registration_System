
from django.contrib import messages
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from django.contrib.messages.views import SuccessMessageMixin

# Create your views here.
from django.views.generic import CreateView
from .forms import DoctorSignUpForm, PatientSignUpForm, LoginForm
from .models import  User
from appointment.models import AppointableDoctor

def dashboardView(request):
    show_appointment_registration = False
    if request.user.is_doctor:
        user_type = request.user.doctor
        pk = request.user.doctor.pk
        try:
            AppointableDoctor.objects.get(doctor=pk)
        except:
            show_appointment_registration = True
    elif request.user.is_patient:
        user_type = request.user.patient
    return render(request, 'dashboard.html', {'user_type': user_type,'show_appointment_registration':show_appointment_registration})
'''class dashboardView(ListView):
    if user.is_patient:
        pass
    template_name = 'dashboard.html'''

def index(request):
    return render(request, 'index.html')

def login_view(request):
    form = LoginForm(request.POST or None)
    msg = None
    if request.method == 'POST':
        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(username=username, password=password)
            if user is not None and user.is_doctor:
                login(request, user)
                return redirect('doctor_dashboard')
            elif user is not None and user.is_patient:
                login(request, user)
                return redirect('patient_dashboard')
            else:
                msg = 'Invalid Credentials'
        else:
            msg = 'error validating form'
    return render(request, 'login.html', {'form':form, 'msg':msg})

def signup(request):
    return render(request, 'signup.html')

class DoctorSignupView(CreateView):
    model = User
    form_class = DoctorSignUpForm
    template_name = 'registration.html'
    success_message = "Doctor Registered Sucessfully"

    def get_context_data(self, **kwargs):
        kwargs['user_type'] = 'patient'
        return super().get_context_data(**kwargs)
        
    def form_valid(self, form):
        user = form.save()
        success_message = self.get_success_message(form.cleaned_data)
        if success_message:
            messages.success(self.request, success_message)
        return redirect('signuppage')
    
    def get_success_message(self, cleaned_data):
        return self.success_message % cleaned_data


class PatientSignupView(SuccessMessageMixin, CreateView):
    model = User
    form_class = PatientSignUpForm
    template_name = 'registration.html'
    success_message = "Patient Registered Sucessfully"

    def get_context_data(self, **kwargs):
        kwargs['user_type'] = 'patient'
        return super().get_context_data(**kwargs)
    
    def form_valid(self, form):
        user = form.save()
        success_message = self.get_success_message(form.cleaned_data)
        if success_message:
            messages.success(self.request, success_message)
        return redirect('signuppage')
    
    def get_success_message(self, cleaned_data):
        return self.success_message % cleaned_data