<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.io.*,com.mitul.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="buy.css" />
<script type="text/javascript">
function valida(id){
	
	var fname="";var pin="";var add="";var phone="";var lname="";var email="";var qty=1;
	
		 var message="";
		 fname=document.getElementById("first_name").value;
		 lname=document.getElementById("last_name").value;
		 pin=document.getElementById("pincode").value;
		 add=document.getElementById("address").value;
		 phone=document.getElementById("phone").value;
		 email=document.getElementById("email").value;
                 qty = document.getElementById("quantity").value;
                 
		var index1=-1;
		var index2=-1;
                    
                    if(qty == ""){
                        qty = 1;
                    }
                    
		if(fname=="" || pin=="" || add=="" || phone=="" || email=="" || lname=="" ){
			
			message=message+"can't leave any field empty";
		}
		if(isNaN(phone) || phone.length!=10){

			message=message+"eneter only digit of excatly 10 size";
		}
		if((index1=email.indexOf("@"))==-1 || (index2=email.indexOf("."))==-1 || email.length<12){

				message=message+"invalid email";
		}	
		if(pin.length!=6 || isNaN(pin)){
			message=message+"invlid pincode";
		}
		if(message==""){

			document.location.href="confirmbuy.jsp?fname="+fname+"&lname="+lname+"&pin="+pin+"&add="+add+"&phone="+phone+"&email="+email+"&myid="+id+"&qty="+qty;
		}
		
}
 function popupfun(id){
            var e = document.getElementById(id);
            if(e.style.display == 'block'){
                e.style.display = 'none';
            }else{
                e.style.display = 'block';
            }
        }
        function checkPass() {
                       
                        var pass1 = document.getElementById('pass1');
                        var pass2 = document.getElementById('pass2');
                        
                        var message = document.getElementById('mess');
                        
                        var goodColor = "#66cc66";
                        var badColor = "#ff6666";
                        
                        if(pass1.value == pass2.value){
                            
                            pass2.style.backgroundColor = goodColor;
                            message.style.color = goodColor;
                            message.innerHTML = "Passwords Match!"
                        }else{
                            pass2.style.backgroundColor = badColor;
                            message.style.color = badColor;
                            message.innerHTML = "Passwords Do Not Match!"
                        }
                    }
        window.onkeydown = function( event ) {
    	    if ( event.keyCode == 27 ) {
    	      document.getElementById("popup_box").style.display='none';
    	    }
    	}; 

    	function signup(){



        } 

</script>
</head>
<body>

<%
	
	String s=request.getParameter("id");	
if(s!=null){
	session.setAttribute("id",s);
}
	String imgd="retriveimage.jsp?id="+s;
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=connection.connect();
	PreparedStatement pst=con.prepareStatement("select * from iteams where id=?");
	pst.setInt(1, Integer.parseInt(s));
	ResultSet rs=pst.executeQuery();
	String imgs="retriveimage.jsp?id=";
	if(rs.next()){
		String img=imgs+s;
	//out.println(rs.getString("name"));
	//out.println(rs.getInt("price"));
	
	}%>
        <div id="container">
            <fieldset>
               <!-- <input type="radio"  name="user" onclick="document.getElementById('guest').style.display='block';document.getElementById('login').style.display='none'" /> Guest &nbsp;&nbsp;
                <input type="radio"  name="user" onclick="document.getElementById('login').style.display='block';document.getElementById('guest').style.display='none'" /> Login
               -->
               <input class="swap_guest" type="button" value="Guest" onClick="document.getElementById('guest').style.display='block';document.getElementById('login').style.display='none'" />
               <input class="swap_login" type="button" value="Login" onClick="document.getElementById('login').style.display='block';document.getElementById('guest').style.display='none'" />
               
            </fieldset>
            <div id="guest">
                <center>
                    <form>
                        <input type="text" placeholder="First Name" id="first_name" class="flfield"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" placeholder="Last Name" id="last_name" class="flfield"/> </br>
                        <input type="text" placeholder="Address" id="address" class="tfield"/></br>
                        <input type="text" placeholder="Email" id="email" class="tfield"/></br>
                        <input type="text" placeholder="Phone" id="phone" class="tfield"/></br>
                        <input type="text" placeholder="Pincode" id="pincode" class="tfield"/></br>
                        
                        <input type="button" value="Check Out..!!"  onClick="valida(<%=s %>)" class="submit-button"/> 
                        <input type="reset" value="clear" class="clear-button"/>
                    </form>
            </div>
            <div id="login">
                <center>
                    <form action="login.jsp?id="<%=s %> method="post">
                        
                        <input type="text" placeholder="Email" id="email"  name="email" class="tfield"/></br>
                        <input type="password" placeholder="Password" id="password" name="password" class="tfield"/></br>
                        
                        
                        <input type="submit" value="Login"   class="submit-button"/> 
                        
                    </form>
            </div>
                    <center><a class="signup_link" href="javascript:void(0)" onclick="popupfun('popup_box');">Create An Account</a></center>
        </div>
                    <div id="popup_box" class="popup_position">
                        <div id="popup_wrap">
                            <div id="popup_cont">
                             <a class="close_link" href="javascript:void(0)" onclick="popupfun('popup_box');"><img height="15px" width="15px" src="images.png"></a>
                                <div class="content">
                                    <center>
                                            <form method="post" action="adduser.jsp">
                                                    <h2> Sign up </h2>
                                                    <input type="text" name="first_name" placeholder="First Name" class="tfieldsu">
                                                    <input type="text" name="last_name" placeholder="Last Name" class="tfieldsu">
                                                    <input type="text" name="email" placeholder="Email" class="tfieldsu">
                                                    <input type="password" name="password" placeholder="Password" id="pass1" class="tfieldsu">
                                                    <input type="password" name="cpassword" placeholder="Confirm Password" id="pass2" onkeyup="checkPass(); " class="tfieldsu">
                                                    <input type="submit" class="submit-button1" value="" onclick="clicked()">
                                            </form></br>
                                            
                                    </center>
                                    </div>
                            </div>
                        </div>
                    </div>
                    
        <div class="product_details">
            <img height="350" width="300" src=<%=imgd%>></br></br>
            <div class="det">
            <strong>  Name : </strong><%=rs.getString("name")%></br></br>
            <strong>  Price : </strong><%=rs.getInt("price")%></br></br>
            <label for="quantity">Qty: </label>
            <input id="quantity" min="1" max="5" type="number" name="quantity" value="1" />
            </div>
             
                
        </div>
	
        
</body>
</html>