from django.urls import path
from . import views

urlpatterns = [
    path('doctors', views.DoctorView, name = "doctors"),
    path('<int:pk>/book-appointment', views.BookAppointmentView, name = "book-appointment"),
    path('<int:pk>/confirm-appointment', views.ConfirmAppointmentView, name = "confirm-appointment"),
    path('register-for-appointment', views.RegisterForAppointmentView, name = "register-for-appointment"),
    path('oauth2callback', views.oauth2callback, name = "oauth2callback"),
]