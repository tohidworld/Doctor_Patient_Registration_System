from tkinter import Y
from .calendar import create_event
from django.shortcuts import redirect, render
from .models import AppointableDoctor
from .forms import AppointmentForm
import google_auth_oauthlib.flow
import pickle


# Create your views here.

def DoctorView(request):
    if request.user.is_authenticated:
        if request.user.is_patient:
            doctors = AppointableDoctor.objects.all()
            return render(request, 'doctors.html', {'doctors': doctors})
        else:
            msg = 'You Dont Have Pemission To Access This Page'
    else:
        msg = 'You Dont Have Pemission To Access This Page'
    return render(request, 'doctors.html', {'msg': msg})





def BookAppointmentView(request, pk):
    if request.user.is_authenticated:
        if request.user.is_patient:
            form = AppointmentForm()
            doctor = AppointableDoctor.objects.get(doctor=pk)
            context = {'form': form,
                        'url': '/appointment/'+str(pk)+'/confirm-appointment',
                        'doctor': doctor,
            }
            return render(request, 'book-appointment.html', context)
        else:
            msg = 'You Dont Have Pemission To Access This Page'
    else:
        msg = 'You Dont Have Pemission To Access This Page'
    return render(request, 'book-appointment.html', {'msg': msg})

def ConfirmAppointmentView(request, pk):
    if request.user.is_authenticated:
        if request.user.is_patient:
            if request.method == "POST":
                form = AppointmentForm(request.POST)
                if form.is_valid():
                    data = form.save(commit=False)
                    doctor = AppointableDoctor.objects.get(doctor=pk)
                    end_time, created_calender_id = create_event(doctor.credentials,data.start_time,data.date,doctor.doctor.email,data.required_speciality)
                    data.end_time = end_time
                    data.created_calender_id = created_calender_id
                    data.save()    
                    msg = "Appointment Booked Sucessfully"  
                    msg_type = 'success'
                    context = {
                        'doctor': doctor,
                        'appointment_date': data.date,
                        'start_time': data.start_time,
                        'end_time': end_time,
                    }
                else:
                    msg = "Something Went Wrong"
                    msg_type = 'danger'
                return render(request, 'confirm-appointment.html', {'context':context,'msg':msg,'msg_type':msg_type})
        else:
            msg = 'You Dont Have Pemission To Access This Page'
    else:
        msg = 'You Dont Have Pemission To Access This Page'
    return render(request, 'confirm.html', {'msg': msg})

def RegisterForAppointmentView(request):
    if request.user.is_authenticated:
        if request.user.is_doctor:
            scopes = ['https://www.googleapis.com/auth/calendar.events']
            login_hint = request.user.doctor.email
            flow = google_auth_oauthlib.flow.Flow.from_client_secrets_file('appointment\credentials\client_secret.json', scopes=scopes)
            flow.redirect_uri = 'http://localhost:8000/appointment/oauth2callback'
            authorization_url, state = flow.authorization_url(access_type='offline',login_hint=login_hint, include_granted_scopes='true')
            return redirect(authorization_url)
        else:
            msg = 'You Dont Have Pemission To Access This Page'
    else:
        msg = 'You Dont Have Pemission To Access This Page'
    return render(request, 'book-appointment.html', {'msg': msg})

def oauth2callback(request):
    try:
        if request.user.is_authenticated:
            if request.user.is_doctor:
                user_type = request.user.doctor
                scopes = ['https://www.googleapis.com/auth/calendar.events']
                flow = google_auth_oauthlib.flow.Flow.from_client_secrets_file('appointment\credentials\client_secret.json', scopes=scopes)
                flow.redirect_uri = 'http://localhost:8000/appointment/oauth2callback'
                authorization_response = 'http://localhost:8000/appointment/oauth2callback?state='+request.GET['state']+'&code='+request.GET['code']+'&scope='+request.GET['scope']
                flow.fetch_token(authorization_response=authorization_response)
                credentials = flow.credentials
                pickle.dump(credentials, open("appointment\credentials\\"+request.user.username+'.pkl','wb'))
                doctor = AppointableDoctor()
                doctor.doctor = request.user.doctor
                doctor.credentials = request.user.username+'.pkl'
                doctor.save()
                msg = 'You Are Now Eligible For Appointment Booking'
                msg_type = 'success'
            else:
                msg = 'You Dont Have Pemission To Access This Page'
        else:
            msg = 'You Dont Have Pemission To Access This Page'   
    except:
        msg = 'Something Went Wrong'
        msg_type = 'danger'
    return render(request, 'dashboard.html', {'msg': msg,'msg_type':msg_type,'user_type':user_type})
