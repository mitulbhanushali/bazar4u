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

import com.mitul.*;
import java.sql.*;
import java.util.Random;
/**
 * Servlet implementation class adduser
 */
@WebServlet("/adduser")
public class adduser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static boolean test=false;
 //  private static char special[]={'@','$','*','#','!','^','?'};
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			
			HttpSession session=request.getSession();
			if(session.getAttribute("smsvari")==null || session.getAttribute("emailvari")==null){
				response.sendRedirect("newhomepage.jsp");
			}else{
				PrintWriter pw=response.getWriter();
				
			
		String fname=session.getAttribute("fname").toString();
		
		String lname=session.getAttribute("lname").toString();
		
		String phone=session.getAttribute("phone").toString();
		
		String address=session.getAttribute("address").toString();
		
		String city=session.getAttribute("city").toString().toLowerCase();
		String pincode=session.getAttribute("pincode").toString();
		String email=session.getAttribute("email").toString();
		String type=session.getAttribute("user-type").toString();
		String password=session.getAttribute("password").toString();
		
		String shopname="";
		String catagory="";
		boolean typeof=true;
		String sql="";
		
		
		if(type.equals("normal")){
			shopname=fname+" "+lname;
			sql="insert into users (userid,firstname,lastname,phone,email,address,city,pincode,password,shopname,type) values (?,?,?,?,?,?,?,?,?,?,?)";
		}else{
			shopname=session.getAttribute("shopname").toString();
			 catagory=session.getAttribute("cat").toString();
			 typeof=false;
			 sql="insert into temp_users (userid,firstname,lastname,phone,email,address,city,pincode,password,shopname,type,category) values (?,?,?,?,?,?,?,?,?,?,?,?)";
		}
		
	
		Random random=new Random();
	//	char spec=special[random.nextInt(6)%6];
		String temp=random.nextInt(32535)+"";  
	
		String userid=fname.substring(fname.length()/2,fname.length())+temp+phone.substring(random.nextInt(5)%5,7);	
		
		
	
			Connection con=connection.connect();
			PreparedStatement pst=con.prepareStatement(sql);
		
			pst.setString(1, userid);
			pst.setString(2, fname);
			pst.setString(3, lname);
			pst.setString(4, phone);
			pst.setString(5, email);
			pst.setString(6, address);
			pst.setString(7, city);
			pst.setString(8, pincode);
			pst.setString(9, cryptWithMD5(password));
			pst.setString(10, shopname);
			pst.setString(11, type);
			if(type.equals("normal")){
				
			}else{
				pst.setString(12, catagory);
			}
			
			
			int count=pst.executeUpdate();
			
			if(count>0){
				session.invalidate();
				city=city.toLowerCase();
				Cookie cks=new Cookie("city",city.toLowerCase());
				cks.setMaxAge(2*24*3600);
				response.addCookie(cks);
				if(request.getParameter("pageinfo")==null){
					if(type.equalsIgnoreCase("shop")){
					sendmail.send("mitul@bazar4u.in", "New Shop", "New Shop is crated plz verfiy");
					sendmail.send("yash@bazar4u.in", "New Shop", "New Shop is crated plz verfiy");
					}
					response.sendRedirect("newhomepage.jsp?pagecount=0&suc=signup");
				}else{
					if(type.equalsIgnoreCase("shop")){
						sendmail.send("mitul@bazar4u.in", "New Shop", "New Shop is crated plz verfiy");
						sendmail.send("yash@bazar4u.in", "New Shop", "New Shop is crated plz verfiy");
						}
					String pageinfo=request.getParameter("pageinfo");
					response.sendRedirect(pageinfo+"?pagecount=0&suc=signup");
				}
				
				
			}else{
				session.invalidate();
				if(request.getParameter("pageinfo")==null){
					response.sendRedirect("newhomepage.jsp?pagecount=0&err=signup");
				}else{
					String pageinfo=request.getParameter("pageinfo");
					response.sendRedirect(pageinfo+"?pagecount=0&err=signup");
				}
				
			}
			session.invalidate();
			
		//	response.sendRedirect("newhomepage.jsp?pagecount=0");
			
			
			
		}}catch(Exception e){
			
			
			
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
