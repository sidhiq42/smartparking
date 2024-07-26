from asyncio.windows_events import NULL
from urllib import response
from django.shortcuts import render,redirect
from django.http import HttpResponse
from datetime import date

from.models import login as log,user as usr,provider as pro,plot as pt,complaint as cm,feedback as fb,slot as st,booking as bk,bank as bnk,VehicleSlot

def index(request):
    msg=request.GET.get("msg","")
    return render(request,"index.html",{"msg":msg})

def admin(request):
    msg=request.GET.get("msg","")
    return render(request,"admin.html",{"msg":msg})

def adminhome(request):
    msg=request.GET.get("msg","")
    return render(request,"adminhome.html",{"msg":msg})

def providerlist(request):
    msg=request.GET.get("msg","")
    data=pro.objects.all()
    return render(request,"providerlist.html",{"data":data,"msg":msg})

def plotlist(request):
    msg=request.GET.get("msg","")
    data=pt.objects.filter(status="waiting").all()
    return render(request,"plotlist.html",{"data":data,"msg":msg})

def approveplot(request):
    id=request.POST["pid"]
    pt.objects.filter(plotid=id).update(status="approved")
    response=redirect("/plotlist?msg=Plot Approved")
    return response

def rejectplot(request):
    id=request.POST["pid"]
    pt.objects.filter(plotid=id).update(status="rejected")
    response=redirect("/plotlist?msg=Plot Rejected")
    return response

def userlist(request):
    msg=request.GET.get("msg","")
    data=usr.objects.all()
    return render(request,"userlist.html",{"data":data,"msg":msg})

def bookinglist(request):
    msg=request.GET.get("msg","")
    datab=bk.objects.filter(status="approved").all()
    return render(request,"bookinglist.html",{"msg":msg,"datab":datab})

def bookapproval(request):
    id=request.POST["bookingid"]
    bk.objects.filter(bookingid=id).update(status="accepted")
    response = redirect("/bookinglist")
    return response

def bookslotapprove(request):
    id=request.POST["pid"]
    st.objects.filter(slotid=id).update(status="approved")  
    data=st.objects.get(slotid=id)
    userid=request.session["id"]
    datal=log.objects.get(logid=userid)
    datau=usr.objects.get(login=datal)
    bk.objects.create(slot=data,user=datau,status="approved")
    response=redirect("/search?msg=booked")
    return response
    
def slotbukapproval(request):
    id=request.POST["pid"]
    data=VehicleSlot.objects.get(id=id)
    if int(data.available)>0:
        userid=request.session["id"]
        datal=log.objects.get(logid=userid)
        datau=usr.objects.get(login=datal)
        bk.objects.create(slot=data,user=datau,status="approved")
        data.available=int(data.available-1)
        data.save()    # save() to save the new value to table
        response=redirect("/book")
        return response 
    response=redirect("/user?No slot available")
    return response
    

def commissionlist(request):
    msg=request.GET.get("msg","")
    return render(request,"commissionlist.html",{"msg":msg})

def complaintlist(request):
    msg=request.GET.get("msg","")
    data=com.objects.all()
    return render(request,"complaintlist.html",{"data":data,"msg":msg})

def deletecomplaint(request):
    id=request.POST['cid']
    com.objects.filter(complaintid=id).delete()
    response = redirect("/complaintlist?msg=Complaint deleted successfully")
    return response

def feedbacklist(request):
    msg=request.GET.get("msg","")
    data=fb.objects.all()
    return render(request,"feedbacklist.html",{"msg":msg,"data":data})

def deletefeedback(request):
    id=request.POST['fid']
    fb.objects.filter(feedbackid=id).delete()
    response = redirect("/feedbacklist?msg=Feedback deleted successfully")
    return response

def paymentlist(request):
    msg=request.GET.get("msg","")
    return render(request,"paymentlist.html",{"msg":msg})

def adprivacy(request):
    msg=request.GET.get("msg","")
    return render(request,"adprivacy.html",{"msg":msg})

def provider(request):
    msg=request.GET.get("msg","")
    return render(request,"provider.html",{"msg":msg})

