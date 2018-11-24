<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, java.io.*, com.mitul.*" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en-US">
<%
Cookie cookie = null;
Cookie[] cookies = null;

// Get an array of Cookies associated with the this domain
cookies = request.getCookies();
int ckscount=0;
String city="";
boolean checkcookie=false;
boolean checkcity=false;
if( cookies != null ) {
	checkcookie=true;
   for (int i = 0; i < cookies.length; i++) {
      cookie = cookies[i];
      
      if((cookie.getName( )).compareTo("city") == 0 ) {

    	  city=cookie.getValue();
    	 ckscount++;
      }
   }
   if(ckscount==1){
		
		response.sendRedirect("https://bazar4u.in/newhomepage.jsp");
	}else{
		checkcity=true;
	}
   	if(!checkcookie || checkcity){
%>

<head>
    <title>Bazar4u | Explore city products</title>
    <meta name="description" content="Buy & sell anything online and create your own customize shop or advertisement that boost your business">
   	 <meta name="keywords" content="bazar4u,bazar,bazaar,market,online shop,online market,product selling,digital bazar,online shop,digitalshop">
   <link rel="icon" type="image/gif" href="image/logo.png">
  
    <meta name="viewport" content="width=device-widht, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <script src="js/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="hell.css" >
    <link rel="stylesheet" href="footer.css" >
  

    
</head>
<script>
var cat=false;
	function checkdata(){
		var data=document.getElementById("city").value;
		if(data=="#"){
			alert("plz select city");
			return false;
		}
	/*	var format = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/;
		var re = /^[A-Za-z]+$/;
		if(data==" " || data==""){
			return false;
		}else if(format.test(data)){
				return false;
		}else if(!isNaN(data)){
				return false;
		}else if(!re.test(data)){

				return false;
		}else{

				return true;
			}*/


	}
	 function checksignup(){

	       
			var fpass=document.getElementById("password").value;
			var spass=document.getElementById("repassword").value;
			var phone=document.getElementById("phone").value;
			var pincode=document.getElementById("pincode").value;
			var shopname=document.getElementById("shopname").value;
			var PHONE_REGEXP = /^[789]\d{9}$/;
			var pincode_regexp= /^([3])([6-9])([0-9]){4}$/;
			/*if(phone.charAt(0)!='9' || phone.charAt(0)=='8' || phone.charAt(0)=='7' || phone.length!=10){
						alert("phone number is not valid");
						return false;
				}*/
			if(!PHONE_REGEXP.test(phone)){

				alert("phone number is not valid");
				return false;
			}
				
			if(!fpass==spass){
				alert("both password should match");
				return false;
			}
			if(!pincode_regexp.test(pincode)){

				alert("pincode invalid");
				return false;
			}
			if(cat){
				var catval=document.getElementById('category').value;
				if(catval=='select'){
						alert("plz select category");
						return false;
				}
				if(shopname=='' || shopname==' ' ){

					alert('plz provide shopname');
					return false;
			}

		}
				
			
		
			return true;

     }

	   function usertype(val){
           var element = document.getElementById('shopopt');
           //alert(val);
           if(val=='shop'){
               cat=true;
             element.style.display='block';
           }
           else{
               cat=false;
             element.style.display='none';
           }
          }

</script>
<body>

	
<div class='jumbotron text-center'>
    <div class='container'>
        <h2 id='hero-questions-h1'>Select city </h2>
    </div>

    
    
    
    <div class='container'>
<div class="row">
<div class="col-sm-offset-3 col-sm-6 text-center">
<form onsubmit="return checkdata();" action="setcity" method="post">
<div class="form-group input-group-lg">
<!--<input type="text" class="form-control city-select" />-->
<select name="city" id="city" class="form-control city-select">
<option style="color: black" value="#" > Select city</option>
  <%
                    	Connection con=connection.connect();
                    	PreparedStatement pst=con.prepareStatement("select distinct city from finaliteams ORDER BY city");
                    	ResultSet rs=pst.executeQuery();
                    	while(rs.next()){
                    %>
<option style="color: black" value="<%= rs.getString("city")%>"> <%= rs.getString("city").substring(0,1).toUpperCase()+rs.getString("city").substring(1,rs.getString("city").length())%></option>
   <% }
                    
                    	rs.close();
                    	pst.close();
                    	con.close();
                    %>
                
</select>
</div>
<input type="submit" id="continue-btn" class="btn btn-success btn-block" value="Continue" />
</form>
</div>
</div>
</div>

    <div class='container'>
        <h2 id='tip'>
            Tip! You will find all the product, events and shops in your city.
        </h2>
    </div>

    
</div>
    <!-- signup Modal -->
<div id="signupmodal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">signup : </h4>
            </div>
            <div class="modal-body">
                <form action="sendotp" method="post">
                    <div class="row">
                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                                <label>First Name<span class="req">*</span> </label>
                                <input type="text" class="form-control" name="fname" id="first_name" required data-validation-required-message="Please enter your name." autocomplete="off">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                                <label> Last Name<span class="req">*</span> </label>
                                <input type="text" class="form-control" name="lname" id="last_name" required data-validation-required-message="Please enter your name." autocomplete="off">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                                <label> Your Email<span class="req">*</span> </label>
                                <input type="email" class="form-control" name="email" id="email" required data-validation-required-message="Please enter your email address." autocomplete="off">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                                <label> Your Phone<span class="req">*</span> </label>
                                <input type="tel" class="form-control" name="phone" id="phone" required data-validation-required-message="Please enter your phone number." autocomplete="off">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                                <label> Password<span class="req">*</span> </label>
                                <input type="password" class="form-control" name="password" id="password" required data-validation-required-message="Please enter your password" autocomplete="off">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                                <label>Re-Password <span id="confirmMessage" class="req confirmMessage">*</span> </label>
                                <input type="password" class="form-control" id="repassword" required data-validation-required-message="Please enter your password" autocomplete="off">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label> Address <span class="req">*</span> </label>
                        <input type="text" class="form-control" name="address" id="address" required data-validation-required-message="Please enter your password" autocomplete="off">
                        <p class="help-block text-danger"></p>
                    </div>

                    <div class="row">
                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                                <label>City<span class="req">*</span> </label>
                                <input type="text" class="form-control" name="city" id="city" required data-validation-required-message="Please enter your password" autocomplete="off">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                                <label>Pincode<span class="req">*</span> </label>
                                <input type="text" class="form-control" name="pincode" id="pincode" required data-validation-required-message="Please enter your password" autocomplete="off">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>User Type<span class="req">*</span> </label>
                        <input type="radio" name="user-type" value="normal" id="user-type" checked="checked" onchange='usertype(this.value);'/> <b>Normal</b> &nbsp;
                        <input type="radio" name="user-type" value="shop" id="user-type" onchange='usertype(this.value);' /> <b>Shop Keeper</b>
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="row" id="shopopt" style="display:none;">
                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                                <label>Shop Name <span class="req">*</span> </label>
                                <input type="text" class="form-control" name="shopname" id="shopname" data-validation-required-message="Please enter your name." autocomplete="off">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                                <label for="idnum">Category : </label>
                                <select class="form-control drop-down-cat" name="cat" id="category" onchange='CheckCat(this.value);'>
                                    <option value="select">Select</option>
                          <option value="electronic">Electronic</option>
                          <option value="mobile">Mobile</option>
                          <option value="beauty">Beauty & Cosmetics</option>
                          <option value="stationery">Stationery</option>
                          <option value="computer">Computer</option>
                          <option value="sports">Sports</option>
                          <option value="grocery">Grocery</option>
                          <option value="furniture">Furniture</option>
                          <option value="gift">Gift</option>
                           <option value="housing">Housing  Property</option>
                           
                                </select>
                            </div>
                        </div>
                    </div>
					<p>By clicking on the signup you are agree on all the <a href="terms.html" target="_blank">T&C</a>  of Bazar4u </p>
                    <div class="mrgn-30-top">
                        <button type="submit" class="btn btn-primary"  />
                        Sign up
                        </button>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>

<!-- Login Modal  -->
<!-- signup Modal -->
<div id="loginmodal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Login : </h4>
            </div>
            <div class="modal-body">
                <form   action="login" method="post">
                    <div class="form-group">
                      <label> Your Email<span class="req">*</span> </label>
                      <input type="email" class="form-control" name="email" id="email" required data-validation-required-message="Please enter your email address." autocomplete="off">
                      <p class="help-block text-danger"></p>
                    </div>
                    <div class="form-group">
                      <label> Password<span class="req">*</span> </label>
                      <input type="password" class="form-control" name="password" id="password" required data-validation-required-message="Please enter your password" autocomplete="off">
                      <p class="help-block text-danger"></p>
                    </div>
                    <div class="mrgn-30-top">
                      <button type="submit" class="btn btn-success"/>
                      Log in
                    </button>
                  </div>
                </form>

            </div>
            <div class="modal-footer">
            	  <div class="pull-left"><a href="resetpassword.jsp" target="_blank">forgot password ?</a></div>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>


<footer>
<div class="container">
<center>
            <button type="button" class="btn btn-success btn-dark" data-toggle="modal" data-target="#loginmodal">Login</button>
          <font color="white">  OR </font>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#signupmodal">signup</button>
         </center>
        </div>
  <div class="container">
    <div class="row">
      <div class="col-md-4 col-sm-6 footerleft ">
        <div class="logofooter"><img alt="Logo" src="image/bottomlogo.png" height="100" width="100"></div>
        <p>Here Something for everyone.</p>
        <p><i class="fa fa-map-pin"></i> Visnagar </p>
        <p><i class="fa fa-envelope"></i> E-mail : developer@bazar4u.in</p>

      </div>
      <div class="col-md-2 col-sm-6 paddingtop-bottom">
        <h6 class="heading7">GENERAL LINKS</h6>
        <ul class="footer-ul">
         <li><a href="Aboutuspage.html" target="_blank">About Us</a> </li>
          <li><a href="terms.html" target="_blank"> Terms & Conditions</a></li>
          <li><a href="jointeam.html" target="_blank"> Join Our Team</a></li>
           <li><a href="bugreport.html" target="_blank"> Bug Report</a></li>
        </ul>
      </div>
   
      <div class="col-md-3 col-sm-6 paddingtop-bottom pull-right">
        <div class="fb-page" data-href="https://www.facebook.com/facebook" data-tabs="timeline" data-height="300" data-small-header="false" style="margin-bottom:15px;" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true">
          <div class="fb-xfbml-parse-ignore">
            <blockquote cite="https://www.facebook.com/facebook">
              <a href="https://www.facebook.com/facebook"><i class="fa fa-facebook-square" style="font-size:38px;color:blue"></i> &nbsp;Facebook</a>
            </blockquote>
            <blockquote><a href="#" title="website counter"><img src="https://counter2.freecounter.ovh/private/freecounterstat.php?c=jlfmlynjm5flsbycxxb33w1mmzlwpgf5" border="0" title="website counter" alt="website counter"></a></blockquote>
            <blockquote>
              <header style="color: white;">SMS Partner :</header>
               <a href="https://msg91.com/startups/?utm_source=startup-banner" target="_blank"><img src="https://msg91.com/images/startups/msg91Badge.png" width="100" height="70" title="MSG91 - SMS for Startups" alt="Bulk SMS - MSG91"></a>
</blockquote>
          </div>
        </div>
      </div>
    </div>
  </div>
</footer>
<div class="copyright">
  <div class="container">
    <div class="col-md-6">
      <p>Copyright © 2017 - Bazar4u.in  All rights reserved</p>
    </div>
    </div>
    </div>



</body>
</html>
<%}}%>