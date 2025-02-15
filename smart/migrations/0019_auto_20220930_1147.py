# Generated by Django 3.2.14 on 2022-09-30 06:17

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('smart', '0018_auto_20220930_1028'),
    ]

    operations = [
        migrations.CreateModel(
            name='district',
            fields=[
                ('district_id', models.AutoField(primary_key=True, serialize=False)),
                ('district', models.CharField(max_length=100, verbose_name='district')),
            ],
        ),
        migrations.RemoveField(
            model_name='plot',
            name='place',
        ),
        migrations.CreateModel(
            name='locations',
            fields=[
                ('location_id', models.AutoField(primary_key=True, serialize=False)),
                ('location', models.CharField(max_length=100, verbose_name='location')),
                ('district', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='smart.district')),
            ],
        ),
    ]
