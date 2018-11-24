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

import com.mitul.Events;

/**
 * Servlet implementation class setevent
 */
@WebServlet("/setevent")
public class setevent extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		HttpSession session=request.getSession();
		ServletFileUpload fup=new ServletFileUpload();
		PrintWriter out=response.getWriter();
		int counter=0;
		String userid=session.getAttribute("userid").toString();
		String hostname=session.getAttribute("shopname").toString();
		String phone=session.getAttribute("phone").toString();
		String city=session.getAttribute("city").toString();
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
					if(myit.getFieldName().equals("myfilevideo")){
						byte video[]=IOUtils.toByteArray(st);
						list1.put("video", video);
					}else{
						
						 counter++;
						byte img[]=IOUtils.toByteArray(st);
						
						
						
						list1.put("image"+counter, img);
					}
					
					
				}
				
				
			}
			list1.put("hostname", hostname);
			 list1.put("userid", userid);
			list1.put("phone", phone);
			list1.put("city", city);
			if(Events.setevent(list1)){
				response.sendRedirect("userprofile.jsp?suc=addevent");
			}else{
				
				response.sendRedirect("userprofile.jsp?err=addevent");
			}
			/* String tempdate=(String)list1.get("eventdate");
			 String date=tempdate.split("-")[0];
			 String time=tempdate.split("-")[1];
			 out.println(date+"<br>"+time);*/
				
			
			
		} catch (Exception e) {
			out.print(e.getMessage());
		}

	}

}
