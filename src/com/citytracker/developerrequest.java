package com.citytracker;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mitul.*;
/**
 * Servlet implementation class developerrequest
 */
@WebServlet("/developerrequest")
public class developerrequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String name=request.getParameter("developername");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String type=request.getParameter("subject");
		String skill=request.getParameter("message");
		if(developers.setDeveloper(name,email,phone,type,skill )){
			String sub="New Developer Request";
			String msg="Name : "+name+" <br> phone : "+ phone+" <br> email : "+ email+" <br> type : "+ type+" <br> skills : "+ skill;
			sendmail.send("mitulbhanushali22@gmail.com", sub, msg);
			sendmail.send("patelyash12345@gmail.com", sub, msg);
			response.sendRedirect("jointeam.html?suc=req");
		}else{
			response.sendRedirect("jointeam.html?err=req");
		}
	}

}
