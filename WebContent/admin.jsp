<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, java.io.*, com.mitul.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
		if(session.getAttribute("admin")==null || session.getAttribute("admin").toString().equals("")){
			response.sendRedirect("adminlogin.html");
		}else{
			
%>
<html>
<head>
  <title>Developer | Admin </title>
  <link rel="icon" type="image/png" href="image/logo.png">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="css/adminpanel.css">
  
  <script>

  	function approve(id){

		post("approveuser",id);

  	  }
  	function deleteuser(id){

		post("deletetempuser",id);

  	  }

  	function post(path, id) {
  	    var form = $('<form></form>');

  	    form.attr("method", "post");
  	    form.attr("action", path);

  	    
  	        var field = $('<input></input>');

  	        field.attr("type", "hidden");
  	        field.attr("name", "id");
  	        field.attr("value", id);

  	        form.append(field);
  	 

  	    // The form needs to be a part of the document in
  	    // order for us to be able to submit it.
  	    $(document.body).append(form);
  	    form.submit();
  	}
  	function removeParam(key, sourceURL) {
  	    var rtn = sourceURL.split("?")[0],
  	        param,
  	        params_arr = [],
  	        queryString = (sourceURL.indexOf("?") !== -1) ? sourceURL.split("?")[1] : "";
  	    if (queryString !== "") {
  	        params_arr = queryString.split("&");
  	        for (var i = params_arr.length - 1; i >= 0; i -= 1) {
  	            param = params_arr[i].split("=")[0];
  	            if (param === key) {
  	                params_arr.splice(i, 1);
  	            }
  	        }
  	        rtn = rtn + "?" + params_arr.join("&");
  	    }
  	    return rtn;
  	}
	  function addcity(val){
			var loc=document.location.href;
		  if(loc.indexOf('?')>-1){
			 
				  var newurl=removeParam('city', loc);
				  newurl+="&city="+val;
				  document.location.href=newurl;
				 
			 
			  
			}else{

				document.location.href="admin.jsp?city="+val;
			}
		  

		}
		function setdropdown(val){

			var mySelect = document.getElementById('filter');
			
			for(var i, j = 0; i = mySelect.options[j]; j++) {
			    if(i.value == val) {
				   
			        mySelect.selectedIndex = j;
			        break;
			    }
			}

		}

		
	  


  </script>
</head>
<body>

<div id="wrapper">
  <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                  <div class="navbar-header">
                  
                  
<ul class="nav navbar-left navbar-top-links">
                        <li class="dropdown navbar-inverse">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                              <i class="fa fa-location-arrow fa-fw"></i> Location <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu dropdown-alerts">
                              <li>
                                <a onclick="addcity('all')">
                                    <div>
                                        <i class="fa fa-location-arrow fa-fw"></i> All
                                    </div>
                                </a>
                              </li>
                              <li class="divider"></li>
                              <%
                    	Connection con1=connection.connect();
                    	PreparedStatement pst1=con1.prepareStatement("select distinct city from finaliteams ORDER BY city");
                    	ResultSet rs1=pst1.executeQuery();
                    	while(rs1.next()){
                    %>

  
                              <li>
                                <a  onclick="addcity('<%= rs1.getString("city")%>')">
                                    <div>
                                        <i class="fa fa-location-arrow fa-fw"></i>  <%= rs1.getString("city").substring(0,1).toUpperCase()+rs1.getString("city").substring(1,rs1.getString("city").length())%>
                                    </div>
                                </a>
                              </li>
                               <% }
                    
                    	rs1.close();
                    	pst1.close();
                    	con1.close();
                    %>
                            </ul>
                        </li>
                      </ul>

                  
                      
                  </div>
                 

                  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                      <span class="sr-only">Toggle navigation</span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                  </button>
                  <ul class="nav navbar-right navbar-top-links">
                    <li>
                      <a href="#">
                        <i class="fa fa-sign-out fa-fw"></i>
                      </a>
                    </li>
                  </ul>
                  <div class="navbar-default sidebar" role="navigation">
                      <div class="sidebar-nav navbar-collapse">
                          <ul class="nav" id="side-menu">
                              <li>
                                  <a href="admin.jsp?type=shop"><i class="fa fa-dashboard fa-fw"></i> Shopes</a>
                              </li>
                              <li>
                                  <a href="admin.jsp?type=advertise"><i class="fa fa-bar-chart-o fa-fw"></i> Advertise </a>
                              </li>
                              <li>
                                  <a href="admin.jsp?type=food"><i class="fa fa-table fa-fw"></i> Food Shop</a>
                              </li>
                          </ul>
                      </div>
                  </div>
              </nav>
              <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Admin Panel</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-user fa-4x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                    <%
                                    if(request.getParameter("city")==null || request.getParameter("city").equals("all")){%>
                        				<div class="huge"><%=getDetails.users() %></div>
                        		<%	}else{%>
                        				<div class="huge"><%=getDetails.cityusers(request.getParameter("city")) %></div>
                        		<%	}
                                    %>
                                        
                                        <div>Users </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /* Commeting the footer section not in use*/
                            <a href="#">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                                    <div class="clearfix"></div>
                                </div>
                            </a>
                          -->
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-tasks fa-4x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <%
                                    if(request.getParameter("city")==null || request.getParameter("city").equals("all")){%>
                        				<div class="huge"><%=getDetails.products() %></div>
                        		<%	}else{%>
                        				<div class="huge"><%=getDetails.cityproducts(request.getParameter("city")) %></div>
                        		<%	}
                                    %>
                                        <div>Products</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-newspaper-o fa-4x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                       <%
                                    if(request.getParameter("city")==null || request.getParameter("city").equals("all")){%>
                        				<div class="huge"><%=getDetails.advertise() %></div>
                        		<%	}else{%>
                        				<div class="huge"><%=getDetails.cityadvertise(request.getParameter("city")) %></div>
                        		<%	}
                                    %>
                                        <div>Advertise</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Shop Aprovement panel
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Shop Name</th>
                                                <th>Username</th>
                                                <th>Phone</th>
                                                <th>Options</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <% Connection con=connection.connect();
                            			PreparedStatement pst=null;
                            			ResultSet rs=null;   
                            			String sql=null;
                            			if(request.getParameter("city")==null || request.getParameter("city").equals("all")){
                            				sql="select * from temp_users";
                            			}else{
                            				sql="select * from temp_users where city='"+request.getParameter("city")+"'";
                            			}
                            				 pst=con.prepareStatement(sql);
                            				 rs=pst.executeQuery();
                            				 while(rs.next()){
                            				 %>
                                            <tr>
                                                <td><%=rs.getString("shopname") %></td>
                                                <td><%=rs.getString("firstname")+" "+ rs.getString("lastname") %></td>
                                                <td><%=rs.getString("phone") %></td>
                                                <td>
                                                    			<button class="btn btn-success margin-right" onclick= " approve('<%=rs.getString("userid") %>');">
                                                    			
                                                    				<span class="glyphicon glyphicon-ok"></span>
                                                    			</button>
                                                    			<button class="btn btn-danger margin-right" onclick=" deleteuser('<%=rs.getString("userid") %>');">
                                                    				<span class="glyphicon glyphicon-remove"></span>
                                                    			</button>
                                                </td>
                                            </tr>
											<%} %>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-6 -->

              </div><!--End of the Page Wrapper-->
</div> <!--End of the Wrapper-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script>
</script>
</body>
</html>
<%}%>