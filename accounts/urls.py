from django.urls import path
from . import views
from django.contrib.auth.views import LoginView, LogoutView

urlpatterns = [
    path('', views.index, name="home" ),
    path('dashboard/doctor', views.dashboardView, name = "doctor_dashboard"),
    path('dashboard/patient', views.dashboardView, name = "patient_dashboard"),
    path('login', views.login_view, name="login" ),
    path('signup', views.signup, name="signuppage" ),
    path('signup/doctor', views.DoctorSignupView.as_view(), name="doctorsignup" ),
    path('signup/patient', views.PatientSignupView.as_view(), name="patientsignup" ),
    path('logout/', LogoutView.as_view(), name = "logout"),
]