def providerhome(request):
    msg=request.GET.get("msg","")
    return render(request,"providerhome.html",{"msg":msg})

def regplot(request):
    msg=request.GET.get("msg","")
    return render(request,"regplot.html",{"msg":msg})

def plot(request):
    if request.POST:
        id=request.session['id']
        datal=log.objects.get(logid=id)
        datap=pro.objects.get(login=datal)        
        t1=request.POST['t1']        
        t3=request.POST['t3']  
        t4=request.POST['t4']  
        file=request.FILES['file']     
        user=pt.objects.create(district=t1,location=t3,totalarea=t4,plan=file,provider=datap,status="waiting")
        two=request.POST['two']
        if two!=' ':
            twrate=request.POST['t9']
            twcapacity=request.POST['t12']
            twcommission=request.POST['t15']
            twavailable=twcapacity
            VehicleSlot.objects.create(vehicle_type=two,plot_id=user,capacity=twcapacity,rate=twrate,commission=twcommission,available=twavailable)
        three=request.POST["three"]
        if three!=' ':
            thrate=request.POST['t10']
            thcapacity=request.POST['t13']
            thcommission=request.POST['t16']
            thavailable=thcapacity
            VehicleSlot.objects.create(vehicle_type=three,plot_id=user,capacity=thcapacity,rate=thrate,commission=thcommission,available=thavailable)
        four=request.POST["four"]
        if four!=' ':
            frate=request.POST['t11']            
            fcapacity=request.POST['t14']  
            fcommission=request.POST['t17']
            favailable=fcapacity
            VehicleSlot.objects.create(vehicle_type=four,plot_id=user,capacity=fcapacity,rate=frate,commission=fcommission,available=favailable)
        response = redirect('/regplot?msg=Registered successfull')
        return response
    else:
        response = redirect("/regplot?msg=Registration failed")
        return response
def viewplots(request):
    id=request.session['id']
    datal=log.objects.get(logid=id)
    datau=pro.objects.get(login=datal)
    datap=pt.objects.filter(provider=datau).all()
    return render(request,"viewplots.html",{"datap":datap})

def addslots(request):
    id=request.session['id']
    datal=log.objects.get(logid=id)
    datau=pro.objects.get(login=datal)
    datap=pt.objects.filter(provider=datau,status="approved").all()
    return render(request,"addslots.html",{"datap":datap})

def slot1(request):
    if request.POST:
        id=request.session['id']
        datad=pt.objects.get(plotid=id)
        twocapacity=request.GET.get("twocapacity")
        data2=pt.objects.filter(twocapacity=twocapacity).count()
        for i in range(data2):
            t1=request.POST["t1"]
            t2=request.POST["t2"]
            t3=(int(t2)-(10/100)*int(t2))
            t4=str(t3)
            st.objects.create(slotname=t1,amt=t2,slotplotid=datad,commission_amt=t4,status="0")
            i+=1
        response = redirect('/addslots?msg=slot added successfull')
        return response
    else:
        response = redirect("/addslots?msg=Operation failed")
        return response
    
def slot(request):
    if request.POST:
        id=request.POST['pid']
        print(id)
        datad=pt.objects.get(plotid=id)
        print(datad)
        t1=request.POST["t1"]
        st.objects.create(slotname=t1,slotplotid=datad,status="0")
        response = redirect('/addslots?msg=slot added successfull')
        return response
    else:
        response = redirect("/addslots?msg=Operation failed")
        return response

def slot2(request):
    if request.POST:
        id=request.POST['pid']
        print(id)
        datad=pt.objects.get(plotid=id)
        print(datad)
        threecapacity=request.GET.get("threecapacity")
        data2=pt.objects.filter(threecapacity=threecapacity).count()
        for i in range(data2):
            t1=request.POST["t1"]
            st.objects.create(slotname=t1,slotplotid=datad,status="0")
        response = redirect('/addslots?msg=slot added successfull')
        return response
    else:
        response = redirect("/addslots?msg=Operation failed")
        return response

def parking(request):
    msg=request.GET.get("msg","")
    return render(request,"parking.html",{"msg":msg})

