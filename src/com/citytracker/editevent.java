package com.citytracker;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

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
import com.mitul.additems;
import com.mitul.connection;

/**
 * Servlet implementation class editevent
 */
@WebServlet("/editevent")
public class editevent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	  
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			PrintWriter pw=response.getWriter();
			HashMap mylist1=new HashMap();
			int counter=0;
			ServletFileUpload sfup=new ServletFileUpload();
			HttpSession session=request.getSession();
			if(session.getAttribute("userid")==null){
				response.sendRedirect("newhomepage.jsp?pagecount=0");
			}else{
				String userid=session.getAttribute("userid").toString();
				String hostname=session.getAttribute("shopname").toString();
				String phone=session.getAttribute("phone").toString();
				
			try{
				
				FileItemIterator itr=sfup.getItemIterator(request);
				while(itr.hasNext()){
					FileItemStream fis=itr.next();
					if(fis.isFormField()){
						InputStream is=fis.openStream();
						mylist1.put(fis.getFieldName(), Streams.asString(is));
					}else{
						InputStream is=fis.openStream();
						counter++;
						byte img[]=IOUtils.toByteArray(is);
						mylist1.put("eventimage"+counter, img);
						
					}
				}
			
					
					int count=Integer.parseInt(mylist1.get("counter").toString());
					
					mylist1.put("hostname", hostname);
					mylist1.put("userid", userid);
					mylist1.put("phone", phone);
					
							
					if(Events.editevent(mylist1, count)){
						response.sendRedirect("manageevent.jsp?suc=edevent");
					}else{
						
						response.sendRedirect("manageevent.jsp?err=edevent");
					}
				
			}catch(Exception e){
				pw.println(e.getMessage());
				
			}
			
		}
		
	 }

}
