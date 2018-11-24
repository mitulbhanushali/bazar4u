package com.citytracker;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import java.util.*;
import java.io.*;
import com.mitul.*;

/**
 * Servlet implementation class fileup
 */
@WebServlet("/fileup")
public class fileup extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw=response.getWriter();
		HttpSession ses=request.getSession();
//		Part fs=request.getPart("myfile1");
//		pw.println(fs.getName());
		
		//String uname=request.getParameter("uname");
		//pw.println(uname);
		//HashTable val=new HashTable();
		
		String iteams[]=new String [3];
		int count=0;
		String fname="";
		HashMap map=new HashMap();
		if(ServletFileUpload.isMultipartContent(request)){
			
			try{
				List<FileItem> myfiles=new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				for(FileItem fis : myfiles){
					if(!fis.isFormField()){
						// fname=new File(fis.getName()).getName();
						//pw.println(fname);
						//fis.write(new File("M:/"+File.separator+fname));
						//ses.setAttribute("filename", fname);
						map.put("image", fis.get());
					}else{
						
						map.put(fis.getFieldName(), fis.getString());
						//iteams[count]=fis.getString();
						//count++;
						//ses.setAttribute(fis.getFieldName(),fis.getString());
					}
					
					
				}
				pw.println(iteams[2]+"   "+fname);
					//additems.setitem(iteams[0],iteams[1], iteams[2], fname);
					additems.setitem1(map);
				
				
			}catch(Exception ess){
				
				
			}
		}
	}

}