def staff_complaints(request):
    if request.POST:
        t1= request.POST["t1"]
        t2= request.POST["t2"]
        cm.objects.filter(complaint_id=t1).update(reply=t2)
    data=cm.objects.all()
    return render(request,"staff_feed.html",{"data":data})

def complaints(request):
    id=request.session['id']
    datal=log.objects.get(logid=id)
    datas=pro.objects.get(login=datal)
    if request.POST:
        t1=request.POST["subject"]
        t2=request.POST["msg"]
        cm.objects.create(staff=datas,sub=t1,msg=t2,reply="")
    data=cm.objects.filter(staff=datas).all()
    return render(request,"complaint.html",{"data":data})

def feedback(request):
    if request.POST:
        t1= request.POST["t1"]
        t2= request.POST["t2"]
        fb.objects.filter(feedback_id=t1).update(reply=t2)
    data=fb.objects.all()
    return render(request,"feedback.html",{"data":data})

def fd(request):
    id=request.session['id']
    datal=log.objects.get(logid=id)
    datau=usr.objects.get(login=datal)
    if request.POST:
        t1=request.POST["feedback"]
        t2=request.POST["sub"]
        fb.objects.create(userid=datau,sub=t2,feedback=t1,reply="")
    data=fb.objects.filter(userid=datau).all()
    return render(request,"feedbacklist.html",{"data":data})

def prpaylist(request):
    msg=request.GET.get("msg","")
    return render(request,"prpaylist.html",{"msg":msg})

def viewbooking(request):
    msg=request.GET.get("msg","")
    id=request.session['id']
    datab=bk.objects.filter(status="accepted").all()
    return render(request,"viewbooking.html",{"msg":msg,"datab":datab})

def payadmin(request):
    msg=request.GET.get("msg","")
    return render(request,"payadmin.html",{"msg":msg})

def viewcancellation(request):
    msg=request.GET.get("msg","")
    return render(request,"viewcancellation.html",{"msg":msg})

def provprofile(request):
    msg=request.GET.get("msg","")
    id=request.session["id"]
    datal=log.objects.get(logid=id)
    datap=pro.objects.filter(login=datal)
    return render(request,"provprofile.html",{"msg":msg,"datap":datap})

def updateprof(request):
    id=request.POST["providerid"]
    t1=request.POST["t1"]
    t2=request.POST["t2"]
    t3=request.POST["t3"]
    t4=request.POST["t4"]
    t5=request.POST["t5"]
    t6=request.POST["t6"]
    pro.objects.filter(providerid=id).update(name=t1,address=t2,contact1=t3,contact2=t4,district=t5,location=t6)
    response = redirect('/providerhome?msg=Updated successfully')
    return response

def user(request):
    msg=request.GET.get("msg","")
    return render(request,"user.html",{"msg":msg})

def book(request):
    msg=request.GET.get("msg","")
    datad=VehicleSlot.objects.all()
    
    datap=pt.objects.filter(status='approved')
    return render(request,"book.html",{"msg":msg,"datad":datad,'datap':datap})

def proprivacy(request):
    msg=request.GET.get("msg","")
    return render(request,"proprivacy.html",{"msg":msg})

def change(request):
    if request.POST:
        t1=request.POST["t1"]
        t2=request.POST["t2"]
        id=request.session['id']
        log.objects.filter(logid=id,password=t1).update(password=t2)
        if(request.session.get('role', ' ')=="admin"):
           response=redirect("/adminhome?msg=Password updated successfully")
           return response
        elif(request.session.get('role', ' ')=="user"):
           response=redirect("/userhome?msg=Password updated successfully")
           return response
        elif(request.session.get('role', ' ')=="provider"):
           response=redirect("/providerhome?msg=Password updated successfully")
           return response

def bklist(request):
    msg=request.GET.get("msg","")
    return render(request,"bklist.html",{"msg":msg})

def pbklist(request):
    msg=request.GET.get("msg","")
    return render(request,"pbklist.html",{"msg":msg})

def parkslots(request):
    msg=request.GET.get("msg","")
    return render(request,"parkslots.html",{"msg":msg})

