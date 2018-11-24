package com.citytracker;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import com.mitul.*;
import com.sun.mail.iap.Response;

/**
 * Servlet implementation class sendotp
 */
@WebServlet("/sendotp")
public class sendotp extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	public void doPost(HttpServletRequest rq,HttpServletResponse rs) throws IOException{
		PrintWriter pw=rs.getWriter();
		String fname=rq.getParameter("fname");
		String lname=rq.getParameter("lname");
		String phone=rq.getParameter("phone");
		String address=rq.getParameter("address");
		String city=rq.getParameter("city");
		String pincode=rq.getParameter("pincode");
		String password=rq.getParameter("password");
		String type=rq.getParameter("user-type");
		String shopname=rq.getParameter("shopname");
		String email=rq.getParameter("email");
		
		try{
			Connection con=connection.connect();
			PreparedStatement pst=con.prepareStatement("select * from users where email=? or phone=?");
			pst.setString(1, email);
			pst.setString(2, phone);
			ResultSet rst=pst.executeQuery();
			if(rst.next()){
				rs.sendRedirect("newhomepage.jsp?pagecount=0&err=exsignup");
			}else{
				
		HttpSession session=rq.getSession();
		session.setAttribute("fname", fname);
		session.setAttribute("lname", lname);
		session.setAttribute("phone", phone);
		session.setAttribute("address", address);
		session.setAttribute("city", city);
		session.setAttribute("pincode", pincode);
		session.setAttribute("password", password);
		session.setAttribute("user-type", type);
		session.setAttribute("email", email);
		if(type.equals("normal")){
			session.setAttribute("shopname", "");
		}else{
			session.setAttribute("shopname", shopname);
			session.setAttribute("cat", rq.getParameter("cat"));
			
		}
		//rs.sendRedirect("newhomepage.jsp?pagecount=0&err=exsignup");
			
		//pw.println(email);
		Random ran=new Random();
		long num=ran.nextInt(65565);
		String s=Long.toString(num);
		if(session.getAttribute("otp")!=null){
			session.removeAttribute("otp");
		}
		session.setAttribute("otp",s);
		sendmail.send(email,"otp verification", s);
		/*RequestDispatcher rd=rq.getRequestDispatcher("takeotp.jsp");
		
			rd.forward(rq, rs);*/
		rs.sendRedirect("takeotp.jsp");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	//	rs.sendRedirect("takeotp.jsp");
		
		
	}

}
