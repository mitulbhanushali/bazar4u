c<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.* , java.io.*,com.mitul.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Images</title>
</head>
<body>
<%! byte b[]=null; 
	//int value;
%>
<%
	String ss=request.getParameter("id");
	int imageid;

	if(request.getParameter("num")==null){
		imageid=1;
		
	}else{
		imageid=Integer.parseInt(request.getParameter("num"));
	}
	String im="image"+imageid;
	Connection con=null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con=connection.connect();
		String sql="select * from advertise where adv_id=?";
			
			
		
			
		PreparedStatement pst=con.prepareStatement(sql);
		pst.setInt(1,Integer.parseInt(ss));
		ResultSet rs=pst.executeQuery();
		if(rs.next()){
			b=rs.getBytes(im);
			//value=rs.getInt("value");
		}
		response.setContentType("image/gif");
		OutputStream os=response.getOutputStream();
		os.write(b);
		//out.print(value);
		os.flush();
		os.close();
	}catch(Exception e)
	{
		out.println(e.getMessage());
	}
%>

</body>
</html>