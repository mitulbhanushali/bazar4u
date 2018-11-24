<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, java.io.*, com.mitul.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

if(request.getParameter("id")==null ){
	
		response.sendRedirect("newhomepage.jsp");
}else if(session.getAttribute("login")==null ){	
	 if(request.getParameter("sid")!=null){
		 response.sendRedirect("login.jsp?id="+request.getParameter("id")+"&sid="+request.getParameter("sid"));
	 }else{
	response.sendRedirect("login.jsp?id="+request.getParameter("id"));
	 }

}else if(request.getParameter("sid")!=null && !session.getAttribute("userid").toString().equals(request.getParameter("sid"))){
	response.sendRedirect("login.jsp?id="+request.getParameter("id")+"&sid="+request.getParameter("sid"));
}else if(request.getParameter("sid")==null && !session.getAttribute("userid").toString().equals(request.getParameter("id"))){ 
	response.sendRedirect("login.jsp?id="+request.getParameter("id"));

}	else{



	%>

<html>
<head>
  <title>Order | Status</title>
  <link rel="icon" type="image/gif" href="image/logo.png">
   <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
  <meta name="viewport" content="width=device-width" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <link href='css/Material Icons.css' rel='stylesheet' type='text/css'>
  
  <link href='css/progress.css' rel='stylesheet' type='text/css'>
  
  <style>
  .main-body{
    padding-top: 15px;
  }
  .user-name{
    color: orange;
  }
  </style>
  <script type="text/javascript">
	function checkopen(){
		alert('hello');
		$('#sign-pop').modal('show');
		}
	function printdata(){
		window.print();

	}
	function checksession(){
			//alert("plz login");
			$('#sign-pop').modal('show');
		
	}	
	function filterstatus(val){
		var link=document.location.href;
		if(link.indexOf('?')>-1){
			
			var newlink=removeParam("type");
			document.location.href=newlink+"&type="+val;
        
		}else{
			document.location.href=link+"?type="+val;
			
		}
      }
    function settype(val){

    	var mySelect = document.getElementById('filter');
		
		for(var i, j = 0; i = mySelect.options[j]; j++) {
		    if(i.value == val) {
			   
		        mySelect.selectedIndex = j;
		        break;
		    }
		}
       }
    function removeParam(parameter)
    {
      var url=document.location.href;
      var urlparts= url.split('?');

     if (urlparts.length>=2)
     {
      var urlBase=urlparts.shift(); 
      var queryString=urlparts.join("?"); 

      var prefix = encodeURIComponent(parameter)+'=';
      var pars = queryString.split(/[&;]/g);
      for (var i= pars.length; i-->0;)               
          if (pars[i].lastIndexOf(prefix, 0)!==-1)   
              pars.splice(i, 1);
      url = urlBase+'?'+pars.join('&');
     // window.history.pushState('',document.title,url); // added this line to push the new url directly to url bar .

    }
    return url;
    }
  </script>
</head>
<body oncopy="return false" oncut="return false">

<%
String id=request.getParameter("id");
String sql="select * from orders where userid=?";
String sellerid="";
String ordtype="";
Connection con=connection.connect();
PreparedStatement pst=null;
if(request.getParameter("sid")!=null){
	
	if(request.getParameter("type")==null ){
		sql="select * from orders where userid=? and sellerid=?";
		sellerid=request.getParameter("sid");
		pst=con.prepareStatement(sql);
		pst.setString(1, id);
		pst.setString(2, sellerid);
		//out.println("<script> settype('a');</script>");
		ordtype="a";
    	//out.println("<script> settype('c');</script>");
	}else if(request.getParameter("type").equals("c")){
		sql="select * from orders where userid=? and sellerid=? and (status=? or status=?)";
		sellerid=request.getParameter("sid");
		pst=con.prepareStatement(sql);
		pst.setString(1, id);
		pst.setString(2, sellerid);
		pst.setString(3,"pending");
    	pst.setString(4,"Approved");
    	ordtype="c";
    	//out.println("<script> settype('c');</script>");
	}
	
	else if(request.getParameter("type").equals("d")){
		sql="select * from orders where userid=? and sellerid=? and status=?";
		sellerid=request.getParameter("sid");
		pst=con.prepareStatement(sql);
		pst.setString(1, id);
		pst.setString(2, sellerid);
		pst.setString(3,"Deliverd");
		//out.println("<script> settype('d');</script>");
		ordtype="d";
	}else{
		sql="select * from orders where userid=? and sellerid=?";
		sellerid=request.getParameter("sid");
		pst=con.prepareStatement(sql);
		pst.setString(1, id);
		pst.setString(2, sellerid);
		//out.println("<script> settype('a');</script>");
		ordtype="a";
	}
	/*sql="select * from orders where userid=? and sellerid=?";
	sellerid=request.getParameter("sid");
	pst=con.prepareStatement(sql);
	pst.setString(1, id);
	pst.setString(2, sellerid);*/
}else{
	if(request.getParameter("type")==null ){
		sql="select * from orders where userid=?";
		pst=con.prepareStatement(sql);
		pst.setString(1, id);
		//out.println("<script> settype('a');</script>");
		
		ordtype="a";
		
	}else if(request.getParameter("type").equals("c")){
		sql="select * from orders where userid=? and (status=? or status=?)";
		pst=con.prepareStatement(sql);
		pst.setString(1, id);
		pst.setString(2,"pending");
    	pst.setString(3,"Approved");
    
    	ordtype="c";
		
	}
	
	else if(request.getParameter("type").equals("d")){
	sql="select * from orders where userid=? and status=?";
	pst=con.prepareStatement(sql);
	pst.setString(1, id);
	pst.setString(2,"Deliverd");
	//out.println("<script> settype('d');</script>");
	 
	ordtype="d";
	
	}else{
		sql="select * from orders where userid=?";
		pst=con.prepareStatement(sql);
		pst.setString(1, id);
		//out.println("<script> settype('a');</script>");
		
		ordtype="a";
	}
	
}
int total=0;


ResultSet rs=pst.executeQuery();
if(rs.next()){

%>

  <div class="container main-body">
    <img src="logo.png" alt="bazar4u.in" height="150px" width="150px" />
    <a class="pull-right" data-toggle="tooltip" title="Print List" onclick="printdata();"><i class="glyphicon glyphicon-print"></i></a>
   	<div class="pull-right" style="display: inline ; padding-top: 35px;">
      <select class="form-control drop-down-cat" name="filter" id="filter" onchange='filterstatus(this.value);'>

        <option value="c">Pending and Approved</option>
        <option value="d">delivered</option>
        <option value="a">All</option>

    </select>
</div>
<%
	if(ordtype.equals("c")){
		out.println("<script> settype('c');</script>");
	}else if(ordtype.equals("d")){
		out.println("<script> settype('d');</script>");
	}else if(ordtype.equals("a")){
		out.println("<script> settype('a');</script>");
	}

%>
   	
    <hr>
    <div class="pull-right">
      <h2>Order Summary</h2>
    </div>
    <br>
    <br>
    <br>
    <h4 class="user-name">Hello <%=rs.getString("name") %>,</h4>
    <p>Thank you for your order.</p>
    <div class="jumbotron">
      <div class="row">
        
        <div class="col-sm-3 col-md-4 col-lg-3">
          <h4>Your order will be sent to :</h4>
          <p class="bold">
          <%=rs.getString("address") %>
          </p>
          <h4>Your Contact Number :</h4>
          <p class="bold">
          <%=rs.getString("phone") %>
          </p>
        </div>
      </div>
    </div>

    <table class="table">
      <thead>
        <h2>Order Details : </h2>
      </thead>
      <tbody>
      <% rs.previous();
      	while(rs.next()){ %>
        <tr>
          <td><img src="<%="retriveimage.jsp?id="+rs.getInt("productid")+ "&num=1" %>" height="120px" width="120px"></td>
          <td>
            <p><%=rs.getString("productname") %><br>
            <%	Connection con1=connection.connect();
            PreparedStatement spst=con1.prepareStatement("select * from users where userid=?");
            spst.setString(1, rs.getString("sellerid"));
            ResultSet rs1=spst.executeQuery();
            if(rs1.next()){
            %>
            <b>Seller : </b> <%=rs1.getString("shopname") %> </br> <%=rs1.getString("phone") %></p>
            <%}
            rs1.close();
            spst.close();
            con1.close();%>
          </td>
          <td>
          	<%if(rs.getString("status").equalsIgnoreCase("pending")) {%>
          			 <div class="progress red">
          <span class="progress-right">
            <span class="progress-bar"></span>
          </span>
          <span class="progress-right">
            <span class="progress-bar"></span>
          </span>
          <div class="progress-value">Pending</div>
        </div>
          	<%}else if(rs.getString("status").equalsIgnoreCase("Approved")) {%>
          		<div class="progress yellow">
          <span class="progress-left">
            <span class="progress-bar"></span>
          </span>
          <span class="progress-right">
            <span class="progress-bar"></span>
          </span>
          <div class="progress-value">Approved</div>
        </div>
          	<%} else if(rs.getString("status").equalsIgnoreCase("deliverd")) {%>
          			<div class="progress green">
          <span class="progress-left">
            <span class="progress-bar"></span>
          </span>
          <span class="progress-right">
            <span class="progress-bar"></span>
          </span>
          <div class="progress-value">Delivered</div>
        </div>
          	<%} %>
          </td>
          <td>
            <%=rs.getInt("price")-((rs.getInt("price")*rs.getInt("discount"))/100) %>
          </td>
          <td>
          <%=rs.getInt("qty") %>
          </td>
          <td>
          <%=rs.getInt("qty")*(rs.getInt("price")-((rs.getInt("price")*rs.getInt("discount"))/100)) %>
          <% int temp=(rs.getInt("qty")*(rs.getInt("price")-((rs.getInt("price")*rs.getInt("discount"))/100))) ;
          
            total+=temp; %>
          </td>
        </tr>
        <tr>
        <%} %>
          <th></th>
          <th><b class="pull-right">Order Total : </b></th>
          <th><%=total %></th>
        </tr>
      </tbody>
    </table>
    <p> We hope to see you Again Soon</p>
      <h3><a href="https://www.bazar4u.in">Bazar4u.in</a></h3>

  </div>
  <%}else{%>
	
	<div class="text-center">
	<center>
                <img class="img-responsive" src="/image/homepagenot.png" width="90%" height="75%">
                </center>
                <a href="newhomepage.jsp" > Goto Home </a>
              </div>
	
	<%} %>



<%}%>
  

</body>
</html>
