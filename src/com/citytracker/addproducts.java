package com.citytracker;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import com.mitul.*;


import org.apache.commons.fileupload.disk.DiskFileItemFactory;

/**
 * Servlet implementation class addproducts
 */
@WebServlet("/addproducts")
public class addproducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session =request.getSession();
		PrintWriter pw=response.getWriter();
		//response.sendRedirect("newhomepage.jsp?pagecount=0");
		if(session.getAttribute("userid")==null){
			response.sendRedirect("newhomepage.jsp?pagecount=0");
		}
	
		String userid=session.getAttribute("userid").toString();
		String seller=session.getAttribute("shopname").toString();
		HashMap list1=new HashMap();
		int counter=0;
	
		
		if(ServletFileUpload.isMultipartContent(request)){
			
			try {
				List<FileItem> files=new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				// ServletFileUpload upload = new ServletFileUpload();
			    // FileItemIterator files = upload.getItemIterator(request);
				 for(FileItem fi : files){
					 if(!fi.isFormField()){
						 counter++;
			
						 list1.put("image"+counter, fi.get());
					 }else{
						 list1.put(fi.getFieldName(), fi.getString());
					 }
				 }
				 list1.put("seller", seller);
				 list1.put("userid", userid);
				if(list1.get("catagory1").equals("others")){
					list1.put("catagory",list1.get("catagory2"));	
				}else{
					list1.put("catagory",list1.get("catagory1"));	
				}
				// pw.println(list1.get("name"));
				 additems.setmultiiteam(list1, counter);
				response.sendRedirect("userprofile.jsp");
				 
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		
	}

}
