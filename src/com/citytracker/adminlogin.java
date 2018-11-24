package com.citytracker;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mitul.SmsGateway;
import com.mitul.connection;

/**
 * Servlet implementation class adminlogin
 */
@WebServlet("/adminlogin")
public class adminlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String  name="";
    private static String  phone="";
    private static String email="";
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String pass=request.getParameter("password");
		
		if(checklogin(email,pass)){
			HttpSession session=request.getSession();
			session.setAttribute("adminphone", phone);
			session.setAttribute("adminname", name);
			session.setAttribute("adminemail", email);
			session.setAttribute("adminpass", "verify");
			
			Random ran=new Random();
			long num=ran.nextInt(65565);
			String s=Long.toString(num);
			session.setAttribute("adminotp",s);
			SmsGateway.sendSms(phone, s, "BzUOTP");
			response.sendRedirect("takeadminotp.jsp");
		}else{
			response.sendRedirect("newhomepage.jsp");
		}
	}
	
	public static boolean checklogin(String email,String pass){
		try{
			Connection con=connection.connect();
			PreparedStatement pst=con.prepareStatement("select * from admin where email=? and password=?");
			pst.setString(1, email);
			pst.setString(2, pass);
			ResultSet rs=pst.executeQuery();
			if(rs.next()){
				
				name=rs.getString("name");
				phone=rs.getString("phone");
				email=rs.getString("email");
				
				return true;
			}else{
				return false;
			}
		}catch(Exception e){
			
			return false;
		}
		
	}

}
