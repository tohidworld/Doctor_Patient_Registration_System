# Generated by Django 4.0.5 on 2022-06-12 08:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0002_remove_post_published_post_draft'),
    ]

    operations = [
        migrations.AlterField(
            model_name='post',
            name='Draft',
            field=models.BooleanField(default=False),
        ),
    ]
