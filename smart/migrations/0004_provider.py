# Generated by Django 3.2.13 on 2022-07-30 17:25

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('smart', '0003_auto_20220730_2241'),
    ]

    operations = [
        migrations.CreateModel(
            name='provider',
            fields=[
                ('providerid', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=50, verbose_name='name')),
                ('address', models.CharField(max_length=50, verbose_name='address')),
                ('contact1', models.CharField(max_length=50, verbose_name='contact1')),
                ('contact2', models.CharField(max_length=50, verbose_name='contact2')),
                ('district', models.CharField(max_length=50, verbose_name='district')),
                ('location', models.CharField(max_length=50, verbose_name='location')),
                ('login', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='smart.login')),
            ],
        ),
    ]
