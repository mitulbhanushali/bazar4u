package com.citytracker;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import com.mitul.*;
/**
 * Servlet implementation class deleteorder
 */
@WebServlet("/deleteorder")
public class deleteorder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session =request.getSession();
		PrintWriter pw=response.getWriter();
		if(session.getAttribute("userid")==null){
			response.sendRedirect("newhomepage.jsp?pagecount=0");
		}else{
			int productid=Integer.parseInt(request.getParameter("id").toString());
			String userid=session.getAttribute("userid").toString();
			
			try{
				Connection con=connection.connect();
				PreparedStatement pst=con.prepareStatement("select status from orders where productid=? and userid=?");
				pst.setInt(1, productid);
				pst.setString(2, userid);
				ResultSet rs=pst.executeQuery();
				if(rs.next()){
				//	
					if(rs.getString("status").equals("Approved") || rs.getString("status").equals("Deliverd")){
						response.sendRedirect("yourorders.jsp?err=delord");
					}else{
							pst=con.prepareStatement("insert into cancel_orders  select * from orders where productid=? and userid=?");
							pst.setInt(1, productid);
							pst.setString(2, userid);
							pst.executeUpdate();
							pst=null;
						 pst=con.prepareStatement("delete from orders where productid=? and userid=?");
							pst.setInt(1, productid);
							pst.setString(2, userid);
						int count=pst.executeUpdate();
							if(count>0){
								response.sendRedirect("yourorders.jsp?suc=delord");
							}else{
								response.sendRedirect("yourorders.jsp?err=delord");
							}
					}
				}else{
					response.sendRedirect("yourorders.jsp?err=delord");
				}
			}catch(Exception e){
				
				
			}
		}
	}

	

}
