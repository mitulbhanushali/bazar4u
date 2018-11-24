package com.citytracker;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mitul.connection;

/**
 * Servlet implementation class approveuser
 */
@WebServlet("/approveuser")
public class approveuser extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		PrintWriter pw=response.getWriter();
		String userid=request.getParameter("id");
		if(session.getAttribute("admin")==null || session.getAttribute("admin").toString().equals("")){
			response.sendRedirect("newhomepage.jsp");
		}else{
			
			try{
				Connection con=connection.connect();
				PreparedStatement pst=null;
				ResultSet rs=null;    
					pst=con.prepareStatement("SELECT * FROM temp_users WHERE userid=?");
					 pst.setString(1, userid);
					 ResultSet rs1=pst.executeQuery();
					 if(rs1.next()){
					 pst=con.prepareStatement("INSERT INTO users "
					 		+ " (userid,firstname,lastname,phone,email,address,city,pincode,password,shopname,type,category)"    
							 +"values(?,?,?,?,?,?,?,?,?,?,?,?)");
					 pst.setString(1, userid);
						pst.setString(2, rs1.getString("firstname"));
						pst.setString(3, rs1.getString("lastname"));
						pst.setString(4, rs1.getString("phone"));
						pst.setString(5, rs1.getString("email"));
						pst.setString(6, rs1.getString("address"));
						pst.setString(7, rs1.getString("city"));
						pst.setString(8, rs1.getString("pincode"));
						pst.setString(9, rs1.getString("password"));
						pst.setString(10, rs1.getString("shopname"));
						pst.setString(11, rs1.getString("type"));
						pst.setString(12, rs1.getString("category"));
					
					 int co=pst.executeUpdate();
					 if(co>0 ){
					 pst=con.prepareStatement("delete from temp_users where userid=?");
					 pst.setString(1, userid);
					 int co1=pst.executeUpdate();
					 if( co1>0){
						 response.sendRedirect("admin.jsp?suc=appusr");
					 }else{
						 response.sendRedirect("admin.jsp?err=appusr");
					 }
					 }else{
						 response.sendRedirect("admin.jsp?err=appusr");
					 }
					 }else{
						 response.sendRedirect("admin.jsp?err=appusr");
					 }
					 
			}catch(Exception e){  
				pw.println(e.getMessage());
			}
			
			
			
			
		}
	}

	

}
