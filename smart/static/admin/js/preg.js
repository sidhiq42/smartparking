function provider(x){
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
    if(x.address.value == ""){
        alert("please Enter Your address")
        x.address.focus();
        return false;
    }
    if(x.contact1.value == ""){
        alert("please Enter Your contact1")
        x.contact1.focus();
        return false;
    }else if (!x.contact1.value.match(phone)) {
        alert('Your contact1contains invalid characters');
        x.contact1.focus();
        return false;
    }else if (x.contact1.value.length != 10) {
        alert('Invalid contact1');
        x.contact1.focus();
        return false;
    }else {
        var a = x.contact1.value.split("");
        if (a[0] != 9 && a[0] != 8 && a[0] != 7 && a[0] != 6) {
            alert('Invalid contact1');
            x.contact1.focus();
            return false;
        }
    }
    if(x.contact2.value == ""){
        alert("please Enter Your contact2")
        x.contact2.focus();
        return false;
    }else if (!x.contact2.value.match(phone)) {
        alert('Your contact2 contains invalid characters');
        x.contact2.focus();
        return false;
    }else if (x.contact2.value.length != 10) {
        alert('Invalid contact2');
        x.contact2.focus();
        return false;
    }else {
        var a = x.contact2.value.split("");
        if (a[0] != 9 && a[0] != 8 && a[0] != 7 && a[0] != 6) {
            alert('Invalid contact2');
            x.contact2.focus();
            return false;
        }
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
    if(x.username.value == ""){
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
}