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
    <title>Events</title>
    <link rel="icon" type="image/gif" href="image/logo.png">
        <meta name="viewport" content="width=device-widht, initial-scale=1">
         <!--Latest compiled and minified CSS -->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
            <script src="js/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
             
            <link rel="stylesheet" href="style.css" >
             <link rel="stylesheet" href="hstyle.css" >
             <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
             <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
             
            <script type="text/javascript">
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
        function showpeople(id,ename){

        	document.getElementById("ename").innerHTML=ename;
var request=new XMLHttpRequest();
        	
        		
			request.open('GET','eventpeople?id='+id);
			request.onload=function(){
				var mytable=document.getElementById("mytable");
				//var elmtTable = document.getElementById("mytable");
	        	
	     //  alert("hello");
					var Data=JSON.parse(request.responseText);
				//	alert(Data.length);
					for (var i =0; i<Data.length; i++) {
						//var insertval=document.getElementById("1").innerHTM+"</br>"+Data[i].name;
						
						var rows=mytable.insertRow(i+2);
					
						var cell=rows.insertCell(0);
						var cell1=rows.insertCell(1);
						var cell2=rows.insertCell(2);
						var cell3=rows.insertCell(3);
						//document.getElementById("mitul").innerHTML=Data[i].name;
						
						cell.innerHTML=Data[i].name;
						cell1.innerHTML=Data[i].email;
						cell2.innerHTML=Data[i].phone;
						cell3.innerHTML=Data[i].address;
						//alert(Data[i].orderid);
						
					}
				

			};
			request.send();
        	

           }
		function printdata(){

			var divToPrint = document.getElementById("printtable");


            newWin = window.open("");
            newWin.document.writeln("<html><head>");
            newWin.document.writeln("</head><body>");
            newWin.document.writeln(divToPrint.outerHTML);

            newWin.document.writeln("</body></html>");
   newWin.print();
   newWin.close();
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
		function changedate(happy){
			
  		  var date = happy;
  		  var months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
  		  var pre;
  		  var happyfinal;
  		  var newtm;
  		  var d,t = new Array();
  		   d = date.split('-');
  		   t = d[3].split(':');
  		   var mon;

  		  if(d[1] != '10'){
  		     mon = d[1].replace("0","");
  		   }else{
  		     mon = d[1];
  		   }
  		   if(t[0].replace(" ","")>12){
  		     newtm = t[0].replace(" ","")-12;
  		     pre = "PM";
  		   }else{
  		     newtm = t[0].replace(" ","");
  		     pre = "AM";
  		   }
  		//alert(d[2]+" "+months[mon-1]+" "+d[0]+" - "+newtm+":"+t[1]+" "+pre);
  		   happyfinal = d[2]+""+months[mon-1]+" "+d[0]+" - "+newtm+":"+t[1]+" "+pre;
  		  
  		   return happyfinal;

  		  //alert(d[2]+"\n"+months[mon-1]+"\n"+d[0]+"\n"+d[3]+"\n"+newtm+"\n"+t[1]+"\n"+t[2]+"\n"+pre);
  		}
    	function seteditevent(ename,eplace,edate,etime,einfo,eid,fb,youtube,insta){
    		var mydate=changedate("2017-09-29 - 15:30:00");
			document.getElementById("eventname").value=ename;
			document.getElementById("eventplace").value=eplace;
			document.getElementById("eventdatetime").value=mydate;
			document.getElementById("eventinfo").value=einfo;
			document.getElementById("eventid").value=eid;
			if(fb=='null'){
				fb="";
					
			}
			if(insta=='null'){
				insta="";
					
			}
			if(youtube=='null'){
				youtube="";
					
			}
			document.getElementById("fblink").value=fb;
			document.getElementById("youtubelink").value=youtube;
			document.getElementById("instalink").value=insta;
			$('#sign-pop').modal('show');

        	}
    	function validatefiles(){
            
    		var myfiles=document.getElementById("images").files;
 			var eplace="";
 	 		eplace=document.getElementById("eventplace").value;
 			var einfo="";
 			einfo=document.getElementById("eventinfo").value;
    		
    		if(myfiles.length>4){
				alert("you cannot select more than 4 files !!!!");
				return false;
        	}
    		document.getElementById("counter").value=myfiles.length;
    		//alert(myfiles.length);
        	for(var i=0;i<myfiles.length;i++){
				var name=myfiles.item(i).name;
				var temp=name.split(".");
				var extern=temp[temp.length-1].toLowerCase();
			
				if(extern.localeCompare("jpeg")!=0 && extern.localeCompare("png")!=0 && extern.localeCompare("gif")!=0 && extern.localeCompare("jpg")!=0){
							alert("file type should be jpeg or png or gif or jpg");
							return false;

					}

              }
            if(eplace=="" || einfo==""){
                alert("problem");
					return false;
              }
           // document.getElementById("counter").value=myfiles.length;
				return true;
           }
    		function deleteevent(val){
				if(confirm("Are you sure you want to delete this event??")){
					document.location.href="deleteevent?id="+val;
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
    <body>

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
            <li><a href="requestorders.jsp">Requested Order</a> </li>
            <li><a href="yourorders.jsp">Your Order</a></li>
            <li class="active"><a href="#">Manage Events</a></li>
       &nbsp;&nbsp;   <button type="button" onclick="logout();" class="btn btn-default navbar-btn navbar-right">LogOut</button>
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
                                        <i class="lab glyphicon glyphicon-home"> Address : </i>  <a class="pull-right" onclick="document.getElementById('addid').disabled=false;" ><i class="glyphicon glyphicon-pencil"></i></a>
                                         <input class="lab form-control" type="text" name="address" id="addid" value=<%=session.getAttribute("address").toString() %>  disabled/>
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
<script>setpic();</script>
<%
	String userid=session.getAttribute("userid").toString();
	Connection con=connection.connect();
    PreparedStatement pst=con.prepareStatement("select * from events where userid=?");
    pst.setString(1, userid);     
    ResultSet rs=pst.executeQuery();



%>
        <div class="col-md-8">
        <div class=" main-body">

                <h4><u><b>Requested Customer Order List :-</b></u></h4>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Event Name</th>
                                <th>Address</th>
                                <th>Date & Time</th>
                                <th>Option</th>
                              <!--  <th>Option</th>-->
                            </tr>
                        </thead>
                        <%while(rs.next()){ %>
                        <tbody>
                            <tr>
                                <td><%=rs.getString("eventname") %></td>
                                <td><%=rs.getString("eventplace") %></td>
                                <td><%=rs.getDate("eventdate") %> &nbsp;&nbsp; <%=rs.getTime("eventtime") %></td>
                                <td><a data-toggle="modal" title="Edit Event" onclick="seteditevent('<%=rs.getString("eventname") %>','<%=rs.getString("eventplace") %>','<%=rs.getDate("eventdate").toString()%> ','<%=rs.getTime("eventtime").toString() %> ','<%=rs.getString("eventinfo") %> ',<%=rs.getInt("eventid")%>,'<%=rs.getString("facebooklink") %>' ,'<%=rs.getString("youtubelink") %>' ,'<%=rs.getString("instagramlink") %>' );" data-target="#eventmodaledit"><i class="glyphicon glyphicon-pencil"></i></a>
                               &nbsp;&nbsp; <a onclick="deleteevent('<%=rs.getInt("eventid")%>');"> <i class="glyphicon glyphicon-trash"></i></a>&nbsp;&nbsp;<a href="<%="printeventdata.jsp?id="+rs.getInt("eventid")%>" target="_blank">view</a>
                                <!--<td><a href="#" data-toggle="modal" data-target="#proedit"><i class="glyphicon glyphicon-ok"></i></a> &nbsp; <a href="#"> <i class="glyphicon glyphicon-trash"></i></a> &nbsp; <a href="#"> <i class="glyphicon glyphicon-print"></i></a> &nbsp; <a href="#"> <i class="glyphicon glyphicon-flag"></i></a></td>
                                -->

                            </tr>
                        </tbody>
						<%} %>
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
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Intrested People : </h4>
      </div>
      <div class="modal-body">
      <div id="printtable">
        <table id="mytable" class="table">
       <div style="opacity: 0.4;
position: absolute;
text-align: center;
z-index: 0;
color:lightblue;
font-size: 6em;
width: 100%;
padding-top:50px;
transform:rotate(340deg);
-webkit-transform:rotate(340deg);">Bazar4u.in</div>
            <thead>
            <tr>
            <th colspan="4" ><center id="ename"></center></th>
            </tr>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Address</th>

                </tr>
            </thead>
            <tbody>
                


              </tbody>
            </table>
		</div>
      </div>
      <div class="modal-footer">
        <div class="pull-left">
        
        <a data-toggle="tooltip" title="Print List" onclick="printdata();"><i class="glyphicon glyphicon-print"></i></a> &nbsp;

      </div>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<%
}	
    
		
	%>
	
	<div id="eventmodaledit" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Add Event Information : </h4>
      </div>
      <div class="modal-body container">

       <div class="row">
        <div class="col-md-6 col-sm-6 col-xs-12">
         <form onsubmit="return validatefiles();" action="editevent" class="form-horizontal" method="post" enctype="multipart/form-data">
            <input type="hidden" name="counter" id="counter" value="" />

          <div class="form-group">
           <div class="col-sm-10 col-sm-offset-1">
              <label for="eventname"> Event Name<span class="req">*</span> </label>
              <input type="text" class="form-control" id="eventname" value="mitul" required data-validation-required-message="Please enter your email address." autocomplete="off" disabled/>
              <p class="help-block text-danger"></p>
            </div>
          </div>
          <div class="form-group">
           <div class="col-sm-10 col-sm-offset-1">
              <label for="place">Venus(place)<span class="req">*</span> </label>
              <input type="text" class="form-control" id="eventplace" name="eventplace" value="visnagar" required data-validation-required-message="Please enter your email address." autocomplete="off" />
              <p class="help-block text-danger"></p>
            </div>
          </div>
             <!--- Add input field for the data -->
               <div class="form-group">
                   <div class="col-sm-10 col-sm-offset-1">
                <label for="dtp_input1">Date and Time</label>
                <div class="input-group date form_datetime" data-date="" data-date-format="dd MM yyyy - HH:ii p" data-link-field="dtp_input1">
                    <input class="form-control" size="16" name="eventdatetime" id="eventdatetime" type="text"  value="" required readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                </div>
				<input type="hidden" id="eventid" name="eventid" value="" /><br/>
                       </div>
                </div>
          <div class="form-group">
           <div class="col-sm-10 col-sm-offset-1">
              <label for="descp">Add Information<span class="req">*</span> </label>
              <textarea type="text" class="form-control" id="eventinfo" name="eventinfo" value="" required data-validation-required-message="Please enter your basic info." onpaste="return false" autocomplete="off"></textarea>
              <p class="help-block text-danger"></p>
            </div>
          </div>
  
             <div class="row">
          <div class="col-sm-5 col-xs-offset-1">
           <label>Image : <span class="req">*</span></label>
          <label class="myLabel">
              <input type="file" name="myfile1" id="images"  multiple="multiple" />
             <span><i class="glyphicon glyphicon-upload"></i> Upload </span>
          </label>
              <br>
              <div class = "input-group">
                    <span class = "input-group-addon"><i class="fa fa fa-youtube-play" style="font-size:20px;color:red;"></i></span>
                    <input type = "text" class = "form-control" name="youtubelink" id="youtubelink" placeholder = "YouTube Link">
                   </div>
          </div>
              <div class="col-sm-5 col-xs-offset-1">
                <label> ADD Social link : </label>
                  <div class="row">
                   <div class = "input-group">
                    <span class = "input-group-addon"><i class="fa fa-facebook-square" style="font-size:20px;color:blue;"></i></span>
                    <input type = "text" class = "form-control" name="fblink" id="fblink" placeholder = "Facebook Link">
                   </div>
                      <br>
                   <div class = "input-group">
                    <span class = "input-group-addon"><i class="fa fa-instagram" style="font-size:20px;color:red;"></i></span>
                    <input type = "text" class = "form-control" name="instalink"  id="instalink" placeholder = "Instagram Link">
                   </div>
                  </div>
                 </div>
              </div>
           


          <div class="form-group">
           <div class="col-sm-10 col-sm-offset-1">
           
            <input type="submit" class="btn btn-primary "   value="Submit" />
           </div>
          </div>
         </form>
        </div>
       </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

 </div>
</div>


<script type="text/javascript" src="js/jquery-1.8.3.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

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
	

    </body>
</html>
