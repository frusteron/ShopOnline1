function cambia(){
	if(document.getElementById("password").type == "password") {
		document.getElementById("password").type = "text";
	}else{
		document.getElementById("password").type = "password";
	}
	return false;
}