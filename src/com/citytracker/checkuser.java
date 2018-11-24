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

import com.mitul.connection;

/**
 * Servlet implementation class checkuser
 */
@WebServlet("/checkuser")
public class checkuser extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/json");
		PrintWriter pw=response.getWriter();
		String id=request.getParameter("id");
		Connection con=connection.connect();
		PreparedStatement pst;
		String res="[";
		try {
			pst = con.prepareStatement("select userid from finaliteams where id=?");
			pst.setInt(1, Integer.parseInt(id));
			ResultSet rs=pst.executeQuery();
			if(rs.next()){
				String userid=rs.getString("userid");
			
				pst=null;
				pst=con.prepareStatement("select * from users where userid=?");
				pst.setString(1, userid);
				rs=null;
				rs=pst.executeQuery();
				if(rs.next()){
					if(rs.getString("type").equals("shop")){
						String per="yes";
						res=res+" { \"shop\" : \""+per+"\""+" , \"id\" : "+"\""+rs.getInt("id")+"\""+" } ";;
						res=res+"]";
						pw.println(res);
					}else{
						String per="no";
						res=res+" { \"shop\" : \""+per+"\""+" , \"id\" : "+"\""+rs.getInt("id")+"\""+" } ";;
						res=res+"]";
						pw.println(res);

					}
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}


}
