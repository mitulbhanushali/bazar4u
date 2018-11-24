package com.citytracker;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mitul.sendmail;
import com.mitul.validateData;
/**
 * Servlet implementation class resetpass
 */
@WebServlet("/resetpass")
public class resetpass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type=request.getParameter("type");
		String data=request.getParameter("data");
		HttpSession session=request.getSession();
		if(data.equals(null) || data.equals("")){
			response.sendRedirect("newhomepage.jsp");
		}
		if(type.equals("email")){
			if(!validateData.checkEmail(data)){
				session.invalidate();
				response.sendRedirect("resetpassword.jsp?err=nrg");
			}else{
			Random rand=new Random();
			long s=rand.nextInt(65635);
			String otp=Long.toString(s);
			
			sendmail.send(data, "password Reset", "your OTP for password Reset is "+otp);
			session.setAttribute("resetotp", otp);
			session.setAttribute("email", data);
			session.setAttribute("type","email");
			response.sendRedirect("getresetotp.jsp");
			}
			
		}else if(type.equals("phone")){
			if(!validateData.checkPhone(data)){
				session.invalidate();
				response.sendRedirect("resetpassword.jsp?err=nrg");
			}else{
			Random rand=new Random();
			long s=rand.nextInt(65635);
			String otp=Long.toString(s);
			URL url=new URL("http://api.msg91.com/api/sendhttp.php?route=4&country=91&flash=0&unicode=0&campaign=viaSOCKET&authkey=170068Ai8KgRIyu7l5993d6f2&mobiles="+data+"&message=your OTP for password Reset is  "+otp+" &sender=BZuOTP");
			URLConnection urlcon=url.openConnection();
			BufferedReader br=new BufferedReader(new InputStreamReader(urlcon.getInputStream()));	
			session.setAttribute("resetotp", otp);
			session.setAttribute("phone", data);
			session.setAttribute("type","phone");
			response.sendRedirect("getresetotp.jsp");
			}
		}else{
			response.sendRedirect("newhomepage.jsp");
		}
			
	}

}
