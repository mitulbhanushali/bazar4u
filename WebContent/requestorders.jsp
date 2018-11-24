<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, java.io.*, com.mitul.*,java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
		if(session.getAttribute("login")==null){
			response.sendRedirect("newhomepage.jsp?pagecount=0");
		}else{
%>
<html>
    <head>
    <title>User Profile</title>
    <link rel="icon" type="image/gif" href="image/logo.png">
        <meta name="viewport" content="width=device-widht, initial-scale=1">
        <meta http-equiv="refresh" content="120">
         <!--Latest compiled and minified CSS -->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
            <script src="js/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
            <link rel="stylesheet" href="style.css" >
            <script type="text/javascript">
            var gtotal=0;
            var buyer="";
			var ordtype=false;
            var seller1="";
            var buyer1="";
            var delstatus;
            $(document).ready(function(){
                $('[data-toggle="tooltip"]').tooltip();
            });
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
        function StatusCol(id,name){
          var e = document.getElementById(id);
          if(name == 'pending'){
            e.style.color = 'red';
          }else if(name == 'approved'){
            e.style.color = '#f4c542';
          }else if(name == 'deliverd'){
            e.style.color = 'green';
          }
        }
        function CheckCat(val){
           var element=document.getElementById('cat');
           if(val=='others')
             element.style.display='block';
           else
             element.style.display='none';
          }
        function setorder(username,seller,ordstatus){
        	
	        	// elmtTable.deleteRow(rowCount-1);
	       	delstatus=ordstatus;
        	seller1=seller;
        	buyer1=username;
        	var request=new XMLHttpRequest();
        	
        	
			request.open('GET','jsonresponse?bname='+username+'&sellername='+seller+'&status='+ordstatus);
			request.onload=function(){
				var mytable=document.getElementById("mytable");
				//var elmtTable = document.getElementById("mytable");
	        	
	     //  alert("hello");
					var Data=JSON.parse(request.responseText);
				//	alert(Data.length);
					for (var i =0; i<Data.length; i++) {
						//var insertval=document.getElementById("1").innerHTM+"</br>"+Data[i].name;
						
						var rows=mytable.insertRow(i+1);
					
						var cell=rows.insertCell(0);
						var cell1=rows.insertCell(1);
						var cell2=rows.insertCell(2);
						var cell3=rows.insertCell(3);
						var cell4=rows.insertCell(4);
						//document.getElementById("mitul").innerHTML=Data[i].name;
						
						cell.innerHTML=Data[i].name;
						cell1.innerHTML=Data[i].price;
						cell2.innerHTML=Data[i].qty;
						cell3.innerHTML=parseInt(Data[i].price)*parseInt(Data[i].qty);
						gtotal=gtotal+(parseInt(Data[i].price)*parseInt(Data[i].qty));
						//alert(Data[i].orderid);
						cell4.innerHTML='<a data-toggle="tooltip" onclick="deleteorder('+parseInt(Data[i].productid)+','+parseInt(Data[i].orderid)+')" title="Remove Item"><i class="glyphicon glyphicon-remove"></i></a>';
						//alert(parseInt(Data[i].price)*parseInt(Data[i].qty));
						document.getElementById("gtotal").innerHTML=gtotal;
						buyer=username;
					}
				

			};
			request.send();
        	

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
    	function setpic(){
        	var mysrc='<%=session.getAttribute("userid").toString()%>';
        //	alert(mysrc);
				document.getElementById("profilepic").src="setprofilepic.jsp?id="+mysrc;
				setcolor();
        	}
    	function setcolor(){
    		var mytable=document.getElementById("usertable");
    		var rows=mytable.rows.length;
    		//alert(rows);
    		if(rows>1){
				for(var x=rows-1;x>0;x--){
					var status=document.getElementById(x).innerHTML;
					//alert(status);
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
		function deleteorder(pid,oid){
			if(confirm('Are you sure you want to cancel order ?')){
			document.location.href="cancelproduct?oid="+parseInt(oid);
			}
			
			}    	
		function tablereset(){
			var mytable=document.getElementById("mytable");
			var rows=mytable.rows.length;
			if(rows>2){
					for(var x=rows-2;x>0;x--){
						mytable.deleteRow(x);
					}
					
				}

			}
		function approveorder(){
			//alert(buyer);
			document.location.href="approvedorder?id="+buyer+"&status=Approved";
		}
		function deliverorder(){
			document.location.href="approvedorder?id="+buyer+"&status=Deliverd";
		}
		function cancelallorder(){
			if(confirm('Are you sure you want to cancel whole order ?')){
			document.location.href='canceltotalorder?bname='+buyer1+'&sellername='+seller1+'&status='+delstatus;
			}
		}
		function printorder(){
			if(ordtype==true){
				var win=window.open("ordersummary.jsp?id="+buyer1+"&sid="+seller1+"&type=d",'_blank');
				win.focus();
				//document.location.href="ordersummary.jsp?id="+buyer1+"&sid="+seller1+"&type=d";
				}else{
					var win=window.open("ordersummary.jsp?id="+buyer1+"&sid="+seller1,'_blank');
					win.focus();
					//document.location.href="ordersummary.jsp?id="+buyer1+"&sid="+seller1;
				}
			
		}
		function settype(val){
			if(val=='d'){
				ordtype=true;
			}else{
				ordtype=false;
			}
			
			var mySelect = document.getElementById('filter');
			
			for(var i, j = 0; i = mySelect.options[j]; j++) {
			    if(i.value == val) {
				   
			        mySelect.selectedIndex = j;
			        break;
			    }
			}
			}
		function filterstatus(val){
			
				document.location.href="requestorders.jsp?type="+val;
			
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
    <body onload="setpic();">
    
    <%
    	if(session.getAttribute("login")!=null){
    
    
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
            <li class="active"><a href="javascript:void(0)" onclick="toggle('popup_box_req');">Requested Order</a> </li>
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
                                        <i class="lab glyphicon glyphicon-home"> Address : </i>  <a class="pull-right" onclick="document.getElementById('addid').disabled=false;" ><i class="glyphicon glyphicon-pencil"></i></a>
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
                            <input type="submit" class="btn btn-success btn-sm" value="save"></input>

                        </div>
                        </form>
                        <!--End of adding the button tag-->
                    </div>
                </div>
            </div>
        </div>
</div>
<%
	String sql="";
    boolean type=false; 
    String ordtype=null;
	if(request.getParameter("type")==null ||  request.getParameter("type").equals("c")){
		sql="select distinct userid,status from orders where sellerid=? and (status=? or status=?)";
		type=false;   
	}else if(request.getParameter("type").equals("d")){
	sql="select distinct userid,status from orders where sellerid=? and status=?";
	type=true;
	}else{
		sql="select distinct userid,status from orders where sellerid=? and (status=? or status=?)";
		type=false;   
	}
	
	ArrayList<String> users=new ArrayList();
   	ArrayList<String> status=new ArrayList();
	Connection con=connection.connect();
    PreparedStatement pst=con.prepareStatement(sql);
    pst.setString(1, session.getAttribute("userid").toString());
    if(type){
    	 pst.setString(2,"Deliverd");
    	
    }else{
    	pst.setString(2,"pending");
    	pst.setString(3,"Approved");
    	
    }
   
    
    
    ResultSet rs=pst.executeQuery();
    while(rs.next()){
    	users.add(rs.getString("userid"));
    	status.add( rs.getString("status"));
    	}
   





%>
        <div class="col-md-8">
        <div class=" main-body">

                <h4><u><b>Requested Customer Order List :-</b></u></h4>
                <div class="pull-right" style="display: inline ;">
     			 <select class="form-control drop-down-cat" name="filter" id="filter" onchange='filterstatus(this.value);'>

       				 	<option value="c">Pending and Approved</option>
        				<option value="d">delivered</option>
        				

    			</select>
				</div>
				<%if(type){
			    	 
			    	 out.println("<script> settype('d');</script>");
			    }else{
			    	
			    	 out.println("<script> settype('c');</script>");
			    } %>

                
                    <table class="table" id="usertable">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>email</th>
                                <th>phone</th>
                                <th>address</th>
                                <th>Status</th>
                                <th>View</th>
                              <!--  <th>Option</th>-->
                            </tr>
                        </thead>
                        <tbody>
                        <%
                        int statuscounter=0;
                        for(String username : users){
                       	 pst=con.prepareStatement("select *  from users where userid=?");
                       	 pst.setString(1, username);
                       	 rs=pst.executeQuery();
                       	 String finalstatus=status.get(statuscounter);
                       	 statuscounter++;
                       		while(rs.next()){
                      
                        %>
                            <tr>
                                <td><%=rs.getString("shopname") %></td>

                                <td><%=rs.getString("email") %></td>
                                <td><%=rs.getString("phone") %></td>
                                <td><%=rs.getString("address")+","+rs.getString("city") %></td>
                                <td  onclick="StatusCol('col1','pending');"><b id ="<%=statuscounter%>" ><%=finalstatus %></b></td>
                                <td><a data-toggle="modal" data-target="#proedit" onclick="setorder('<%=username%>','<%=session.getAttribute("userid").toString()%>','<%=finalstatus %>')"> view</a>
                                <!--<td><a href="#" data-toggle="modal" data-target="#proedit"><i class="glyphicon glyphicon-ok"></i></a> &nbsp; <a href="#"> <i class="glyphicon glyphicon-trash"></i></a> &nbsp; <a href="#"> <i class="glyphicon glyphicon-print"></i></a> &nbsp; <a href="#"> <i class="glyphicon glyphicon-flag"></i></a></td>
                                -->

                            </tr>
                            <%} }%>
                        </tbody>

                    </table>
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
        <button type="button" class="close" onclick="tablereset();" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Product Details : </h4>
      </div>
      <div class="modal-body">
        <table class="table" id="mytable">
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Qnt</th>
                    <th>Total</th>
                    <th></th>

                </tr>
            </thead>
            <tbody >
                

                  <tr>
                    <th></th>
                    <th></th>
                    <th>Grand Total :</th>
                    <th id="gtotal"></th>

              </tbody>
            </table>

      </div>
      <div class="modal-footer">
        <div class="pull-left">
        <a data-toggle="tooltip" title="Approved Order" onclick="approveorder();"><i class="glyphicon glyphicon-ok"></i></a> &nbsp;
        <a data-toggle="tooltip" title="Print Order" onclick="printorder();"><i  class="glyphicon glyphicon-print"></i></a> &nbsp;
        <a data-toggle="tooltip" title="Cancel Order"  onclick="cancelallorder();"><i class="glyphicon glyphicon-remove"></i></a> &nbsp;
        <a data-toggle="tooltip" title="Order Deliverd" onclick="deliverorder();"><i class="glyphicon glyphicon-thumbs-up"></i></a> &nbsp;
      </div>
        <button type="button" class="btn btn-default" onclick="tablereset();" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<%}else{
	response.sendRedirect("newhomepage.jsp?pagecount=0");
}	
    
		}
	%>





    </body>
</html>
