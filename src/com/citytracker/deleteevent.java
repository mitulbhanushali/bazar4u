package com.citytracker;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mitul.connection;

/**
 * Servlet implementation class deleteevent
 */
@WebServlet("/deleteevent")
public class deleteevent extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
			if(session.getAttribute("login")==null){
				response.sendRedirect("newhomepage.jsp?pagecount=0");
			}else{
				
				int id=Integer.parseInt(request.getParameter("id"));
				String userid=session.getAttribute("userid").toString();
				Connection con=connection.connect();
				try {
					PreparedStatement pst=con.prepareStatement("select * from events where eventid=?");
					pst.setInt(1, id);
					ResultSet rs=pst.executeQuery();
					if(rs.next()){
						 if(userid.equals(rs.getString("userid"))){
							 rs.close();
							 pst=null;
							 pst=con.prepareStatement("INSERT INTO deleted_events select * from events where eventid=?");
							 pst.setInt(1, id);
							 pst.executeUpdate();
							 pst=null;
							 pst=con.prepareStatement("delete from events where eventid=?");
							 pst.setInt(1, id);
							 pst.executeUpdate();
							 pst.close();
							 con.close();
							 response.sendRedirect("manageevent.jsp");
						 }else{
							 rs.close();
							 pst.close();
							 con.close();
							 response.sendRedirect("manageevent.jsp");
						 }
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			
	}

	
}
