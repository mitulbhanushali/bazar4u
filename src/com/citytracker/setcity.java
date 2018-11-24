package com.citytracker;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class setcity
 */
@WebServlet("/setcity")
public class setcity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void service
	(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String city=request.getParameter("city");
		city=city.toLowerCase();
		Cookie cks=new Cookie("city",city);
		cks.setMaxAge(2*24*3600);
		response.addCookie(cks);
		response.sendRedirect("newhomepage.jsp");
	}

}
