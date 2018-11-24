package com.citytracker;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.apache.commons.io.IOUtils;

import com.mitul.additems;
import com.mitul.getiteams;


/**
 * Servlet implementation class editinfo
 */
@WebServlet("/editinfo")
public class editinfo extends HttpServlet {
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
					mylist1.put("productimage"+counter, img);
					
				}
			}
			if(mylist1.get("typep")==null){
				
				
				String userid=session.getAttribute("userid").toString();
				if(additems.editmultiiteam(mylist1,userid)){
					response.sendRedirect("userprofile.jsp?suc=edpro");
				}else{
					response.sendRedirect("userprofile.jsp?err=edpro");
				}
			}else{
				
					String userid=session.getAttribute("userid").toString();
					
					
					if(additems.updateprofilepic(mylist1, userid)){
						if(mylist1.get("address")!=null &&  mylist1.get("address").toString().length()>1){
						session.setAttribute("address", mylist1.get("address").toString());
						}
					response.sendRedirect("userprofile.jsp?suc=propic");
					}else{
						response.sendRedirect("userprofile.jsp?err=propic");
					}
				
			}	
		}catch(Exception e){
			pw.println(e.getMessage());
			pw.println(e.getStackTrace());
		}
		
	}
	
 }

}