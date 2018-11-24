package com.citytracker;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mitul.setHitCounter;
/**
 * Servlet implementation class hitcounter
 */
@WebServlet("/hitcounter")
public class hitcounter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id=request.getParameter("id");
		String type=request.getParameter("type");
		setHitCounter counter=new setHitCounter();
			if(type.equals("product")){
				counter.setproductcount(id);
				
			}else if(type.equals("shop")){
				counter.setshopcount(id);
			}else if(type.equals("advertise")){
				
			}else{
				
			}
	}

	

}
