# Generated by Django 4.0.5 on 2022-06-12 08:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0002_rename_address1_doctor_address_line_1_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='doctor',
            name='profile_picture',
            field=models.ImageField(upload_to='profile'),
        ),
    ]
