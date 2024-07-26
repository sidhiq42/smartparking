function login(x){
    var name = /^[A-Za-z ]+$/;

    if (x.username.value == "") {
        alert('Please enter your username');
        x.username.focus();
        return false;
    }
    else if (!x.username.value.match(name)) {
        alert('Your username contain invalid characters');
        x.username.focus();
        return false;
    }
    if(x.password.value == ""){
        alert("please enter your password");
        x.password.focus();
        return false;
    }
}