<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, java.io.*, com.mitul.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>Checkout</title>
    <link rel="icon" type="image/gif" href="image/logo.png">
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
  <meta name="viewport" content="width=device-width" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <script type="text/javascript">

    function checksession(){
		
		var session="";
		session='<%=session.getAttribute("login")%>';
		if(session.localeCompare('true')==0){
			document.location.href="userprofile.jsp";
		}else{
			//return;
			//alert("sec");
			//document.getElementById("sign-pop").style.display='block';
			$('#sign-pop').modal('show');
		}
	}	

     var total=0;
     var iteamprice=[];
     var allid=[];
     var totalproduct=0;
     var cat=false;
 	function calculate(amount,id,pronum){

		
		var qty=document.getElementById(id).value;
		
		if(isNaN(qty)){
			//alert(qty);
			qty=1;
			document.getElementById(id).value=qty;
		}
		//alert(qty*amount);
		
		var num=qty*amount;
		iteamprice[pronum]=num;
		var count=id.split("qty")[1];
		document.getElementById("peraprice"+count).innerHTML=num.toFixed(2);
		
		//document.getElementById("peratotal").innerHTML=total.toFixed(2);
		//document.getElementById("peratotal").innerHTML=num.toFixed(2);
		counttotal();

	}
	function counttotal(){
		var i=1;
		var finaltotal=0;
		while(iteamprice[i]){
			
				finaltotal=finaltotal+iteamprice[i];			
				i=i+1;
			}
		document.getElementById("peratotal").innerHTML=finaltotal.toFixed(2);

		}

	 function loaddata(counter,amount,id){
		 iteamprice[counter]=amount;
		 allid[counter]=id;
		 totalproduct=totalproduct+1;

	}
	
	function setqty(){

			var count=1;
		
			while(document.getElementById("qty"+count)){
				document.getElementById("qty"+count).value=1;	
				count=count+1;
				
				}

		}
	function setdata(){
		
		var url="takeorder?id=";
		
		for(var i=1;i<allid.length;i++){
		 url=url+allid[i]+","	;			

		}
		
		url=url+"&qty=";
		for(var j=1;j<allid.length;j++){
			
			var qty=document.getElementById("qty"+j).value;
			url=url+qty+",";
		}
	
		document.location.href=url	
		}

		function deleteproduct(key){
			//alert("key"+key);
			document.cookie=key+"=;";
			totalproduct=totalproduct-1;
			var arr=[];
			var allcookie=document.cookie;
			var arrcookie=allcookie.split(';');
			var url="checkout.jsp?id=";
			//alert(allcookie.length);
			
			if(arrcookie.length>=1){
				
					for(var i=0;i<arrcookie.length;i++){
						var value=arrcookie[i].split('=')[1];
						
							if(value.localeCompare("")==0 || isNaN(value) || value=='0'){
								
							}else{
									
								url=url+value+",";
								}
							
					}
				
					document.location.href=url;
			   }else{
				  
				     
				       var cookies = document.cookie.split(";");
				       for (var i = 0; i < cookies.length; i++)
				       {   
				           var spcook =  cookies[i].split("=");
				           deleteCookie(spcook[0]);
				       }
				       function deleteCookie(cookiename)
				       {
				           var d = new Date();
				           d.setDate(d.getDate() - 1);
				           var expires = ";expires="+d;
				           var name=cookiename;
				           //alert(name);
				           var value="";
				           document.cookie = name + "=" + value + expires + "; path=/acc/html";                    
				       }
				      
				   
				   document.location.href="newhomepage.jsp?pagecount=0"
					
				 }		
		}

				function setformdata(){

					var session="";
					session='<%=session.getAttribute("login")%>';
					if(session.localeCompare('true')==0){
						//document.getElementById("finaladdress").innerHTML=document.getElementById("textareaid").value;
						var i=1;
						var finaltotal=0;
						while(iteamprice[i]){
								finaltotal=finaltotal+iteamprice[i];			
								i=i+1;
							}
						document.getElementById("grandtotal").innerHTML=finaltotal.toFixed(2);
						$('#checkout-pop').modal('show');
					}else{
						
						$('#sign-pop').modal('show');
					}					

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
				 function incqty(id,amount,pronum){
		             // alert(id);
		             // alert(amount);
		              //alert(pronum);
		              var qty = document.getElementById(id).value;
		              if(qty < 3){
			            //  alert("okay"+id);
		              document.getElementById(id).value = ++qty;
		              calculate(amount,id,pronum);
		              }
		            }
		            function decqty(id,amount,pronum){
		              var qty = document.getElementById(id).value;
		              if(qty > 1){
		                document.getElementById(id).value = --qty;
		                calculate(amount,id,pronum);
		              }
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
    <style>
    
    .add-to-cart .btn-qty {
                  width: 30px;
                  height: 20px;
                  padding: 1px;
                }
    
    
    </style>

    <meta name="viewport" content="width=device-widht, initial-scale=1">
	<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="checkstyle.css" >
        <link rel="stylesheet" href="hstyle.css" >
        <link rel="stylesheet" href="side-nav.css" >
              <script src="side-nav.js"></script>

  </head>
  <body onload="setqty();">
 <%  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  	response.setHeader("Pragma", "no-cache");
  	response.setHeader("Expires", "0");%>
 <div id="wrapper"><nav class="navbar navbar-default navbar-fix-top">
<div class="container-fluid">
<!-- Brand and toggle get grouped for better mobile display -->
<div class="">
    <a class="navbar-brand" style="font-size:30px;cursor:pointer;padding-left:5px;" data-toggle="offcanvas" >&#9776;</a>
    <a class="navbar-brand" href="newhomepage.jsp?pagecount=0"><img alt="Home btn" src="image/upsidelogo.png" height="35" width="100"></a>
    <div class="nav navbar-nav pull-right sign-but-list">
    <button type="button"  class="sign-but btn btn-info btn-lg" onclick="checksession();" ><i class="glyphicon glyphicon-user"></i></button>
  </div>
</div>
  </div><!-- /.container-fluid -->
</nav>
  
 <nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
            <ul class="nav sidebar-nav">
                <li>
                	<a class="closebtn pull-right" data-toggle="offcanvas" >&times;</a>
                </li>
                <li>
                  <a href="shopslist.jsp?pagecount=0"> <i class="glyphicon glyphicon-shopping-cart"></i>&nbsp; Shopes</a>
                </li>
                <li>
                    <a href="https://bazar4u.in/events.jsp"> <i class="glyphicon glyphicon-flag"></i> &nbsp; Events  </a>
                </li>
                <li>
                	<a  href="https://bazar4u.in/newhomepage.jsp?pagecount=0&offer=yes"><i class="glyphicon glyphicon-piggy-bank"></i> &nbsp; Offer Zone</a>
                </li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">Category <span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
			        <li><a  href="newhomepage.jsp?pagecount=0&catagory=electronic"> Electronic</a></li>
				    <li><a  href="newhomepage.jsp?pagecount=0&catagory=mobile">Mobile</a></li>
				    <li><a  href="newhomepage.jsp?pagecount=0&catagory=computer">Computer</a></li>
				    <li><a  href="newhomepage.jsp?pagecount=0&catagory=beauty">Beauty & Cosmetics</a></li>
				    <li><a  href="newhomepage.jsp?pagecount=0&catagory=stationery">Stationery</a></li>
				     <li><a  href="newhomepage.jsp?pagecount=0&catagory=sports">Sports</a></li>
				     <li><a  href="newhomepage.jsp?pagecount=0&catagory=grocery">Grocery</a></li>
				      <li><a  href="newhomepage.jsp?pagecount=0&catagory=furniture">Furniture</a></li>
				      <li><a  href="newhomepage.jsp?pagecount=0&catagory=gift">Gift</a></li>
				    <li><a  href="newhomepage.jsp?pagecount=0&catagory=housing">Housing  Property</a></li>
				    
		          </ul>
                </li>
            </ul>
        </nav>
 

    <div class="main-body-padding container">
    <button type="submit" class="btn btn-default shop-back-but" onclick="location.href='newhomepage.jsp?pagecount=0';"> < Continue Shopping </button>
      <div class="shop-cart-text">Shoping Cart :   </div>
  		<div class="row">
          <div class="col-md-8 line-style" style="background-color:#99ccff" ></div>
          <div class="col-md-4 line-style" style="background-color:#ff9999" ></div>
        </div>
            <div class="row">
   
  <%! 
  String iddata="";
  public boolean isStringInt(String s)
  {
      try
      {
          Integer.parseInt(s);
          return true;
      } catch (NumberFormatException ex)
      {
          return false;
      }
  }
  %>
  <%
  	
  double amount=0;
	  double total=0;
  ResultSet rs=null;
  int productcounter=1;
  int checkproduct=0;
  	if(request.getParameter("id")==null || request.getParameter("id").equals("")){
  			response.sendRedirect("newhomepage.jsp?pagecount=0");
  	}else{
  		Class.forName("com.mysql.jdbc.Driver");
  		Connection con=connection.connect();
  		PreparedStatement pst=con.prepareStatement("select * from finaliteams where id=?");
  		String id=request.getParameter("id");
  		iddata=id;
  			String allids[]=id.split(",");
  			
  			for(int i=0;i<allids.length;i++){
  				if(!isStringInt(allids[i])){
  					continue;
  				}
  				pst.setInt(1, Integer.parseInt(allids[i]));
  			
  		 rs=pst.executeQuery();
  		if(rs.next()){
  			double price=rs.getInt("price");
  			amount=price-(price*rs.getInt("discount"))/100;
  			total+=amount;
  
  %>
					 <div class="container" style="background-color:#f4f4f4;padding:15px;">
        <div class="col-md-1">
          <a onclick="deleteproduct(<%=rs.getInt("id") %>)" ><i class="glyphicon glyphicon-trash"></i></a>
          <p></p>
        </div>
        <div class="col-md-2">
          <div class="row">
              <img alt="" src=<%="retriveimage.jsp?id="+rs.getInt("id")+"&num=1" %> height="150" width="90%"> 
          </div>
          <div class="row">
            <p> <b><%=rs.getString("name") %>  </b></p>
          </div>
        </div>
        <div class="col-md-7" >
          <div class="row">
            <div class="col-md-3 col-sm-4 col-xs-6">
              <p><b> &#8377; <%=amount %> </b></p>
              <p>&#10005;</p>
             
              <div class="add-to-cart">
                 <div class="product-qty">
                    <span class="btn btn-default btn-qty" onclick="incqty('<%="qty"+productcounter %>',<%=amount%>,<%=productcounter%>)">
                      <center>
                        <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
                      </center>
                    </span>
                    <input type="number" class="btn btn-default btn-lg btn-qty" id=<%="qty"+productcounter %> name=<%="qty"+productcounter %>  value="1"  onkeydown="return false" disabled>
                    <span class="btn btn-default btn-qty" onclick="decqty('<%="qty"+productcounter %>',<%=amount%>,<%=productcounter%>)">
                      <center>
                         <i class="glyphicon glyphicon-minus" aria-hidden="true"></i>
                      </center>
                    </span>
                  </div>
              </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4 text-center pull-right" style="background-color:#eaeaea">
                <h4 style="padding-top:15px;padding-bottom:15px;">&#8377; <b id=<%="peraprice"+productcounter %>><%=amount %></b></h4>
            </div>
          </div>
        </div>

      </div>
				 <script>calculate(<%=amount%>,'<%="qty"+productcounter %>',<%=productcounter%>);</script>	
    

                       <div style="padding:5px;"></div>
                        

                       

                    
                          <%	checkproduct++;}else{
                        	  	if(i<allids.length){
                        	  		continue;
                        	  	}else{
                        	  		 response.sendRedirect("newhomepage.jsp?pagecount=0");
                        	  	}
        	  
        	   
           }
  		productcounter++;
  		
  			}
  			 if(checkproduct<1){ 
  	        	response.sendRedirect("newhomepage.jsp");
  	        }
  	       
  	}
  	 %>
  	      </div>
    <div style="padding-top:25px;">
    <div class="row" style="background-color:#f1b657; padding:5px;">
      <div class="pull-right">
        <b style="padding-top:15px;">Total Amount : &#8377; <b id="peratotal"><%=total %></b></b> &nbsp;&nbsp;&nbsp;
        <button type="button" class="btn btn-primary"  onclick="setformdata();"><i class="glyphicon glyphicon-shopping-cart"></i> Checkout </button>

      </div>
    </div>
  </div>
  </div>

 
				
              <div class="modal fade" id="checkout-pop" role="dialog">
              <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">PLACE ORDER : </h4>
                  </div>
                  <div class="modal-body">

                  <table>
                    <tr>
                      <td>
                        <div class="padd">
                          <strong>Shipping address : </strong><br>
                          <div id="finaladdress"> <%=session.getAttribute("address") %></div>
                          <br><br>
                          <strong> Contact Number : </strong>
                          <br>
                          <%=session.getAttribute("phone") %>
                        </div>
                      </td>
                      <td>
                        <div class="padd">
                          <strong> Payment Method : </strong> <br>COD <br><br>
                          <strong> Grand Total : </strong> <div id="grandtotal"> </div>
                        </div>
                      </td>
                    </tr>
                  </table>

                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="setdata();"><i class="glyphicon glyphicon-shopping-cart"></i> Place Order</button>
                  </div>
                </div>

              </div>
              </div>
              
              <div class="modal fade" id="sign-pop" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">


            <div id="userform">
              <ul class="nav nav-tabs nav-justified" role="tablist">
                <li class="active"><a href="#login"  role="tab" data-toggle="tab">Log in</a></li>
                <li><a href="#signup"  role="tab" data-toggle="tab">Sign up</a></li>
              </ul>
              <div class="tab-content">

                <!--Login tab switching to login-->
                <div class="tab-pane fade active in" id="login">
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
                     <input type="hidden" name="pageinfo" value="<%="checkout.jsp?id="+iddata%>">
                    <div class="mrgn-30-top">
                      <button type="submit" class="btn btn-success"/>
                      Log in
                    </button>
                      <div class="pull-right"><a href="resetpassword.jsp" target="_blank"> forgot password ?</a></div>
                  </div>
                </form>
              </div>
              <!--Compleation of Login-->

              <!--Sign up tab switching to Signup-->
              <div class="tab-pane fade in" id="signup">

                <form id="signup" onsubmit="return checksignup();" action="sendotp" method="post">
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
                   <input type="hidden" name="pageinfo" value="<%="checkout.jsp?id="+iddata%>">
					<p>By clicking on the signup you are agree on all the <a href="terms.html" target="_blank">T&C</a>  of Bazar4u </p>
                    <div class="mrgn-30-top">
                      <button type="submit" class="btn btn-primary"  />
                      Sign up
                    </button>
                  </div>
                </form>
              </div>
			<!-- Ending of the sign up tab -->
            </div>
          </div>


        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>

    </div>
  </div>
              
          
</div>
  </body>
</html>