def search(request):
    msg=request.GET.get("msg","")  
    id=request.session['id']
    print(request.session['id'])
    veh=request.POST['vehicle']
    loc=request.POST['location']
    print(veh,loc)
    datav=VehicleSlot.objects.filter(vehicle_type=veh,plot_id__location=loc)
    print(datav.count())
    data=pt.objects.filter(location=loc)
    # datas=st.objects.all()
    return render(request,"search.html",{"msg":msg,"data":datav})

def shedule(request):
    msg=request.GET.get("msg","")
    return render(request,"shedule.html",{"msg":msg})

def login(request):
     if request.POST:
        username = request.POST["username"]
        password = request.POST["password"]
        try:
            datac = log.objects.filter(username=username, password=password).count()
            if datac==1:
                data=log.objects.get(username=username, password=password)
                if data.role=="admin":
                    request.session['username'] = data.username
                    request.session['role'] = data.role
                    request.session['id'] = data.logid
                    response = redirect('/adminhome?msg=welcome admin')
                    return response
                elif data.role=="user":
                    request.session['username'] = data.username
                    request.session['role'] = data.role
                    request.session['id'] = data.logid
                    response = redirect('/user?msg=Welcome user')
                    return response
                elif data.role=="provider":
                    request.session['username'] = data.username
                    request.session['role'] = data.role
                    request.session['id'] = data.logid
                    response = redirect('/providerhome?msg=Welcome provider')
                    return response
                else :
                    response = redirect('/index?msg=invalid access')
                    return response


            else:
                response = redirect('/index?msg=invalid username or password')
                return response
               
        except:
            response = redirect('/index?msg=something went wrong')
            return response
     else:
        response = redirect('/index?msg=exception occured')
        return response

def logout(request):
    try:
        del request.session['id']
        del request.session['role']
        del request.session['username']
        response = redirect("/index?id=logout")
        return response
    except:
        response = redirect("/index?id=logout")
        return response

def userreg(request):
    if request.POST:
        name=request.POST["name"]
        gender=request.POST["gender"]
        address=request.POST["address"]
        age=request.POST["age"]
        district=request.POST["district"]
        location=request.POST["location"]
        licenseno=request.POST["licenseno"]
        license=request.FILES["license"]
        phoneno=request.POST["phoneno"]
        mailid=request.POST["mailid"]
        username=request.POST["username"]
        password=request.POST["password"]
        
        log.objects.create(username=username,password=password,role="user")
        datal=log.objects.last()
        usr.objects.create(login=datal,name=name,gender=gender,address=address,age=age,district=district,location=location,licenseno=licenseno,license=license
        ,phoneno=phoneno,mailid=mailid)
        response = redirect('/index?msg=Registration successfull')
        return response
    else:
        response = redirect("/index?msg=Registration failed")
        return response

def provreg(request):
    if request.POST:
        name=request.POST["name"]
        address=request.POST["address"]
        contact1=request.POST["contact1"]
        contact2=request.POST["contact2"]
        district=request.POST["district"]
        location=request.POST["location"]
        username=request.POST["username"]
        password=request.POST["password"]
        log.objects.create(username=username,password=password,temp="provider")
        datal=log.objects.last()
        pro.objects.create(login=datal,name=name,address=address,contact1=contact1,contact2=contact2,district=district,
        location=location,status="waiting")
        response = redirect('/index?msg=Registration successfull {Waiting for Admin approval!}')
        return response
    else:
        response = redirect("/index?msg=Registration failed")
        return response

def approvepro(request):
    id=request.POST["pid"]
    pro.objects.filter(providerid=id).update(status="approved")
    datad=pro.objects.get(providerid=id)
    log.objects.filter(logid=datad.login.logid).update(role="provider")
    response=redirect("/providerlist?msg=Provider Approved")
    return response
    
def getLocation(request):
    id=request.GET["id"]
    datast=dist.objects.get(district_id=id)
    datadt=loc.objects.filter(district=datast).all()
    res="<option value=''>-select-</option>"
    for d in datadt:
        res+="<option value='"+str(d.location_id)+"'>"+d.location+"</option>"
    return HttpResponse(res)


