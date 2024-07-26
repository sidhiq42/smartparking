function reg(x){
    var name = /^[A-Za-z ]+$/;
	var phone = /^[0-9]+$/;

    if(x.name.value == ""){
        alert("please Enter Your name")
        x.name.focus();
        return false;
    }else if (!x.name.value.match(name)) {
        alert('Your name contain invalid characters');
        x.name.focus();
        return false;
    }
    if(x.gender.value == ""){
        alert("please Select Your gender")
        return false;
    }
    if(x.address.value == ""){
        alert("please Enter Your address")
        x.address.focus();
        return false;
    }
    if(x.age.value == ""){
        alert("please Enter Your age")
        x.age.focus();
        return false;
    }
    if(x.district.value == "selects"){
        alert("please Select Your district")
        x.district.focus();
        return false;
    }
    if(x.location.value == ""){
        alert("please Enter Your location")
        x.location.focus();
        return false;
    }else if (!x.location.value.match(name)) {
        alert('Your location contains invalid characters');
        x.location.focus();
        return false;
    }
    if(x.licenseno.value == ""){
        alert("please Enter Your licenseno")
        x.licenseno.focus();
        return false;
    }
    if(x.license.value == ""){
        alert("please upload your License photo")
        x.license.focus();
        return false;
    }
    if(x.phoneno.value == ""){
        alert("please Enter Your mobile number")
        x.phoneno.focus();
        return false;
    }else if (!x.phoneno.value.match(phone)) {
        alert('Your mobile number contains invalid characters');
        x.phoneno.focus();
        return false;
    }else if (x.phoneno.value.length != 10) {
        alert('Invalid mobile number');
        x.phoneno.focus();
        return false;
    }else {
        var a = x.phoneno.value.split("");
        if (a[0] != 9 && a[0] != 8 && a[0] != 7 && a[0] != 6) {
            alert('Invalid mobile number');
            x.phoneno.focus();
            return false;
        }
    }
    if(x.mailid.value == ""){
        alert("please Enter Your mailid")
        x.mailid.focus();
        return false;
    }if(x.username.value == ""){
        alert("please Enter Your username")
        x.username.focus();
        return false;
    }else if (!x.username.value.match(name)) {
        alert('Your username contains invalid characters');
        x.username.focus();
        return false;
    }
    if(x.password.value == ""){
        alert("please Enter Your password")
        x.password.focus();
        return false;
    }
    if(x.accountno.value == ""){
        alert("please Enter Your accountno")
        x.accountno.focus();
        return false;
    }
    if(x.cardno.value == ""){
        alert("please Enter Your cardno")
        x.cardno.focus();
        return false;
    }
    if(x.cardtype.value == "selects"){
        alert("please Choose Your cardtype")
        x.cardtype.focus();
        return false;
    }
    if(x.expdate.value == ""){
        alert("please Choose Your expdate")
        x.expdate.focus();
        return false;
    }
    if(x.cvv.value == ""){
        alert("please Enter Your cvv")
        x.cvv.focus();
        return false;
    }else if (x.cvv.value.length != 3) {
        alert('Invalid cvv');
        x.cvv.focus();
        return false;
    }
    if(x.bankname.value == "selects"){
        alert("please Select Your bankname")
        x.bankname.focus();
        return false;
    }
}