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

import com.mitul.SmsGateway;
import com.mitul.connection;
import com.mitul.sendmail;

/**
 * Servlet implementation class canceltotalorder
 */
@WebServlet("/canceltotalorder")
public class canceltotalorder extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		PrintWriter pw=response.getWriter();
		if(session.getAttribute("login")==null || !request.getParameter("sellername").equals(session.getAttribute("userid").toString())){
			response.sendRedirect("newhomepage.jsp?pagecount=0");
		}else{
		
		
		String res="[";
		String buyername=request.getParameter("bname");
		String sellername=request.getParameter("sellername");
		
		String ordstatus=request.getParameter("status");
		boolean c=true;
		try{
			Connection con=connection.connect();
			PreparedStatement pst=con.prepareStatement("insert into cancel_orders  select * from orders where userid=? and sellerid=? and status=?");
			pst.setString(1, buyername);
			pst.setString(2, sellername);
			pst.setString(3, ordstatus);
			int count=pst.executeUpdate();
			if(count>0){
		 pst=con.prepareStatement("delete from orders where userid=? and sellerid=? and status=?");
			pst.setString(1, buyername);
			pst.setString(2, sellername);
			pst.setString(3, ordstatus);
			int co=pst.executeUpdate();
			if(co>0){
				
				pst=con.prepareStatement("select * from users where userid=?");
				pst.setString(1, buyername);
				ResultSet rs=pst.executeQuery();
				if(rs.next()){
					String email=rs.getString("email");
				String msg="<html><body><b>Sorry sir, </br> &nbsp;&nbsp; Your order is canceled by seller due to some reason.</b></body></html>";
				
				sendmail.send(email, "Seller cancel Order", msg);
				SmsGateway.sendSms(rs.getString("phone"),"Sorry sir,Your order is canceled by seller due to some reason.", "BzUORD");
				response.sendRedirect("requestorders.jsp?suc=delord");
				}
				pst.close();
				con.close();
				response.sendRedirect("requestorders.jsp?suc=canall");
			}else{
				pst.close();
				con.close();
				response.sendRedirect("requestorders.jsp?err=canall");
			}
			}else{
				pst.close();
				con.close();
				response.sendRedirect("requestorders.jsp?err=canall");
			}
		}catch(Exception e){
			pw.println(e.getMessage());
			
		}
		}
		
	}

	
}
