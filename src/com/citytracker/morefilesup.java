package com.citytracker;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import java.util.*;
import java.io.*;
import com.mitul.*;

/**
 * Servlet implementation class morefilesup
 */
@WebServlet("/morefilesup")
public class morefilesup extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw=response.getWriter();
		getiteams iteams=new getiteams();
		HashMap mylist1=new HashMap();
		int counter=0;
		if(ServletFileUpload.isMultipartContent(request)){
			try{
				
				List<FileItem> mylist= new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				for(FileItem fim : mylist){
					if(!fim.isFormField()){
						counter++;
						mylist1.put("image"+counter, fim.get());
					}else{
						mylist1.put(fim.getFieldName(), fim.getString());
					}
					
					
				}
				additems.setmultiiteam(mylist1, counter);
			}catch(Exception e){
				pw.println(e.getMessage());
				pw.println(e.getStackTrace());
			}
		}
	}

	

}
