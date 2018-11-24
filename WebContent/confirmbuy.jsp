<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.* ,java.sql.*,com.mitul.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	
 	String fname=request.getParameter("fname");
 	String pincode=request.getParameter("pin");
 	String address=request.getParameter("add");
	String email=request.getParameter("email");	
	String lname=request.getParameter("lname");
	String phone=request.getParameter("phone");
	String id=request.getParameter("myid");
	String qty=request.getParameter("qty");
 	
	//out.println(fname+"\t"+lname+"\t"+pincode+"\t"+address+"\t"+phone+"\t"+email+"\t"+id);
	
	 if(order.addorder(fname, lname, email, pincode, address, phone, id,qty)){
		 out.println("success");
	 }else{
		 
		 out.println("falied");
	 }
%>

</body>
</html>