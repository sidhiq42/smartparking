function privacy(x) {

    if(x.t1.value == ""){
        alert("please enter your old password");
    }
    if(x.t2.value == ""){
        alert("please enter your new password");
        x.newpsw.focus();
    }
    if(x.t3.value == ""){
        alert("please confirm your new password");
        x.vpsw.focus();
    }
    if(x.t2.value != x.t3.value){
        alert("passwords are not matching");
        x.vpsw.focus();
    }
}