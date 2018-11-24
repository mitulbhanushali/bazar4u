package com.citytracker;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.*;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import java.util.*;
import java.io.*;
/**
 * Servlet implementation class multifile
 */
@WebServlet("/multifile")
public class multifile extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)){
			try{
			List<FileItem> mylist=new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
			for(FileItem fi : mylist){
				if(!fi.isFormField()){
					String fname=fi.getName();
					fi.write(new File("M:/"+File.separator+fname));
				}
			}
			}catch(Exception ees){
				
			}
		}
		
	}

}
