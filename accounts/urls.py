from django.urls import path
from . import views
from django.contrib.auth.views import LoginView, LogoutView

urlpatterns = [
    path('', views.index, name="home" ),
    path('account/dashboard/', views.dashboardView, name = "dashboard"),
    path('login', LoginView.as_view(), name="login" ),
    path('signup', views.signup, name="signuppage" ),
    path('doctor/signup', views.DoctorSignupView.as_view(), name="doctorsignup" ),
    path('patient/signup', views.PatientSignupView.as_view(), name="patientsignup" ),
    path('logout/', LogoutView.as_view(), name = "logout"),
]
