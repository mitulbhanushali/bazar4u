package com.citytracker;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import com.mitul.*;
/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
     private static String userid="";
     private static String  name="";
     private static String  address="";
     private static String city="";
     private static String phone="";
     private static String pincode="";
     private static String shopname="";
     private static int    id;
     public static PrintWriter pw;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String pass=request.getParameter("password");
		pw=response.getWriter();
		if(checklogin(email,pass)){
			HttpSession session=request.getSession();
			session.setAttribute("userid", userid);
			session.setAttribute("name", name);
			session.setAttribute("address", address);
			session.setAttribute("phone", phone);
			session.setAttribute("city", city);
			session.setAttribute("email", email);
			session.setAttribute("login", true);
			session.setAttribute("pincode", pincode);
			session.setAttribute("shopname", shopname);
			session.setAttribute("id", id);
			
			Cookie cks=new Cookie("city",city.toLowerCase());
			cks.setMaxAge(2*24*3600);
			response.addCookie(cks);
			if(request.getParameter("pageinfo")==null){
				response.sendRedirect("newhomepage.jsp?pagecount=0&suc=login");
			}else if(request.getParameter("pageinfo").contains("?")){
				String pageinfo=request.getParameter("pageinfo");
				response.sendRedirect(pageinfo+"&pagecount=0&suc=login");
			
			}else{
			
				String pageinfo=request.getParameter("pageinfo");
				response.sendRedirect(pageinfo+"?pagecount=0&suc=login");
			}
			
		}else{
			if(request.getParameter("pageinfo")==null){
				response.sendRedirect("newhomepage.jsp?pagecount=0&err=login");
			}else if(request.getParameter("pageinfo").contains("?")){
				String pageinfo=request.getParameter("pageinfo");
				response.sendRedirect(pageinfo+"&pagecount=0&err=login");
			
			}else{
				String pageinfo=request.getParameter("pageinfo");
				response.sendRedirect(pageinfo+"?pagecount=0&err=login");
			}
		
		}
		
		
	}
	
	public static boolean checklogin(String email,String pass){
		try{
			Connection con=connection.connect();
			PreparedStatement pst=con.prepareStatement("select * from users where email=? and password=?");
			pst.setString(1, email);
			pst.setString(2, cryptWithMD5(pass));
			ResultSet rs=pst.executeQuery();
			if(rs.next()){
				userid=rs.getString("userid");
				name=rs.getString("firstname")+" "+rs.getString("lastname");
				address=rs.getString("address");
				phone=rs.getString("phone");
				city=rs.getString("city");
				pincode=rs.getString("pincode");
				shopname=rs.getString("shopname");
				id=rs.getInt("id");
				return true;
			}else{
				return false;
			}
		}catch(Exception e){
			pw.println(e.getMessage());
			return false;
		}
		
	}
	 private static MessageDigest md;

	   public static String cryptWithMD5(String pass){
	    try {
	        md = MessageDigest.getInstance("MD5");
	        byte[] passBytes = pass.getBytes();
	        md.reset();
	        byte[] digested = md.digest(passBytes);
	        StringBuffer sb = new StringBuffer();
	        for(int i=0;i<digested.length;i++){
	            sb.append(Integer.toHexString(0xff & digested[i]));
	        }
	        return sb.toString();
	    } catch (NoSuchAlgorithmException ex) {
	        
	    }
	        return null;


	   }

}
