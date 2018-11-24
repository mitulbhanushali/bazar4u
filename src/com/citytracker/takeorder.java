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
import java.util.ArrayList;
import java.util.HashMap;

import com.mitul.*;
/**
 * Servlet implementation class takeorder
 */
@WebServlet("/takeorder")
public class takeorder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		byte success=0;
		HttpSession session=request.getSession();
		PrintWriter pw=response.getWriter();
		String qty=request.getParameter("qty");
		String id=request.getParameter("id");
		
		String allqty[]=qty.split(",");
		String allid[]=id.split(",");
		
		ArrayList<String> sellers=new ArrayList();
		
		
		
		
		try{
			Connection con=connection.connect();
			PreparedStatement pst=null;
			ResultSet rs=null;
			for(int i=0;i<allid.length;i++){
			 pst=con.prepareStatement("select * from finaliteams where id="+Integer.parseInt(allid[i]));
			 rs=pst.executeQuery();
			
			if(rs.next()){
				String sellerid=rs.getString("userid");
				if(!sellers.contains(sellerid)){
					sellers.add(sellerid);
				}
				if(checking.checkproduct(Integer.parseInt(allid[i]),sellerid,session.getAttribute("userid").toString(),Integer.parseInt(allqty[i]))){
					success++;
					continue;
				}
				String productname=rs.getString("name");
				int price=rs.getInt("price");
				int discount=rs.getInt("discount");
				java.util.Date date=new java.util.Date();
		        java.sql.Date sqlDate=new java.sql.Date(date.getTime());
		        java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());
				pst=con.prepareStatement("insert into orders(sellerid,userid,name,phone,email,city,pincode,address,productid,qty,productname,price,discount,status,date,time) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ");             
				pst.setString(1, sellerid);
				pst.setString(2, session.getAttribute("userid").toString());
				pst.setString(3, session.getAttribute("name").toString());
				pst.setString(4, session.getAttribute("phone").toString());
				pst.setString(5, session.getAttribute("email").toString());
				pst.setString(6, session.getAttribute("city").toString());
				pst.setString(7, session.getAttribute("pincode").toString());
				pst.setString(8, session.getAttribute("address").toString());
				pst.setInt(9, Integer.parseInt(allid[i]));
				pst.setInt(10,Integer.parseInt(allqty[i]));
				pst.setString(11, productname);
				pst.setInt(12, price);
				pst.setInt(13, discount);
				pst.setString(14, "pending");
				pst.setDate(15,sqlDate);
				pst.setTimestamp(16, sqlTime);
				
				
				
				int count=pst.executeUpdate();
	        //  int count=0;
				 
				if(count>0){
					success++;
					 
				}else{
					break;
				}
				
			
			}
			
			}
			if(success!=allid.length){
				
				response.sendRedirect("newhomepage.jsp?pagecount=0&err=order");
			}else{
				sendhtmlmail.ordersummary(session.getAttribute("email").toString(),session.getAttribute("userid").toString(),session.getAttribute("name").toString());
				Sms.sendOrderSummary(session.getAttribute("name").toString(), session.getAttribute("phone").toString(), session.getAttribute("userid").toString());
				Notifyseller.Notify(sellers);
				response.sendRedirect("newhomepage.jsp?pagecount=0&suc=order");
				
			}
			rs.close();
			pst.close();
			con.close();
		}catch(Exception e){
			
			pw.println(e.getMessage());
			//System.out.println(e.printStackTrace());
		}
		
		
	}
	
	

	
}
