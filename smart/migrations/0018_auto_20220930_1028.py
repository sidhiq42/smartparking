# Generated by Django 3.2.14 on 2022-09-30 04:58

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('smart', '0017_booking_slot'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='user',
            name='accountno',
        ),
        migrations.RemoveField(
            model_name='user',
            name='bankname',
        ),
        migrations.RemoveField(
            model_name='user',
            name='cardno',
        ),
        migrations.RemoveField(
            model_name='user',
            name='cardtype',
        ),
        migrations.RemoveField(
            model_name='user',
            name='cvv',
        ),
        migrations.RemoveField(
            model_name='user',
            name='expdate',
        ),
    ]
