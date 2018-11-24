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
import com.mitul.*;
/**
 * Servlet implementation class cancelproduct
 */
@WebServlet("/cancelproduct")
public class cancelproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		if(session.getAttribute("login")==null){
			
			response.sendRedirect("newhomepage.jsp?pagecount=0");
		}else{
			String userid=session.getAttribute("userid").toString();
			int ord=Integer.parseInt(request.getParameter("oid"));
			try{
				Connection con=connection.connect();
				PreparedStatement pst=con.prepareStatement("select * from orders where orderid=? and sellerid=?");
				pst.setInt(1,ord);
				pst.setString(2, userid);
				ResultSet rs=pst.executeQuery();
				if(rs.next()){
					String buyr=rs.getString("userid");
					String productname=rs.getString("productname");
					pst=con.prepareStatement("insert into cancel_orders  select * from orders where orderid=?");
					pst.setInt(1, ord);
					pst.executeUpdate();
					pst=null;
					pst=con.prepareStatement("delete from orders where orderid=?");
					pst.setInt(1, ord);
					int c=pst.executeUpdate();
					if(c>0){
						pst=con.prepareStatement("select * from users where userid=?");
						pst.setString(1, buyr);
						rs=pst.executeQuery();
						if(rs.next()){
							String email=rs.getString("email");
						String msg="<html><body><b>your product "+ productname+" is canceled by seller</b></body></html>";
						
						sendmail.send(email, "Seller cancel product", msg);
						SmsGateway.sendSms(rs.getString("phone"),"Sorry sir,Your product"+productname+" is canceled by seller due to some reason.", "BzUORD");
						response.sendRedirect("requestorders.jsp?suc=delord");
						response.sendRedirect("requestorders.jsp?suc=delord");
						}
					}else{
						response.sendRedirect("requestorders.jsp?err=delord");
					}
				}else{
					response.sendRedirect("requestorders.jsp?err=delord");
				}
				
			}catch(Exception e){
				
				
			}
		}
	}

	

}
