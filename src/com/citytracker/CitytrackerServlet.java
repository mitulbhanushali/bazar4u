package com.citytracker;

import java.io.IOException;
import java.util.Scanner;
import java.sql.*;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class CitytrackerServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/plain");
		resp.getWriter().println("Hello, mitul");
		try{
		Class.forName("com.mysql.jdbc.Driver");
		String databaseName="appdatabase";
		String instanceConnectionName="citytracker";
		/*String jdbcUrl = String.format(
			    "jdbc:mysql://google/%s?cloudSqlInstance=%s&"
			        + "socketFactory=com.google.cloud.sql.mysql.SocketFactory",
			    databaseName,
			    instanceConnectionName);*/

		String url="jdbc:mysql://104.198.88.142:3306/appdatabase";
		
		String uname="mitul";
		String pass="mitul123";
	
		
		Connection cn=DriverManager.getConnection(url,uname,pass);
		Statement st=cn.createStatement();
		String qry="select * from users;";
		ResultSet r=st.executeQuery(qry);
		if(r.next()){
			resp.getWriter().println(r.getString("name"));
		}
		//System.out.println("ok");
		}catch(Exception e){
			resp.getWriter().println(e.getMessage());
		}
		//System.out.println("ok");
		
		
	}
}
