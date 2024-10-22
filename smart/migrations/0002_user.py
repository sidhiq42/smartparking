# Generated by Django 3.2.13 on 2022-07-30 17:01

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('smart', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='user',
            fields=[
                ('userid', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=50, verbose_name='name')),
                ('gender', models.CharField(max_length=50, verbose_name='gender')),
                ('address', models.CharField(max_length=100, verbose_name='address')),
                ('age', models.CharField(max_length=50, verbose_name='age')),
                ('district', models.CharField(max_length=50, verbose_name='district')),
                ('location', models.CharField(max_length=50, verbose_name='location')),
                ('licenseno', models.CharField(max_length=50, verbose_name='licenseno')),
                ('license', models.FileField(max_length=50, upload_to='', verbose_name='license')),
                ('phoneno', models.CharField(max_length=50, verbose_name='phoneno')),
                ('mailid', models.CharField(max_length=50, verbose_name='mailid')),
                ('username', models.CharField(max_length=50, verbose_name='username')),
                ('password', models.CharField(max_length=50, verbose_name='password')),
                ('accountno', models.CharField(max_length=50, verbose_name='accountno')),
                ('cardno', models.CharField(max_length=50, verbose_name='cardno')),
                ('cardtype', models.CharField(max_length=50, verbose_name='cardtype')),
                ('expdate', models.DateField(max_length=50, verbose_name='expdate')),
                ('cvv', models.CharField(max_length=50, verbose_name='cvv')),
                ('bankname', models.CharField(max_length=50, verbose_name='bankname')),
                ('login', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='smart.login')),
            ],
        ),
    ]
