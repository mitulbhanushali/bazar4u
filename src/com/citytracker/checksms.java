package com.citytracker;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class checksms
 */
@WebServlet("/checksms")
public class checksms extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException {
		PrintWriter pw=rs.getWriter();
    	String otp1=rq.getParameter("otp");
    	HttpSession ses=rq.getSession();
    	String otp2=(String)ses.getAttribute("otp");
    	if(otp1.equals(otp2)){
    	//	pw.println("verification successful");
    		//RequestDispatcher rd=rq.getRequestDispatcher("adduser");
    		try {
    			ses.setAttribute("smsvari", "true");
    			rs.sendRedirect("adduser");
				//rd.forward(rq, rs);
    			//String fname=ses.getAttribute("phone").toString();
    			//pw.println(fname);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    		ses.removeAttribute("otp");
    		
    	}else{
    		//pw.println("verification failed");
    		rs.sendRedirect("newhomepage.jsp?pagecount=0");
    		ses.removeAttribute("otp");
    		ses.invalidate();
    	}
	}

}
