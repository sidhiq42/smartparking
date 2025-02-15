# Generated by Django 3.2.9 on 2022-10-01 05:56

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('smart', '0023_auto_20221001_1103'),
    ]

    operations = [
        migrations.AddField(
            model_name='booking',
            name='plot',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='smart.plot'),
        ),
        migrations.AddField(
            model_name='booking',
            name='providers',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='smart.provider'),
        ),
    ]
