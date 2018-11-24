<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, java.io.*, com.mitul.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
					if(session.getAttribute("login")==null){
						//out.println("<script> document.location.href='newhomepage.jsp?pagecount=0'</script>");
						response.sendRedirect("newhomepage.jsp?pagecount=0");
					}else{
			
			%>
    <head>
    <title>User Profile</title>
    <link rel="icon" type="image/gif" href="image/logo.png">
        <meta name="viewport" content="width=device-widht, initial-scale=1">
        <meta content="multipart/form-data">
         <!--Latest compiled and minified CSS -->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
            <script src="js/jquery.min.js"></script>
            
            <link rel="stylesheet" href="style.css" >
            <link rel="stylesheet" href="hstyle.css" >
            <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
            <script type="text/javascript">
				var fimage=false;
            
            $(".nav li").on("click", function() {
              $(".nav li").removeClass("active");
              $(this).addClass("active");
            });


                window.onkeydown = function( event ) {
    	    if ( event.keyCode == 27 ) {
    	      document.getElementById("popup_box").style.display='none';
              document.getElementById("popup_box_req"   ).style.display='none';
              document.getElementById("popup_box_order").style.display='none';
    	    }
    	};
                function toggle(id){
            var e = document.getElementById(id);
            if(e.style.display == 'block'){
                e.style.display = 'none';
            }else{
                e.style.display = 'block';
            }
        }

        function CheckCat(val){
           var element=document.getElementById('cat');
           if(val=='others')
             element.style.display='block';
           else
             element.style.display='none';
          }


        	function editproduct(id,name,category,price,discount,discription){

        		document.getElementById("productname").value=name;
        		document.getElementById("productprice").value=price;
        		document.getElementById("productcategory").value=category;
        		document.getElementById("productdiscount").value=discount;
        		document.getElementById("productdiscription").value=discription;
        		document.getElementById("productid").value=id;
        		//document.getElementById("counter").value="hello";
       

               }

        	function resetimage(){

        		
        		//document.getElementById("productimage").value="mitul";
        		//$("#productimage").val('');
        			//var oldInput=document.getElementById("productimage"); 
        			 //
        		   /*  newInput = document.createElement("input"); 

        		    newInput.type = "file"; 
        		    newInput.id = oldInput.id; 
        		    newInput.name = oldInput.name; 
        		    newInput.className = oldInput.className; 
        		    newInput.style.cssText = oldInput.style.cssText; 
        		   // newInput.multiple=true;
        		    // TODO: copy any other relevant attributes 

        		    oldInput.parentNode.replaceChild(newInput, oldInput); 
        		    alert(newInput.name);*/
        		   // oldInput.parentNode.replaceChild(oldInput.cloneNode(true), oldInput);
    		   // alert("ok");
            	}

            	function validatefiles(id){
              
            		
         
            		
            	/*	if(myfiles.length>4){
						alert("you cannot select more than 4 files !!!!");
						return false;
                	}*/
            		//document.getElementById("counter").value=myfiles.length;
            		//alert(myfiles.length);
            		var val=document.getElementById("productprice").value;
                	var val1=document.getElementById("productdiscount").value;
                	if(isNaN(val) || isNaN(val1)){
						alert("plz enter number for price or discount field");
								return false;
                       }
                	if(val1>=100){
						alert("plz provide value of discount between 0 to 99");
						return false;

                        }
						return true;
                   }
                	function validateimage(){

    					var myfiles=document.getElementById("photo").files;
    					if(myfiles.length>1){
								alert("you can select only one photo for profile pic!!!");
								return false;
        					}
    					document.getElementById("counter1").value=myfiles.length;
                    	for(var i=0;i<myfiles.length;i++){
    						var name=myfiles.item(i).name;
    						var temp=name.split(".");
    						var extern=temp[temp.length-1].toLowerCase();
    					
    						if(extern.localeCompare("jpeg")!=0 && extern.localeCompare("png")!=0 && extern.localeCompare("gif")!=0 && extern.localeCompare("jpg")!=0){
    									alert("file type should be jpeg or png or gif or jpg");
    									return false;

    							}

                          }
                    	document.getElementById("typep").value="profie";
                    	return true;

                    	}
                	function setpic(){
                    	var mysrc='<%=session.getAttribute("userid").toString()%>';
                    //	alert(mysrc);
							document.getElementById("profilepic").src="setprofilepic.jsp?id="+mysrc;

                    	}
                	function checkedits(){

                		var cat=document.getElementById("catagory1").value;
						if(cat.localeCompare("select")==0){
								alert("select category");
								return false;
						}
						
                		
                	var myfile1=document.getElementById("productimage1");
                	var myfile2=document.getElementById("productimage2");
                	var myfile3=document.getElementById("productimage3");
                	var myfile4=document.getElementById("productimage4");

                	if(myfile1.value=="" ){
						alert("plz upload  first image");
						return false;

                    }
                	var val=document.getElementById("proprice").value;
                	var val1=document.getElementById("prodiscount").value;
                	if(isNaN(val) || isNaN(val1)){
						alert("plz enter number for price or discount field");
								return false;
                       }
                	if(val1>=100){
						alert("plz provide value of discount between 0 to 99");
						return false;

                        }
                    

    						return true;

                    	}
                	function logout(){
						document.location.href="logout";

                    }
                    function deleteproduct(val){

                    	if(confirm("Are you sure you want to delete this product??")){
        					document.location.href="deleteproduct?id="+val;
        				}else{
        					return ;
        				}
                       }
                	
            </script>
        <style type="text/css">
            label.myLabel input[type="file"] {
                position: fixed;
        top: -1000px;
}
.choose_file{
  position:relative;
  display:inline-block;
  border-radius:8px;
  border:dashed 2px green;
  width:70px;
  height:70px;
  color: #7f7f7f;
  margin-top: 2px;

}
.choose_file input[type="file"]{
  -webkit-appearance:none;
  position:absolute;
  width:70px;
  height:70px;
  top:0;
  left:0;
  opacity:0;
  background-image: url();
  background-size: cover;
}
.glyphicon-plus{
color: green;
padding: 25px;
}

/***** Example custom styling *****/
.myLabel {
    border: 2px solid #AAA;
    border-radius: 4px;
    padding: 2px 5px;
    margin: 2px;
    background: #DDD;
    display: inline-block;
}
.myLabel:hover {
    background: #CCC;
}
.myLabel:active {
    background: #CCF;
}
.myLabel :invalid + span {
    color: #A44;
    font-size: 15px;
}
.myLabel :valid + span {
    color: #4A4;
}
        </style>
    </head>
    <body onload="setpic();">
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	
    <nav class="navbar navbar-default navbar-fixed-top">

         <div class="navbar-header">
        <!--Folloing button is for small screen, it will appera during the small Screen -->
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
     <a class="navbar-brand" href="newhomepage.jsp?pagecount=0"> Home </a>
    </div>

      <div class="container">
         <!-- <a class="navbar-brand" href="#"> Home </a> -->

        <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav">

            <li class="active"><a href="#">Selling Product List</a></li>
            <li><a href="requestorders.jsp" onclick="toggle('popup_box_req');">Requested Order</a> </li>
              <li><a href="yourorders.jsp" onclick="toggle('popup_box_order');">Your Order</a></li>
              <li><a href="manageevent.jsp" >Manage Events</a></li>
          <button type="button" onclick="logout();" class="btn btn-default navbar-btn navbar-right">LogOut</button>
          </ul>
        </div>
      </div>
    </nav>

    <div class="row">
        <div class="col-md-3">
    <div class="container">
            <div class="row profile center-block">
                <div class="col-md-3">
                    <div class="profile-sidebar">
                        <!--Add this for adding the user profile image-->
                        <form onsubmit="return validateimage();" action="editinfo" method="post" enctype="multipart/form-data">
                        <div class="profile-userpic">
                            <img src="" id="profilepic" onerror="this.src='https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg'" alt="user-img" class="img-responsive img-circle">
                            <div class="btn center-block">
                                <label class="myLabel">
                                <input type="file" name="photo" id="photo" />
                                <span><i class="glyphicon glyphicon-edit"></i> Edit </span>
                            </label>
                            </div>
                        </div>
<input type="hidden" name="counter1" id="counter1" value="id" />
<input type="hidden" name="typep" id="typep" value="id" />
                        <!--Here is the end of user profile image-->
                        
                        <div class="profile-user-menu">
                            <ul class="nav">
                                <li class="active">
                                    <div class="lab">
                                        <i class="lab glyphicon glyphicon-user"> Name : </i>
                                         <input class="lab form-control" type="text" name="uname" id="nameid" value=<%=session.getAttribute("name").toString() %>  disabled/>

                                    </div>
                                </li>
                                <li class="active">
                                    <div class="lab">
                                        <i class="lab glyphicon glyphicon-phone"> Phone No : </i>
                                         <input class="lab form-control" type="text" name="phone" id="phoid" value=<%=session.getAttribute("phone").toString() %>  disabled/>

                                    </div>
                                </li>
                                <li class="active">
                                    <div class="lab">
                                        <i class="lab glyphicon glyphicon-home"> Address : </i>   <a class="pull-right" onclick="document.getElementById('addid').disabled=false;" ><i class="glyphicon glyphicon-pencil"></i></a>
                                         <input class="lab form-control" type="text" name="address" id="addid" value=<%=session.getAttribute("address").toString() %>  disabled/>
                                    </div>
                                </li>
                                <li class="active">
                                    <div class="lab">
                                    <i class="lab glyphicon glyphicon-globe"> Pincode: </i>
                                         <input class="lab form-control" type="text" name="pincode" id="pinid" value=<%=session.getAttribute("pincode").toString() %> disabled/>

                                </div>
                                </li>
                            </ul>
                        </div>
                        <!--Add the button for the saving the image of user in database-->
                        <div class="profile-user-buttons">
                            <input type="submit" value="save" class="btn btn-success btn-sm"></input>
                           
</form>
                        </div>
                        
                        <!--End of adding the button tag-->
                    </div>
                </div>
            </div>
        </div>
</div>
		

        <div class="col-md-8">
        <div class=" main-body">
                <h3>Select Item you want to Sell : </h3>
                <div class="row">
                <div class="col-md-6">
                <input class="buy_but" type="button" value="Add Product"   data-toggle="modal" data-target="#addproduct-pop" />
                </div>
                <div class="col-md-6">
                <button type="button" class="host_but" data-toggle="modal" data-target="#eventmodal">Host Event</button>
                 </div>
                 </div>
                <h4>Uploaded Item List :</h4>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Product Name</th>
                                <th>Product Price</th>
                                <th>Discount</th>
                                <th>Option</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                        
                        	Connection con=connection.connect();
                        	PreparedStatement pst=con.prepareStatement("select * from finaliteams where userid=?");
                        	pst.setString(1, session.getAttribute("userid").toString());
                        	ResultSet rs=pst.executeQuery();
                        	while(rs.next()){
                        
                        
                        
                        %>
                            <tr>
                                <td><%= rs.getString("name")%></td>
                                <td><%=rs.getInt("price") %></td>
                                <td><%=rs.getInt("discount") %>%</td>
                                <td><a  data-toggle="modal" data-target="#proedit" onclick="editproduct(<%=rs.getInt("id") %>,'<%=rs.getString("name") %>','<%=rs.getString("category") %>',<%=rs.getInt("price") %>,<%=rs.getInt("discount") %>,'<%=rs.getString("discription") %>');"><i class="glyphicon glyphicon-pencil"></i></a> &nbsp; <a onclick="deleteproduct('<%=rs.getInt("id")%>');"> <i class="glyphicon glyphicon-trash"></i></a></td>
                            </tr>
                           <%} %>
                        </tbody>
                      

                    </table>
            </div>
        </div>
    </div>
    </div>
 <!--This popup box is for adding the new product-->
    <div class="modal fade" id="addproduct-pop" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
                                        <form  onsubmit="return checkedits();" method="post" action="tempupload"  enctype="multipart/form-data" accept-charset="UTF-8">
                                          <div class="row">
                                            <div class="col-xs-16 col-sm-4">
                                              <div class="form-group">
                                                <label for="idnum">Category : </label>
                                                    <select class="form-control drop-down-cat" name="catagory1" id="catagory1" onchange='CheckCat(this.value);'>
                                                      <option value="select">select</option>
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
                                                      <option value="others">Other...</option>
                                                    </select>
                                                  </div>
                                                </div>

                                                  <div class="col-xs-16 col-sm-6" >
                                                    <div class="form-group" id="cat" style='display:none;'>
                                                      <label for="idnum">Enter Category : </label>
                                                      <input type="text" class="form-control drop-down-cat" name="catagory2"/>
                                                    </div>
                                                  </div>
                                              </div>

                                            <div class="form-group">
                                                <label for="proname">Product Name</label>
                                                <input type="text" name="name" class="form-control" id="proname" placeholder="Product Name" required/>
                                            </div>

                                            <div class="row">
                                              <div class="col-xs-12 col-sm-6">
                                                <div class="form-group">
                                                  <label for="proprice">Product Price</label>
                                                  <input type="text" name="price" class="form-control " id="proprice" placeholder="Product Price" required />
                                                </div>
                                              </div>
                                              <div class="col-xs-12 col-sm-6">
                                                <div class="form-group">
                                                  <label for="prodis"> Product Discount </label>
                                                  <input type="text" name="discount" class="form-control" id="prodis" placeholder="Product Discount" value="0" />
                                                </div>
                                              </div>
                                            </div>


                                            <div class="form-group">
                                                <label for="prodecp">Product Decptrion</label>
                                                <textarea rows="5" cols="20" name="discription" id="prodecp" required></textarea>
                                            </div>

                                              <hr>
                <div class="row" style="padding-top:20px;" >
                  <div class="col-sm-10">
                    <label style="padding:10px;">Select Images </label>
                    <div class="choose_file">
                      <span id="file1" class="glyphicon glyphicon-plus" >
                      </span>
                      <input name="Select File" name="f1" id="productimage1" type="file" onchange="loadFile(event)"/>
                    </div>
                    <div class="choose_file">
                      <span id="file2" class="glyphicon glyphicon-plus" >
                      </span>
                      <input name="Select File" name="f2" id="productimage2" type="file" onchange="loadFile1(event)"/>
                    </div>
                    <div class="choose_file">
                      <span id="file3" class="glyphicon glyphicon-plus" >
                      </span>
                      <input name="Select File" name="f3" id="productimage3" type="file" onchange="loadFile2(event)"/>
                    </div>
                    <div class="choose_file">
                      <span id="file4" class="glyphicon glyphicon-plus" >
                      </span>
                      <input name="Select File" name="f4"  id="productimage4"type="file" onchange="loadFile3(event)"/>
                    </div>
                    
                  </div>
                </div>
                                            <br><br>
                                            <input type="submit" class="btn btn-primary" id="addproduct" value="Add"/>


                                        </form>
                                      </div>
                                      <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                      </div>
                                    </div>
                                  </div>
                                </div>

<!--This popup box is to edit the Added product-->
<!-- Modal -->
<div id="proedit" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Product Details : </h4>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-xs-12 col-sm-6">
          <form onsubmit="return validatefiles('eproductimage');" action="editinfo" method="post" enctype="multipart/form-data">
          <input type="hidden" name="productid" id="productid"  />
           <input type="hidden" name="counter" id="counter"  />
            <div class="form-group">
              <label>Category : </label>
              <input type="text" class="form-control" id="productcategory" name="productcategory" value="Book"   autocomplete="off" readonly="readonly" />
            </div>
          </div>
          <div class="col-xs-12 col-sm-6">
            <div class="form-group">
              <label>Product Name :</label>
              <input type="text" class="form-control" id="productname" name="productname" value="product-name"  autocomplete="off" readonly="readonly" />
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12 col-sm-6">
            <div class="form-group">
              <label>Price : </label>
              <input type="text" class="form-control" id="productprice" name="productprice" value="15,000"  autocomplete="off" />
            </div>
          </div>
          <div class="col-xs-12 col-sm-6">
            <div class="form-group">
              <label>Discount :</label>
              <input type="text" class="form-control" id="productdiscount" name="productdiscount" value="5%"  autocomplete="off" />
            </div>
          </div>
        </div>
        <div class="form-group">
            <label for="prodecp">Product Decptrion</label>
            <textarea rows="5" cols="20"  id="productdiscription" name="productdiscription" onpaste="return false" ></textarea>
        </div>

      <hr>
                <div class="row" style="padding-top:20px;" >
                  <div class="col-sm-10">
                    <label style="padding:10px;">Select Images </label>
                    <div class="choose_file">
                      <span id="efile1" class="glyphicon glyphicon-plus" >
                      </span>
                      <input name="Select File" name="f1" id="eproductimage1" type="file" onchange="eloadFile(event)"/>
                    </div>
                    <div class="choose_file">
                      <span id="efile2" class="glyphicon glyphicon-plus" >
                      </span>
                      <input name="Select File" name="f2" id="eproductimage2" type="file" onchange="eloadFile1(event)"/>
                    </div>
                    <div class="choose_file">
                      <span id="efile3" class="glyphicon glyphicon-plus" >
                      </span>
                      <input name="Select File" name="f3" id="eproductimage3" type="file" onchange="eloadFile2(event)"/>
                    </div>
                    <div class="choose_file">
                      <span id="efile4" class="glyphicon glyphicon-plus" >
                      </span>
                      <input name="Select File" name="f4"  id="eproductimage4"type="file" onchange="eloadFile3(event)"/>
                    </div>
                    
                  </div>
                </div>
        <br><br>
        <input type="submit" class="btn btn-primary" id="editproduct" value="Save"/>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


<div id="eventmodal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
   
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Add Event Information : </h4>
      </div>
      
      <div class="modal-body container">
 <form onsubmit="return validatefiles('eventimages'); " action="setevent" method="post" enctype="multipart/form-data">
       <div class="row">
        <div class="col-md-6 col-sm-6 col-xs-12">
         <form action="" class="form-horizontal" method="post">

          <div class="form-group">
           <div class="col-sm-10 col-sm-offset-1">
              <label for="eventname"> Event Name<span class="req">*</span> </label>
              <input type="text" class="form-control" id="eventname" required data-validation-required-message="Please enter your email address."  name="eventname" autocomplete="off" />
              <p class="help-block text-danger"></p>
            </div>
          </div>
          <div class="form-group">
           <div class="col-sm-10 col-sm-offset-1">
              <label for="place">Venus(place)<span class="req">*</span> </label>
              <input type="text" class="form-control" id="place" required data-validation-required-message="Please enter your email address." name="eventplace" autocomplete="off" />
              <p class="help-block text-danger"></p>
            </div>
          </div>
             <!--- Add input field for the data -->
               <div class="form-group">
                   <div class="col-sm-10 col-sm-offset-1">
                <label for="dtp_input1">Date and Time</label>
                <div class="input-group date form_datetime" data-date="" data-date-format="dd MM yyyy - HH:ii p" data-link-field="dtp_input1">
                    <input class="form-control" size="16" type="text" name="eventdate" value="" required readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                </div>
				<input type="hidden" id="dtp_input1" value="" /><br/>
                       </div>
                </div>
          <div class="form-group">
           <div class="col-sm-10 col-sm-offset-1">
              <label for="descp">Add Information<span class="req">*</span> </label>
              <textarea type="text" class="form-control" id="descp" required data-validation-required-message="Please enter your email address." name="eventinfo" onpaste="return false" autocomplete="off"></textarea>
              <p class="help-block text-danger"></p>
            </div>
          </div>
  
           <div class="row">
          <div class="col-sm-5 col-xs-offset-1">
           <label>Image : <span class="req">*</span></label>
          <label class="myLabel">
              <input type="file" name="eventimages" id="eventimages"  multiple="multiple" required/>
             <span><i class="glyphicon glyphicon-upload"></i> Upload </span>
          </label>
              <br>
              <div class = "input-group">
                    <span class = "input-group-addon"><i class="fa fa fa-youtube-play" style="font-size:20px;color:red;"></i></span>
                    <input type = "text" class = "form-control" name="youtubelink" placeholder = "YouTube Link">
                   </div>
          </div>
              <div class="col-sm-5 col-xs-offset-1">
                <label> ADD Social link : </label>
                  <div class="row">
                   <div class = "input-group">
                    <span class = "input-group-addon"><i class="fa fa-facebook-square" style="font-size:20px;color:blue;"></i></span>
                    <input type = "text" class = "form-control" name="fblink" placeholder = "Facebook Link">
                   </div>
                      <br>
                   <div class = "input-group">
                    <span class = "input-group-addon"><i class="fa fa-instagram" style="font-size:20px;color:red;"></i></span>
                    <input type = "text" class = "form-control" name="instalink" placeholder = "Instagram Link">
                   </div>
                  </div>
                 </div>
              </div>


          <div class="form-group">
           <div class="col-sm-10 col-sm-offset-1">
            <input name="_honey" style="display:none" type="text">
            <input type="submit" class="btn btn-primary " value="submit" ></input>
           </div>
          </div>
         </form>
        </div>
       </div>

      </div>
      </form>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
	
 </div>
</div>

<script type="text/javascript" src="js/jquery-1.8.3.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.js"></script>

<script type="text/javascript">
    function dispdate(d){

    var dformat = [
               d.getFullYear(),
               d.getMonth()+1,
               d.getDate()].join('-')+' '+
              [d.getHours(),
               d.getMinutes()].join(':');
            return dformat;
        }

    $('.form_datetime').datetimepicker({
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
        startDate: dispdate(new Date),
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1
    });
</script>
<script>
var bdiscount=0;
function loadFile(event) {
      var out = URL.createObjectURL(event.target.files[0]);
      var d = document.getElementById('file1');
      d.style.backgroundImage = "url('"+out+"')";
      var myfile1=document.getElementById("productimage1");
      var fname=myfile1.value;
      var temp=fname.split(".");
		var extern=temp[temp.length-1].toLowerCase();
	
		if(extern.localeCompare("jpeg")!=0 && extern.localeCompare("png")!=0 && extern.localeCompare("gif")!=0 && extern.localeCompare("jpg")!=0){
					alert("file type should be jpeg or png or gif or jpg");
					document.getElementById("addproduct").disabled = true;
					bdiscount++;

		}else{
			bdiscount--;
			if(bdiscount<=0){
			document.getElementById("addproduct").disabled = false;
			}
		}
      d.style.backgroundSize = "cover";
      d.style.borderRadius = "8px";
      };
      function loadFile1(event) {
        var out = URL.createObjectURL(event.target.files[0]);
        var d = document.getElementById('file2');
        d.style.backgroundImage = "url('"+out+"')";
        var myfile1=document.getElementById("productimage2");
        var fname=myfile1.value;
        var temp=fname.split(".");
 
  		var extern=temp[temp.length-1].toLowerCase();
  	
  		if(extern.localeCompare("jpeg")!=0 && extern.localeCompare("png")!=0 && extern.localeCompare("gif")!=0 && extern.localeCompare("jpg")!=0){
  					alert("file type should be jpeg or png or gif or jpg"+temp);
  					document.getElementById("addproduct").disabled = true;
  					bdiscount++;

  		}else{
  			bdiscount--;
			if(bdiscount<=0){
			document.getElementById("addproduct").disabled = false;
			}
  		}
        d.style.backgroundSize = "cover";
        d.style.borderRadius = "8px";
        };
        function loadFile2(event) {
          var out = URL.createObjectURL(event.target.files[0]);
          var d = document.getElementById('file3');
          d.style.backgroundImage = "url('"+out+"')";
          var myfile1=document.getElementById("productimage3");
          var fname=myfile1.value;
          var temp=fname.split(".");
         
    		var extern=temp[temp.length-1].toLowerCase();
    	
    		if(extern.localeCompare("jpeg")!=0 && extern.localeCompare("png")!=0 && extern.localeCompare("gif")!=0 && extern.localeCompare("jpg")!=0){
    					alert("file type should be jpeg or png or gif or jpg");
    					bdiscount++;
    					document.getElementById("addproduct").disabled = true;

    		}else{
    			bdiscount--;
    			if(bdiscount<=0){
    			document.getElementById("addproduct").disabled = false;
    			}
    		}
          d.style.backgroundSize = "cover";
          d.style.borderRadius = "8px";
          };
          function loadFile3(event) {
            var out = URL.createObjectURL(event.target.files[0]);
            var d = document.getElementById('file4');
            d.style.backgroundImage = "url('"+out+"')";
            var myfile1=document.getElementById("productimage4");
            var fname=myfile1.value;
            var temp=fname.split(".");
           
      		var extern=temp[temp.length-1].toLowerCase();
      	
      		if(extern.localeCompare("jpeg")!=0 && extern.localeCompare("png")!=0 && extern.localeCompare("gif")!=0 && extern.localeCompare("jpg")!=0){
      					alert("file type should be jpeg or png or gif or jpg");
      					bdiscount++;
      					document.getElementById("addproduct").disabled = true;

      		}else{
      			bdiscount--;
    			if(bdiscount<=0){
    			document.getElementById("addproduct").disabled = false;
    			}
      		}
            d.style.backgroundSize = "cover";
            d.style.borderRadius = "8px";
            };

            var ebdiscount=0;
            function eloadFile(event) {
                  var out = URL.createObjectURL(event.target.files[0]);
                  var d = document.getElementById('efile1');
                  d.style.backgroundImage = "url('"+out+"')";
                  var myfile1=document.getElementById("eproductimage1");
                  var fname=myfile1.value;
                  var temp=fname.split(".");
            		var extern=temp[temp.length-1].toLowerCase();
            	
            		if(extern.localeCompare("jpeg")!=0 && extern.localeCompare("png")!=0 && extern.localeCompare("gif")!=0 && extern.localeCompare("jpg")!=0){
            					alert("file type should be jpeg or png or gif or jpg");
            					document.getElementById("editproduct").disabled = true;
            					ebdiscount++;

            		}else{
            			ebdiscount--;
            			if(ebdiscount<=0){
            			document.getElementById("editproduct").disabled = false;
            			}
            		}
                  d.style.backgroundSize = "cover";
                  d.style.borderRadius = "8px";
                  };
                  function eloadFile1(event) {
                    var out = URL.createObjectURL(event.target.files[0]);
                    var d = document.getElementById('efile2');
                    d.style.backgroundImage = "url('"+out+"')";
                    var myfile1=document.getElementById("eproductimage2");
                    var fname=myfile1.value;
                    var temp=fname.split(".");
              
              		var extern=temp[temp.length-1].toLowerCase();
              	
              		if(extern.localeCompare("jpeg")!=0 && extern.localeCompare("png")!=0 && extern.localeCompare("gif")!=0 && extern.localeCompare("jpg")!=0){
              					alert("file type should be jpeg or png or gif or jpg");
              					document.getElementById("editproduct").disabled = true;
              					ebdiscount++;

              		}else{
              			ebdiscount--;
            			if(ebdiscount<=0){
            			document.getElementById("editproduct").disabled = false;
            			}
              		}
                    d.style.backgroundSize = "cover";
                    d.style.borderRadius = "8px";
                    };
                    function eloadFile2(event) {
                      var out = URL.createObjectURL(event.target.files[0]);
                      var d = document.getElementById('efile3');
                      d.style.backgroundImage = "url('"+out+"')";
                      var myfile1=document.getElementById("eproductimage3");
                      var fname=myfile1.value;
                      var temp=fname.split(".");
                     
                		var extern=temp[temp.length-1].toLowerCase();
                	
                		if(extern.localeCompare("jpeg")!=0 && extern.localeCompare("png")!=0 && extern.localeCompare("gif")!=0 && extern.localeCompare("jpg")!=0){
                					alert("file type should be jpeg or png or gif or jpg");
                					ebdiscount++;
                					document.getElementById("editproduct").disabled = true;

                		}else{
                			ebdiscount--;
                			if(ebdiscount<=0){
                			document.getElementById("editproduct").disabled = false;
                			}
                		}
                      d.style.backgroundSize = "cover";
                      d.style.borderRadius = "8px";
                      };
                      function eloadFile3(event) {
                        var out = URL.createObjectURL(event.target.files[0]);
                        var d = document.getElementById('efile4');
                        d.style.backgroundImage = "url('"+out+"')";
                        var myfile1=document.getElementById("eproductimage4");
                        var fname=myfile1.value;
                        var temp=fname.split(".");
                       
                  		var extern=temp[temp.length-1].toLowerCase();
                  	
                  		if(extern.localeCompare("jpeg")!=0 && extern.localeCompare("png")!=0 && extern.localeCompare("gif")!=0 && extern.localeCompare("jpg")!=0){
                  					alert("file type should be jpeg or png or gif or jpg");
                  					ebdiscount++;
                  					document.getElementById("editproduct").disabled = true;

                  		}else{
                  			ebdiscount--;
                			if(ebdiscount<=0){
                			document.getElementById("editproduct").disabled = false;
                			}
                  		}
                        d.style.backgroundSize = "cover";
                        d.style.borderRadius = "8px";
                        };
            
</script>


    </body>
    <%} %>
</html>
