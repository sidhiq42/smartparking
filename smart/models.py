from datetime import date
from tkinter import CASCADE
from unicodedata import name
from django.db import models

# Create your models here.
class login(models.Model):
    logid = models.AutoField(primary_key=True)
    username = models.CharField("username",max_length=50)
    password = models.CharField("password",max_length=25)
    role = models.CharField("role",max_length=25)
    temp = models.CharField("temp",max_length=25)

class user(models.Model):
    userid = models.AutoField(primary_key=True)
    login = models.ForeignKey(login,on_delete=models.CASCADE, null=True)
    name = models.CharField("name",max_length=50)
    gender = models.CharField("gender",max_length=50)
    address = models.CharField("address",max_length=100)
    age = models.CharField("age",max_length=50)
    district = models.CharField("district",max_length=50)
    location = models.CharField("location",max_length=50)
    licenseno = models.CharField("licenseno",max_length=50)
    license = models.FileField("license",max_length=50,upload_to="images/")
    phoneno = models.CharField("phoneno",max_length=50)
    mailid = models.CharField("mailid",max_length=50)

class provider(models.Model):
    providerid = models.AutoField(primary_key=True)
    login = models.ForeignKey(login,on_delete=models.CASCADE, null=True)
    name = models.CharField("name",max_length=50)
    address = models.CharField("address",max_length=150)
    contact1 = models.CharField("contact1",max_length=50)
    contact2 = models.CharField("contact2",max_length=50)
    district = models.CharField("district",max_length=50)
    location = models.CharField("location",max_length=50)
    status = models.CharField("status",max_length=50)

    @property
    def getlogin(self):
        return login.objects.get(provider=self)

class plot(models.Model):
    plotid = models.AutoField(primary_key=True)
    district = models.CharField("name",max_length=50)
    location = models.CharField("location",max_length=50)
    totalarea = models.CharField("totalarea",max_length=50)
    plan = models.FileField("plan",max_length=100,upload_to="images/")
    twowheeler = models.CharField("twowheeler",max_length=50)
    tworate = models.CharField("tworate",max_length=50)
    twocapacity = models.CharField("twocapacity",max_length=50)
    twocommission = models.CharField("twocommission",max_length=50)
    threewheeler = models.CharField("threewheeler",max_length=50)
    threerate = models.CharField("threerate",max_length=50)
    threecapacity = models.CharField("threecapacity",max_length=50)
    threecommission = models.CharField("threecommission",max_length=50)
    fourwheeler = models.CharField("fourwheeler",max_length=50)
    fourrate = models.CharField("fourrate",max_length=50)
    fourcapacity = models.CharField("fourcapacity",max_length=50)
    fourcommission = models.CharField("fourcommission",max_length=50)
    provider = models.ForeignKey(provider,on_delete=models.CASCADE, null=True)
    status = models.CharField("status",max_length=50)
    @property
    def getslot(self):
        return slot.objects.get(plot=self)
    @property
    def getslotcount(self):
        data=slot.objects.filter(plot=self).count()
        return data

class feedback(models.Model):
    feedback_id=models.AutoField(primary_key=True)
    userid=models.ForeignKey(user,on_delete=models.CASCADE,null=True)
    sub=models.CharField("sublect",max_length=200)
    feedback=models.CharField("feedback",max_length=500)
    reply=models.CharField("reply",max_length=500)
    #userid,feedback,reply
class complaint(models.Model):
    complaint_id=models.AutoField(primary_key=True)
    staff=models.ForeignKey(provider,on_delete=models.CASCADE,null=True)
    sub=models.CharField("sublect",max_length=200)
    msg=models.CharField("message",max_length=500)
    reply=models.CharField("reply",max_length=500)

class slot(models.Model):
    slotid = models.AutoField(primary_key=True)
    slotplotid = models.ForeignKey(plot,on_delete=models.CASCADE, null=True)
    slotname = models.CharField("slotname",max_length=50)
    amt=models.CharField("amt",max_length=100)
    commission_amt=models.CharField("commission_amt",max_length=100)
    status = models.CharField("status",max_length=50)

    
class district(models.Model):
    district_id=models.AutoField(primary_key=True)
    district=models.CharField("district",max_length=100)
    
class locations(models.Model):
    location_id=models.AutoField(primary_key=True)
    location=models.CharField("location",max_length=100)
    district=models.ForeignKey("district", on_delete=models.CASCADE, null=True)
    
class bank(models.Model):
    bank_id=models.AutoField(primary_key=True)
    holder=models.CharField("holder",max_length=100)
    card=models.CharField("card",max_length=100)
    cvv=models.CharField("cvv",max_length=100)
    exp=models.CharField("exp",max_length=100)
    bal=models.CharField("bal",max_length=100)    



  #seperate table


class VehicleSlot(models.Model):
    vehicle_type=models.CharField(max_length=100)
    plot_id=models.ForeignKey(plot, on_delete=models.CASCADE)
    capacity=models.IntegerField()
    rate=models.IntegerField()
    commission=models.IntegerField()
    available=models.IntegerField()

class booking(models.Model):
    bookingid = models.AutoField(primary_key=True)
    user = models.ForeignKey(user,on_delete=models.CASCADE, null=True)
    plot = models.ForeignKey(plot,on_delete=models.CASCADE, null=True)
    slot=models.ForeignKey(VehicleSlot,on_delete=models.CASCADE,null=True)
    providers=models.ForeignKey(provider,on_delete=models.CASCADE,null=True)
    status=models.CharField("status",max_length=100)