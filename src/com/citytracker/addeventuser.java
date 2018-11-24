package com.citytracker;


import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class addeventuser
 */
@WebServlet("/addeventuser")
public class addeventuser extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		PrintWriter pw=response.getWriter();
		if(session.getAttribute("login")==null){
			response.sendRedirect("newhomepage.jsp?pagecount=0");
		}else{
			int eid=Integer.parseInt(request.getParameter("eid"));
			int uid=Integer.parseInt(session.getAttribute("id").toString());
			Connection con=connection.connect();
			pw.print("first");
			try {
				PreparedStatement pst=con.prepareStatement("select interested from events where eventid=?");
				pst.setInt(1, eid);
				ResultSet rs=pst.executeQuery();
				pw.print("second");
				String member=null;
				boolean test=false;
				boolean empty=false;
				if(rs.next()){
					member=rs.getString("interested");
					pw.print("third");
					if(member==null){
						member=uid+",";
						empty=true;
					}else{
						String nums[]=member.split(",");
						test=false;
						for(String temp : nums){
							if(uid==Integer.parseInt(temp)){
								test=true;
							}
						}
					}
						if(test){
							response.sendRedirect("events.jsp?err=eregual");
						}else if(!test && !empty){
							member=member+uid+",";
						}
							pst=con.prepareStatement("update  events set interested=? where eventid=? ");
							pst.setString(1, member);
							pst.setInt(2, eid);
							int count=pst.executeUpdate();
							if(count>0){
								rs.close();
								pst.close();
								con.close();
								response.sendRedirect("events.jsp?suc=ereg");
							}else{
								rs.close();
								pst.close();
								con.close();
								response.sendRedirect("events.jsp?err=ereg");
								
							}
							
						
							
					
				}else{
					response.sendRedirect("events.jsp?err=eregnoev");
				}
				
			
			} catch (Exception e) {
				// TODO Auto-generated catch block
				pw.println(e.getMessage());
				
				
			}
			
		}
		
	}

	
}
