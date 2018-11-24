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

import com.mitul.additems;
import com.mitul.advertise; 

/**
 * Servlet implementation class addadvertise
 */
@WebServlet("/addadvertise")
public class addadvertise extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session =request.getSession();
		ServletFileUpload fup=new ServletFileUpload();
		PrintWriter out=response.getWriter();
		int counter=0;
		String userid=session.getAttribute("userid").toString();
		
				
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
					
				
					 counter++;
					byte img[]=IOUtils.toByteArray(st);
					
					
					
					list1.put("image"+counter, img);
				
				}
				
				
			}
			
			 list1.put("userid", userid);
			
			String test=advertise.setadvertise(list1, counter);
		
			if(test.equals("true")){
				 response.sendRedirect("newhomepage.jsp?suc=addadv");
			 }else{
				out.println(test);
				//response.sendRedirect("newhomepage.jsp?err=addadv");
			 }
			
		} catch (Exception e) {
			out.print(e.getMessage());
		}
		
	}

}
