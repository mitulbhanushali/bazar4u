package com.citytracker;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class checkresetotp
 */
@WebServlet("/checkresetotp")
public class checkresetotp extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		int count=0;
		if(session.getAttribute("otptry")==null){
			count=0;
		}else{
			count=Integer.parseInt(session.getAttribute("otptry").toString());
		}
		if(count<3){
		String userotp=request.getParameter("otp");
		String sessionotp=session.getAttribute("resetotp").toString();
		if(userotp.equals(sessionotp)){
			session.setAttribute("changepassword", "true");
			session.removeAttribute("resetotp");
			response.sendRedirect("takenewpassword.jsp");
		}else{
			count++;
			session.setAttribute("otptry", count);
			response.sendRedirect("getresetotp.jsp");
		}
		}else{
			response.sendRedirect("newhomepage.jsp");
			
		}
	}

}
