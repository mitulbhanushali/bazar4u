<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script>
var first=0;
var second=0;
function checkcapcha(){

var val=document.getElementById("capchaval").value;
if(val==(first+second)){

	return true;
}
else{
	generatecapcha();
	return false;
}
	
}
function generatecapcha(){
	first=Math.floor((Math.random()+1)*10);
	second=Math.floor((Math.random()+1)*10);
	document.getElementById("capcha").innerHTML=first+"+"+second+"=";
}

</script>
</head>
<body onLoad="generatecapcha()">
<form onsubmit="return checkcapcha()" action="sendotp" method="post">
username:<input type="text" name="uname"> </br>
email:<input type="text" name="email">
<p id="capcha"> </p>
capcha:<input type="text" name="capcha" id="capchaval"></br>
<input type="submit" value="singup">


</form>

</body>
</html>