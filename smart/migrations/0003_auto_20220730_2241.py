# Generated by Django 3.2.13 on 2022-07-30 17:11

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('smart', '0002_user'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='user',
            name='password',
        ),
        migrations.RemoveField(
            model_name='user',
            name='username',
        ),
    ]
