package com.citytracker;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class checkadminotp
 */
@WebServlet("/checkadminotp")
public class checkadminotp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		
		if(session.getAttribute("adminpass")!=null){
			String otp=request.getParameter("otp");
			if(otp.equals(session.getAttribute("adminotp").toString())){
				session.setAttribute("admin", "enable");
				session.removeAttribute("adminpass");
				session.removeAttribute("adminotp");
				response.sendRedirect("admin.jsp");
			}else{
				response.sendRedirect("newhomepage.jsp?suc=login");
			}
		}
	}

}
