package com.citytracker;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.mitul.*;
/**
 * Servlet implementation class updatepassword
 */
@WebServlet("/updatepassword")
public class updatepassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		PrintWriter pw=response.getWriter();
		if(session.getAttribute("changepassword")==null){
			response.sendRedirect("newhomepage.jsp");
		}else{
		if(session.getAttribute("changepassword").toString().equals("true")){
			try{
				String sql="";
				boolean test=false;
				String type="";
				
				Connection con=connection.connect();
				if(session.getAttribute("type").toString().equals("email")){
					sql="update users set password=? where email=?";
					test=true;
					type="email";
				}else if(session.getAttribute("type").toString().equals("phone")){
					sql="update users set password=? where phone=?";
					test=true;
					type="phone";
				}else{
					con.close();
					response.sendRedirect("newhomepage.jsp");
				}
				
				if(test && request.getParameter("newpassword").equals(request.getParameter("newpassword"))){
				PreparedStatement pst=con.prepareStatement(sql);
				
				pst.setString(1, request.getParameter("newpassword"));
				pst.setString(2, session.getAttribute(type).toString());
				int count=pst.executeUpdate();
				if(count>0){
					session.invalidate();
					pst.close();
					con.close();
					response.sendRedirect("newhomepage.jsp?suc=rsetpass");
				}else{
					pst.close();
					con.close();
					session.invalidate();
					response.sendRedirect("newhomepage.jsp?err=rsetpass");
				}
				}
			
			}catch(Exception e){
				
			}
		
		}else{
			response.sendRedirect("newhomepage.jsp");
		}
		}
	}

}