def add_location(request):
    msg=""
    data=dist.objects.all()
    if request.POST:
        t1=request.POST["district"]
        t2=request.POST["location"]
        datadt=dist.objects.get(district_id=t1)
        loc.objects.create(district=datadt,location=t2)
        msg="inserted successfully"
    return render(request,"add_location.html",{"msg":msg,"data":data})
    
def rejectpro(request):
    id=request.POST["pid"]
    pro.objects.filter(providerid=id).update(status="rejected")
    datad=pro.objects.get(providerid=id)
    log.objects.filter(logid=datad.login.logid).update(role="rejected")
    response=redirect("/providerlist?msg=Provider Rejected")
    return response

def getDistrict(request):
    name=request.GET["name"]
    datast=pt.objects.filter(district=name).all()
    res="<option value=''>-select-</option>"
    for d in datast:
        res+="<option value='"+str(d.district_id)+"'>"+d.district+"</option>"
    return HttpResponse(res)
    
def request_payment(request):
    lid=request.POST["lid"]
    bk.objects.filter(bookingid=lid).update(status="paymentrequested")
    return redirect("/viewbooking")

def waiting_payment(request):
    datag=bk.objects.filter(status="paymentrequested").all()
    return render(request,"waiting_payment.html",{"data":datag})

def payment_request(request):
    id=request.session['id']
    datal=log.objects.get(logid=id)
    datau=usr.objects.get(login=datal)
    msg=""
    if request.POST:
        t1=request.POST["lid"] 
        t2=request.POST["holder"]
        t3=request.POST["card"]
        t4=request.POST["cvv"]
        t5=request.POST["exp"]
        t6=int(request.POST["rate"])
        print(t6)
        print(t2)
        bcc=bnk.objects.filter(holder=t2,card=t3,cvv=t4,exp=t5).count()
        print(bcc)
        if bcc==1:
            datb=bnk.objects.get(holder=t2,card=t3,cvv=t4,exp=t5)
            bal=int(datb.bal)
            if bal < t6 :
                msg="insufficient Balance"
            else:
                bmt=bal-t6
                bnk.objects.filter(holder=t2,card=t3,cvv=t4,exp=t5).update(bal=bmt)
                bk.objects.filter(bookingid=t1).update(status="completed")
                msg="payment successfull"
        else :
            msg="invalid account details"


    datag=bk.objects.filter(status="paymentrequested",user_id=datau).all()
    datac=bk.objects.filter(status="paymentrequested",user_id=datau).count()
    return render(request,"payment_request.html",{"data":datag,"datac":datac,"msg":msg})
def payment_completed(request):
    datag=bk.objects.filter(status="completed").all()
    return render(request,"payment_completed.html",{"data":datag})
def payment_history(request):
    datag=bk.objects.filter(status="completed").all()
    return render(request,"payment_history.html",{"data":datag})    
def payment_completedpro(request):
    datag=bk.objects.filter(status="paid").all()
    return render(request,"commissionlist.html",{"data":datag})
def payment_requestpro(request):
    id=request.session['id']
    datal=log.objects.get(logid=id)
    datau=pro.objects.get(login=datal)
    msg=""
    if request.POST:
        t1=request.POST["lid"] 
        t2=request.POST["holder"]
        t3=request.POST["card"]
        t4=request.POST["cvv"]
        t5=request.POST["exp"]
        t6=int(request.POST["commission"])
        
        print(t6)
        print(t2)
        bcc=bnk.objects.filter(holder=t2,card=t3,cvv=t4,exp=t5).count()
        print(bcc)
        if bcc==1:
            datb=bnk.objects.get(holder=t2,card=t3,cvv=t4,exp=t5)
            bal=int(datb.bal)
            if bal < t6 :
                msg="insufficient Balance"
            else:
                bmt=bal-t6
                bnk.objects.filter(holder=t2,card=t3,cvv=t4,exp=t5).update(bal=bmt)
                bk.objects.filter(bookingid=t1).update(status="paid")
                msg="payment successfull"
        else :
            msg="invalid account details"


    datag=bk.objects.filter(status="completed").all()
    datac=bk.objects.filter(status="completed",providers_id=datau).count()
    return render(request,"payment_requestpro.html",{"data":datag,"datac":datac,"msg":msg})
