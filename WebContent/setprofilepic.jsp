<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.* , java.io.*,com.mitul.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!byte b[]=null; %>
<%




		out.clear();
		 
		Connection con=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=connection.connect();
			PreparedStatement pst=null;
			String sql="";
			if(request.getParameter("id")!=null){
				sql="select * from users where userid=?";
				String ss=request.getParameter("id");
				 pst=con.prepareStatement(sql);
				pst.setString(1,ss);
			}else if(request.getParameter("cid")!=null){
				sql="select * from users where id=?";
				int id=Integer.parseInt(request.getParameter("cid"));
				 pst=con.prepareStatement(sql);
				 pst.setInt(1, id);
				
			}	
			
			ResultSet rs=pst.executeQuery();
			if(rs.next()){
				b=rs.getBytes("image1");
				//value=rs.getInt("value");
			}
			
			response.setContentType("image/gif");
			/*OutputStream os=response.getOutputStream();
			os.write(b);
			//out.print(value);
			os.flush();
			os.close();*/
			response.getOutputStream().write(b);
            response.getOutputStream().flush();
            response.getOutputStream().close();
		}catch(Exception e)
		{
			
		}%>

</body>
</html>