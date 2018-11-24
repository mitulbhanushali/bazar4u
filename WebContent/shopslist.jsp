<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, java.io.*, com.mitul.*" errorPage="error.jsp" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
Cookie cookie = null;
Cookie[] cookies = null;

// Get an array of Cookies associated with the this domain

cookies = request.getCookies();
int ckscount=0;
String city="";
if( cookies != null ) {
   
   for (int i = 0; i < cookies.length; i++) {
      cookie = cookies[i];
      
      if((cookie.getName( )).compareTo("city") == 0 ) {

    	  city=cookie.getValue();
    	 ckscount++;
      }
   }
	if(ckscount==0){
	
	response.sendRedirect("index.jsp");
}else{%>
<html>
    <head>
        <title>Shop List</title>
        <link rel="icon" type="image/gif" href="image/logo.png">

        <meta name="viewport" content="width=device-widht, initial-scale=1">
       <meta name="description" content="Buy & sell anything online and create your own customize shop or advertisement that boost your business">
   	 <meta name="keywords" content="bazar4u,bazar,bazaar,market,online shop,online market,product selling,digital bazar,online shop,digitalshop,<%=city+" bazar4u shops"%>,<%="bazar4u shops "+city%>">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous"> 
            <script src="js/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
            <link rel="stylesheet" href="hstyle.css" >
            <link rel="stylesheet" href="side-nav.css" >
             <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
            <script src="side-nav.js"></script>
            <style type="text/css">
            
            .infoshort{
	
	text-overflow:ellipsis;
	white-space:nowrap;
	display:block;
	overflow:hidden;
	width:10em;
}
  .infoshort1{
	
	text-overflow:ellipsis;
	white-space:nowrap;
	display:block;
	overflow:hidden;
	width:7em;
}

            </style>
            <script type="text/javascript">
            var cat=false;
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

            	function showdetails(id){
                	
            		var request=new XMLHttpRequest();
        			request.open('GET','hitcounter?id='+id+"&type=shop");
        			request.send();
        			document.location.href="shopproducts.jsp?pagecount=0&id="+id;


                  }
            	function nex(co,ls){
            		co=co+1;
            		if((ls/12)>=co){
            		
            		document.location.href="shopslist.jsp?pagecount="+co;
            		}else{
            			document.location.href="shopslist.jsp?pagecount=0";

            			}
            		}
        		
            	function checkbasket(){
					
            		var allcookie=document.cookie;
    				var arrcookie=allcookie.split(';');
    				var url="checkout.jsp?id=";
    				//alert(arrcookie.length);
    				var counter=0;
    				
    				for(var j=0;j<arrcookie.length;j++){
    					
    					var temp1=arrcookie[j].split('=')[1];
    					
    						if(temp1.localeCompare("")==0 || isNaN(temp1) || temp1=='0'){
    							
    						}else{
    							
    							counter=counter+1;
    						}
    				}
    				
    				if(counter>=1){
    						for(var i=0;i<arrcookie.length;i++){
    							
    							var value=arrcookie[i].split('=')[1];
    								if(value.localeCompare("")==0 || isNaN(value) || value=='0'){
    									
    								}else{
    									url=url+value+",";
    								}
    								
    						}
    						var temp=url.split("checkout.jsp?id=")[1];
    						
    						if(temp.localeCompare("")==0 ){
    							//alert("basket is empty nothing for checkout!!!!!!!!");	
    							swal('sorry !','Your Basket is empty ','warning');
    							}else{
    								
    								document.location.href=url;
    								
    						}
    						
    				   }else{
    						//alert("basket is empty nothing for checkout!!!!!!!!");
    						swal('sorry !','Your Basket is empty ','warning');
    					 }

    				}

            	function seticon(){

            		var allcookie=document.cookie;
					var arrcookie=allcookie.split(';');
					var counter=0;
					for(var i=0;i<arrcookie.length;i++){
						
						var value=arrcookie[i].split('=')[1];
						
							if(value.localeCompare("")==0 || isNaN(value) || value=='0'){
								
							}else{
								counter=counter+1;
							}
							
					}
					document.getElementById("cartcounter").innerHTML=counter;
		
				}

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
            	function search(){

    				document.location.href="shopslist.jsp?pagecount=0&qry="+document.getElementById("search").value;

    			}	
            	  function postadd(){
                  	
                  	var session="";
      				session='<%=session.getAttribute("login")%>';
      				if(session.localeCompare('true')==0){
      					document.location.href="postadd.jsp";
      				}else{
      					//return;
      					//alert("sec");
      					//document.getElementById("sign-pop").style.display='block';
      					$('#sign-pop').modal('show');
      				}
                  	
                  	
                  }
                  
				
            </script>

    </head>
    <body onload="seticon();" oncopy="return false" oncut="return false">
    
 <div id="wrapper">
<nav class="navbar navbar-default navbar-fix-top">
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
                    <a href="events.jsp"> <i class="glyphicon glyphicon-flag"></i> &nbsp; Events  </a>
                </li>
               
                <li>
                	<a  href="newhomepage.jsp?pagecount=0&offer=yes"><i class="glyphicon glyphicon-piggy-bank"></i> &nbsp; Offer Zone</a>
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
        
        <a class="but-nav-search" data-toggle="modal" data-target=".bs-example-modal-lg"><i class="glyphicon glyphicon-search"></i></a>

    <div class="back-img" id="baskicon">
      <a  onclick="return checkbasket();"><img src="shop-basket.ico"  alt="user-img" height="65px" width="65px" class="img-responsive pull-right img-basket"/>
    <div class="item-num-cart" id="cartcounter">0</div></a>
    </div>


   <button class="btn btn-warning " style="color:black;" onclick="postadd();" > <i class="fa fa-bullhorn" aria-hidden="true"></i> &nbsp;Submit a Free Ad</button> &nbsp;
<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div id="custom-search-input">
                        <div class="input-group col-md-12">
                            <input id="search" onKeyDown="if(event.keyCode==13) search();" type="text" class="form-control input-lg" placeholder="Search" />
                            <span class="input-group-btn">
                                <button class="btn btn-info btn-lg" type="button" onclick="search();" >
                                    <i class="glyphicon glyphicon-search"></i>
                                </button>
                            </span>
                        </div>
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
                     <input type="hidden" name="pageinfo" value="shopslist.jsp">
                    <div class="mrgn-30-top">
                      <button type="submit" class="btn btn-success"/>
                      Log in
                    </button>
                      <div class="pull-right"><a href="resetpassword.jsp" target="_blank">forgot password ?</a></div>
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
                        <input type="text" class="form-control" name="shopname" iid="shopname" data-validation-required-message="Please enter your name." autocomplete="off">
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
                   <input type="hidden" name="pageinfo" value="shopslist.jsp">
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


        <!--This is the center part of the website where the product will be display-->
         <div class="container-fluid main-body">
            <div class="page-header"><h2>Shopes List :</h2></div>
            <div class="container-fluid">
              <div class="row"> <!--Here we will start to add the product using table-->
        
        <%
       String imageurl="setprofilepic.jsp?cid=";
    	String sql;
    	//String catagory=null;
    	int count;
    	if(request.getParameter("pagecount")==null){
    		count=0;
    	}else{
    		count=Integer.parseInt(request.getParameter("pagecount"));
    	}
    	
    	
    		if(request.getParameter("qry")!=null){
    			sql="select * from users where type='shop' and city='"+city+"' and shopname like '%"+request.getParameter("qry")+"%'";
    		}else{
    			sql="select * from users where type='shop' and city='"+city+"'";
    		}
    	
    		
    	int j=1;
    	String imgs="retriveimage.jsp?id=";
    	//String buy="buynow.jsp?id=";
    	Class.forName("com.mysql.jdbc.Driver");
    	Connection con=connection.connect();
    	Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
    	ResultSet rs=st.executeQuery(sql);
    	if(rs.next()){
    		
    	rs.beforeFirst();
    	rs.last();
    	int last=rs.getRow();
        rs.beforeFirst();
        //rs.next();
        //out.println(rs.getString("shopname"));
        while(j<=12 && rs.next()){
        	int loopcount=(count*12)+j;
        
        
			if(loopcount<=last){
			rs.absolute(loopcount);
			String ssm=imageurl+rs.getInt("id");
			j++;
        %>
       
                <div class="col-sm-3" style="padding-bottom:20px;">

                    <table>
                      <tr>
                        <th>Shop: </th><td rowspan="2"><b class="pull-left"><%=rs.getString("shopname") %></b></td>
                      </tr>
                      <tr></tr> 

                      <tr>
                        <td colspan="2">
                          <center><a href="javascript:void(0)" onclick="toggle('popup_box');" data-toggle="modal" data-target="#buymodal" ><img src=<%=ssm %> onerror="this.src = 'shop.png';" height="200" width="100%" src="imag/a4.jpg" /></a></center>
                        </td>
                      </tr>
                      <tr>
                        <td colspan="2"><button onclick="showdetails(<%=rs.getString("id") %>);" type="submit" class="buy_but btn btn-primary">Vist Shop </button></td>
                      </tr>
                    </table>

                </div>
                <%}else{out.println("<script> document.location.href='shopslist.jsp?pagecount=0'; </script>");} }%>
                <%
					rs.close();
					st.close();
					con.close();
				%>
            </div>
            </br></br> 
			
          </div>
          <ul class="pager">
			<li>
			<a class="next_but" onclick="nex(<%=count %>,<%=last%>);">Next &#10095;&#10095;</a>
			</li>
		  </ul>
          
        </div>
<%}else{%>
	
	<div class="text-center">
		<center>
                  <img class="img-responsive" src="image/noshop.png" width="90%" height="75%">
                  </center>
                  <a href="newhomepage.jsp" > Goto Home </a>
                </div>
	
	<%} %>
    </div>

    </body>
</html>
 <%} }%>
