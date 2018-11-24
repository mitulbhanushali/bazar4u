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
 * Servlet implementation class eventpeople
 */
@WebServlet("/eventpeople")
public class eventpeople extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			HttpSession session =request.getSession();
			if(session.getAttribute("login")==null){
				response.sendRedirect("newhomepage.jsp?pagecount=0");
			}else{
			
				response.setContentType("application/json");
				String userid=session.getAttribute("userid").toString();
				int eventid=Integer.parseInt(request.getParameter("id"));
				PrintWriter pw=response.getWriter();
				String res="[";
				boolean c=true;
				try{
					Connection con=connection.connect();
					PreparedStatement pst=con.prepareStatement("select * from events where userid=? and eventid=?");
					pst.setString(1, userid);
					pst.setInt(2, eventid);
					ResultSet rs=pst.executeQuery();
					if(rs.next()){
						String members=rs.getString("interested");
						String member[]=members.split(",");
						for(String temp : member){
							int mem=Integer.parseInt(temp);
						    pst=con.prepareStatement("select * from users where id=?");
						    pst.setInt(1, mem);
						    rs=pst.executeQuery();
						   // pw.print("ok1"+mem);
						    while(rs.next()){	
								String name=rs.getString("shopname");
								String email=rs.getString("email");
								String phone=rs.getString("phone");
								String address=rs.getString("address");
								//pw.println(name);
							if(c){
									res=res+" { \"name\" : \""+name+"\""+",\"email\" : \""+email+"\""+", \"phone\" : "+"\""+phone+"\""+", \"address\" : "+"\""+address+"\""+" } ";
									
									c=false;
								}else{
									res=res+" , { \"name\" : \""+name+"\""+",\"email\" : \""+email+"\""+", \"phone\" : "+"\""+phone+"\""+", \"address\" : "+"\""+address+"\""+" } ";
									
								}
								
							}
							
						}
						res=res+" ]";
						pw.println(res);
								
					}else{
						rs.close();
						pst.close();
						con.close();
						response.sendRedirect("userprofile.jsp");
					}
					
					
				}catch(Exception e){
					
				}

			}
		
		
		
	}


}
