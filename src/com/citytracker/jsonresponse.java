package com.citytracker;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mitul.*;
/**
 * Servlet implementation class jsonresponse
 */
@WebServlet("/jsonresponse")
public class jsonresponse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	/*[
  {
    "name": "Meowsy",
    "species" : "cat",
    "foods": {
      "likes": ["tuna", "catnip"],
      "dislikes": ["ham", "zucchini"]
    }
  },
  
  
]*/		
		//" [ {\"name\": \"Meowsy\",\"species\" : \"cat\", }]"
		HttpSession session=request.getSession();
		if(session.getAttribute("login")==null || !request.getParameter("sellername").equals(session.getAttribute("userid").toString())){
			response.sendRedirect("newhomepage.jsp?pagecount=0");
		}else{
		response.setContentType("application/json");
		PrintWriter pw=response.getWriter();
		String res="[";
		String buyername=request.getParameter("bname");
		String sellername=request.getParameter("sellername");
		
		String ordstatus=request.getParameter("status");
		boolean c=true;
		try{
			Connection con=connection.connect();
			PreparedStatement pst=con.prepareStatement("select * from orders where userid=? and sellerid=? and status=?");
			pst.setString(1, buyername);
			pst.setString(2, sellername);
			pst.setString(3, ordstatus);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){	
				String productname=rs.getString("productname");
				int price=rs.getInt("price")-((rs.getInt("price")*rs.getInt("discount"))/100);
				int qty=rs.getInt("qty");
				int productid=rs.getInt("productid");
				int orderid=rs.getInt("orderid");
			if(c){
					res=res+" { \"name\" : \""+productname+"\""+",\"price\" : \""+price+"\""+", \"qty\" : "+"\""+qty+"\""+", \"productid\" : "+"\""+productid+"\""+" , \"orderid\" : "+"\""+orderid+"\""+" } ";
					
					c=false;
				}else{
					res=res+" , { \"name\" : \""+productname+"\""+",\"price\" : \""+price+"\""+", \"qty\" : "+"\""+qty+"\""+", \"productid\" : "+"\""+productid+"\""+" , \"orderid\" : "+"\""+orderid+"\""+" } ";
					
				}
				
			}
			res=res+" ]";
			pw.println(res);
			
		}catch(Exception e){
			
		}
	}

	}

}
