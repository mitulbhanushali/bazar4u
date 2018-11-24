package com.citytracker;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import com.mitul.*;
/**
 * Servlet implementation class deleteproduct
 */
@WebServlet("/deleteproduct")
public class deleteproduct extends HttpServlet {
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
					PreparedStatement pst=con.prepareStatement("select * from finaliteams where id=?");
					pst.setInt(1, id);
					ResultSet rs=pst.executeQuery();
					if(rs.next()){
						 if(userid.equals(rs.getString("userid"))){
							 rs.close();
							 pst=null;
							 pst=con.prepareStatement("INSERT INTO deleted_items select * from finaliteams where id=?");
							 pst.setInt(1, id);
							 pst.executeUpdate();
							 pst=null;
							 pst=con.prepareStatement("delete from finaliteams where id=?");
							 pst.setInt(1, id);
							 pst.executeUpdate();
							 pst.close();
							 con.close();
							 response.sendRedirect("userprofile.jsp");
						 }else{
							 rs.close();
							 pst.close();
							 con.close();
							 response.sendRedirect("userprofile.jsp");
						 }
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			
	}

}
