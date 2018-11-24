package com.citytracker;

import java.io.IOException;
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
 * Servlet implementation class approvedorder
 */
@WebServlet("/approvedorder")
public class approvedorder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		if(session.getAttribute("login")==null){
			response.sendRedirect("newhomepage.jsp?pagecount=0");
			
		}else{
			String buyer=request.getParameter("id");
			String status=request.getParameter("status");
			try{
				Connection con=connection.connect();
				PreparedStatement pst=con.prepareStatement("update orders set status=? where sellerid=? and  userid=?");
				pst.setString(1, status);
				pst.setString(2, session.getAttribute("userid").toString());
				pst.setString(3, buyer);
				int count=pst.executeUpdate();
				if(count>0){
					response.sendRedirect("requestorders.jsp?suc=ordup");
				}else{
					response.sendRedirect("requestorders.jsp?err=ordup");
				}
			}catch(Exception e){
				System.out.println(e.getMessage());
			}
			
		}
	

}
}