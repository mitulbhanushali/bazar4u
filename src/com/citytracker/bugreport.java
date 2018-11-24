package com.citytracker;


import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.apache.commons.io.IOUtils;
import com.mitul.developers;
import com.mitul.sendmail;
/**
 * Servlet implementation class bugreport
 */
@WebServlet("/bugreport")
public class bugreport extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session =request.getSession();
		ServletFileUpload fup=new ServletFileUpload();
		PrintWriter out=response.getWriter();
		HashMap list1=new HashMap();
		try {
			FileItemIterator ir=fup.getItemIterator(request);
			while(ir.hasNext()){
				FileItemStream myit=ir.next();
				if(myit.isFormField()){
					InputStream st=myit.openStream();
					
					 list1.put(myit.getFieldName(), Streams.asString(st));
					
				}else{
					InputStream st=myit.openStream();
					 
					byte img[]=IOUtils.toByteArray(st);
					list1.put("image", img);
					
				}
				
				
			}
			
			if(developers.bug_report(list1)){
				String sub="Bug Report";
				String msg="Name : "+list1.get("bugname")+" <br> type : "+ list1.get("subject")+" <br> info : "+ list1.get("message");
				sendmail.send("mitulbhanushali22@gmail.com", sub, msg);
				sendmail.send("patelyash12345@gmail.com", sub, msg);
				response.sendRedirect("newhomepage.jsp?suc=bgr");
			}else{
				
				response.sendRedirect("newhomepage.jsp?err=bgr");
			}
			
		}catch(Exception e){
			out.println(e.getMessage());
		}
	}

}
