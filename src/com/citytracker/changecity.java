package com.citytracker;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class changecity
 */
@WebServlet("/changecity")
public class changecity extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie cks=new Cookie("city","");
		cks.setMaxAge(0);
		response.addCookie(cks);
		response.sendRedirect("index.jsp");
	}

	
}
