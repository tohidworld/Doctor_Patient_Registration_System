from django.contrib import admin

# Register your models here.

from accounts.models import User, Doctor, Patient

admin.site.register(User)
admin.site.register(Doctor)
admin.site.register(Patient)