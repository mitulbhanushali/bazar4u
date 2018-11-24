<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, java.io.*, com.mitul.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% if(session.getAttribute("login")==null) {
		response.sendRedirect("newhomepage.jsp?pagecount=0");
	}else{
%>
<html>
    <head>
    <title>User Profile</title>
    <link rel="icon" type="image/gif" href="image/logo.png">
        <meta name="viewport" content="width=device-widht, initial-scale=1">
         <!--Latest compiled and minified CSS -->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
            <link rel="stylesheet" href="style.css" >
            <script type="text/javascript">

/*
            $(".nav li").on("click", function() {
              $(".nav li").removeClass("active");
              $(this).addClass("active");
            });
*/

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
        function logout(){
			document.location.href="logout";

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
        function setcolor(){
    		var mytable=document.getElementById("usertable");
    		var rows=mytable.rows.length;
    		
    		if(rows>1){
				for(var x=rows-1;x>0;x--){
					var status=document.getElementById(x).innerHTML;
				
					if(status.localeCompare("Approved")==0){
						document.getElementById(x).style.color='#F4C542';
					}else if(status.localeCompare("Deliverd")==0){
						document.getElementById(x).style.color='green';
					}else{
						document.getElementById(x).style.color='red';
						}
					//alert(document.getElementById(x).value);
				}
				
			}
        	}
    	function setpic(){
        	var mysrc='<%=session.getAttribute("userid").toString()%>';
        //	alert(mysrc);
				document.getElementById("profilepic").src="setprofilepic.jsp?id="+mysrc;
				setcolor();
        	}

    	function delord(val){

    		if(confirm('are you sure you want to cancel order')){
    			document.location.href=val;
    			}
        	}
    
    	
    	
    	

            </script>
        <style type="text/css">
            label.myLabel input[type="file"] {
                position: fixed;
        top: -1000px;
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
    <body >
    <%
    if(session.getAttribute("login")==null){
		//out.println("<script> document.location.href='newhomepage.jsp?pagecount=0'</script>");
		response.sendRedirect("newhomepage.jsp?pagecount=0");
	}else{
    
    
    %>

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

            <li><a href="userprofile.jsp">Selling Product List</a></li>
            <li><a href="requestorders.jsp" onclick="toggle('popup_box_req');">Requested Order</a> </li>
            <li class="active"><a href="javascript:void(0)" onclick="toggle('popup_box_order');">Your Order</a></li>
             <li><a href="manageevent.jsp" >Manage Events</a></li>
            &nbsp;&nbsp;
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
                                         <input class="lab form-control" type="text" name="uname" id="nameid" value=<%=session.getAttribute("name").toString() %>   disabled/>

                                    </div>
                                </li>
                                <li class="active">
                                    <div class="lab">
                                        <i class="lab glyphicon glyphicon-phone"> Phone No : </i>
                                         <input class="lab form-control" type="text" name="phone" id="phoid" value=<%=session.getAttribute("phone").toString() %>   disabled/>

                                    </div>
                                </li>
                                <li class="active">
                                    <div class="lab">
                                        <i class="lab glyphicon glyphicon-home"> Address : </i> <a class="pull-right" onclick="document.getElementById('addid').disabled=false;" ><i class="glyphicon glyphicon-pencil"></i></a>
                                         <input class="lab form-control" type="text" name="address" id="addid" value=<%=session.getAttribute("address").toString() %> disabled/>
                                    </div>
                                </li>
                                <li class="active">
                                    <div class="lab">
                                    <i class="lab glyphicon glyphicon-globe"> Pincode: </i>
                                         <input class="lab form-control" type="text" name="pincode" id="pinid" value=<%=session.getAttribute("pincode").toString() %>   disabled/>

                                </div>
                                </li>
                            </ul>
                        </div>
                        <!--Add the button for the saving the image of user in database-->
                        <div class="profile-user-buttons">
                            <input type="submit" class="btn btn-success btn-sm" value="save"></input>

                        </div>
                        <!--End of adding the button tag-->
                        </form>
                    </div>
                </div>
            </div>
        </div>
</div>
<script type="text/javascript">setpic();</script>
<%

Connection con=connection.connect();
PreparedStatement pst=con.prepareStatement("select * from orders where userid=?");
pst.setString(1, session.getAttribute("userid").toString());
ResultSet rs=pst.executeQuery();

%>
        <div class="col-md-8">
        <div class=" main-body">

                <h4><u><b>Your Order List :-</b></u></h4>
                <div class="pull-right"><a href="<%="ordersummary.jsp?id="+session.getAttribute("userid").toString()%>" target="_blank">Order Summery</a> </div>
                    <table class="table" id="usertable">
                        <thead>
                            <tr>
                                <th>Product Name</th>
                                <th>Product Price</th>
                                <th>Qty.</th>
                                <th>Total Price</th>
                                <th>Status</th>
                                <th>Cancel Order</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%	int statuscount=0;
                        	while(rs.next()){ 
                        		statuscount++;%>
                            <tr>
                                <td><%=rs.getString("productname") %></td>
                                <td><%=rs.getInt("price")-((rs.getInt("price")*rs.getInt("discount"))/100) %></td>
                                 <td><%=rs.getInt("qty") %></td>
                                  <td><%= (rs.getInt("price")-((rs.getInt("price")*rs.getInt("discount"))/100))*rs.getInt("qty")%></td>
                                <td><b id="<%=statuscount%>"><%=rs.getString("status") %></b></td>
                                <td><a  onclick="delord('<%="deleteorder?id="+rs.getInt("productid") %>');"><i class="glyphicon glyphicon-remove"></i></a></td>
                            </tr>
                           <%} %>
                        </tbody>

                    </table>
            </div>
        </div>
    </div>
    </div>

    <!--This popup box is for adding the new product-->
    <div id="popup_box" class="popup_position">
                                <div id="popup_wrap">
                                    <div id="popup_cont">
                                    <a class="close_link" href="javascript:void(0)" onclick="toggle('popup_box');"><img height="15px" width="15px" src="images.png"></a>
                                       <br>
                                        <form method="post" action="fileup"  enctype="multipart/form-data" >
                                          <div class="row">
                                            <div class="col-xs-16 col-sm-4">
                                              <div class="form-group">
                                                <label for="idnum">Category : </label>
                                                    <select class="form-control drop-down-cat" name="cat" onchange='CheckCat(this.value);'>
                                                      <option value="electronic">Electronic</option>
                                                      <option value="mobile">Mobile</option>
                                                      <option value="beauty">Beauty</option>
                                                      <option value="others">Other...</option>
                                                    </select>
                                                  </div>
                                                </div>

                                                  <div class="col-xs-16 col-sm-6" >
                                                    <div class="form-group" id="cat" style='display:none;'>
                                                      <label for="idnum">Enter Category : </label>
                                                      <input type="text" class="form-control drop-down-cat" name="cat"/>
                                                    </div>
                                                  </div>
                                              </div>

                                            <div class="form-group">
                                                <label for="proname">Product Name</label>
                                                <input type="text" name="name" class="form-control" id="proname" placeholder="Product Name"/>
                                            </div>

                                            <div class="row">
                                              <div class="col-xs-12 col-sm-6">
                                                <div class="form-group">
                                                  <label for="proprice">Product Price</label>
                                                  <input type="text" name="price" class="form-control " id="proprice" placeholder="Product Price" />
                                                </div>
                                              </div>
                                              <div class="col-xs-12 col-sm-6">
                                                <div class="form-group">
                                                  <label for="prodis"> Product Discount </label>
                                                  <input type="text" name="discount" class="form-control" id="prodis" placeholder="Product Discount" />
                                                </div>
                                              </div>
                                            </div>


                                            <div class="form-group">
                                                <label for="prodecp">Product Decptrion</label>
                                                <textarea rows="5" cols="20" name="decp" id="prodecp"></textarea>
                                            </div>

                                            <label class="myLabel">
                                                <input type="file" name="myfile1"  multiple="multiple"/>
                                                <span><i class="glyphicon glyphicon-upload"></i> Upload </span>
                                            </label>
                                            <br><br>
                                            <input type="submit" class="btn btn-primary" value="Add"/>


                                        </form>
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
            <div class="form-group">
              <label>Catigory : </label>
              <input type="text" class="form-control" id="category" value="Book"  name="categiory" autocomplete="off" disabled />
            </div>
          </div>
          <div class="col-xs-12 col-sm-6">
            <div class="form-group">
              <label>Product Name :</label>
              <input type="text" class="form-control" id="productname" value="product-name" name="proname" autocomplete="off" disabled />
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12 col-sm-6">
            <div class="form-group">
              <label>Price : </label>
              <input type="text" class="form-control" id="category" value="15,000"  name="categiory" autocomplete="off" />
            </div>
          </div>
          <div class="col-xs-12 col-sm-6">
            <div class="form-group">
              <label>Discount :</label>
              <input type="text" class="form-control" id="productname" value="5%" name="proname" autocomplete="off" />
            </div>
          </div>
        </div>
        <div class="form-group">
            <label for="prodecp">Product Decptrion</label>
            <textarea rows="5" cols="20" name="decp" id="prodecp"></textarea>
        </div>

        <label class="myLabel">
            <input type="file" name="myfile1"  multiple="multiple"/>
            <span><i class="glyphicon glyphicon-upload"></i> Upload </span>
        </label>
        <br><br>
        <input type="submit" class="btn btn-primary" value="Save"/>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


    </body>
    <%
    	rs.close();
        pst.close();
        con.close();
    
	}
	}
    
    %>
</html>
