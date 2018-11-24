package com.citytracker;

import java.io.IOException;
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
 * Servlet implementation class deletetempuser
 */
@WebServlet("/deletetempuser")
public class deletetempuser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session=request.getSession();
		String userid=request.getParameter("id");
		if(session.getAttribute("admin")==null || session.getAttribute("admin").toString().equals("")){
			response.sendRedirect("newhomepage.jsp");
		}else{
			
			try{
				Connection con=connection.connect();
				PreparedStatement pst=null;
				ResultSet rs=null;    
					 pst=con.prepareStatement("delete from temp_users where userid=?");
					 pst.setString(1, userid);
					 int co=pst.executeUpdate();
					 if(co>0){
						 response.sendRedirect("admin.jsp?suc=delusr");
					 }else{
						 response.sendRedirect("admin.jsp?err=delusr");
					 }
					 
			}catch(Exception e){  
				
			}
	}

	

}
	
}
