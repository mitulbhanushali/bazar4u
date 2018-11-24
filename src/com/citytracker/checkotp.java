package com.citytracker;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class checkotp
 */
@WebServlet("/checkotp")
public class checkotp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public void doPost(HttpServletRequest rq, HttpServletResponse rs) throws IOException{
    	PrintWriter pw=rs.getWriter();
    	String otp1=rq.getParameter("otp");
    	HttpSession ses=rq.getSession();
    	String otp2=(String)ses.getAttribute("otp");
    	if(otp1.equals(otp2)){
    	//	pw.println("verification successful");
    		//RequestDispatcher rd=rq.getRequestDispatcher("adduser");
    		try {
    			ses.setAttribute("emailvari", "true");
    			ses.removeAttribute("otp");
    			Random ran=new Random();
    			long num=ran.nextInt(65565);
    			String s=Long.toString(num);
    			ses.setAttribute("otp",s);
    			URL url=new URL("http://api.msg91.com/api/sendhttp.php?route=4&country=91&flash=0&unicode=0&campaign=viaSOCKET&authkey=170068Ai8KgRIyu7l5993d6f2&mobiles="+ses.getAttribute("phone").toString()+"&message=OTP is "+s+" &sender=BZuOTP");
    			URLConnection urlcon=url.openConnection();
    			BufferedReader br=new BufferedReader(new InputStreamReader(urlcon.getInputStream()));	
    			rs.sendRedirect("takesms.jsp");
				//rd.forward(rq, rs);
    			//String fname=ses.getAttribute("phone").toString();
    			//pw.println(fname);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    		    		
    	}else{
    		//pw.println("verification failed");
    		rs.sendRedirect("newhomepage.jsp?pagecount=0&err=email");
    		ses.removeAttribute("otp");
    		ses.invalidate();
    	}
    	
    }

}
