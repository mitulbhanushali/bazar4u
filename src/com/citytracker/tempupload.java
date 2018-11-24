package com.citytracker;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.ByteBuffer;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.apache.commons.io.IOUtils;

import com.mitul.additems;


/**
 * Servlet implementation class tempupload
 */
@WebServlet("/tempupload")
public class tempupload extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session =request.getSession();
		ServletFileUpload fup=new ServletFileUpload();
		PrintWriter out=response.getWriter();
		int counter=0;
		String userid=session.getAttribute("userid").toString();
		String seller=session.getAttribute("shopname").toString();
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
					 counter++;
					byte img[]=IOUtils.toByteArray(st);
					
					
					
					list1.put("image"+counter, img);
					
				}
				
				
			}
			list1.put("seller", seller);
			 list1.put("userid", userid);
			 list1.put("city", city);
			if(list1.get("catagory1").equals("others")){
				list1.put("catagory",list1.get("catagory2"));	
			}else{
				list1.put("catagory",list1.get("catagory1"));	
			}
			
		
			if(additems.setmultiiteam(list1, counter)){
				 response.sendRedirect("userprofile.jsp?suc=addpro");
			 }else{
				
				response.sendRedirect("userprofile.jsp?err=addpro");
			 }
			
		} catch (Exception e) {
			out.print(e.getMessage());
		}
		
	}

	

}
