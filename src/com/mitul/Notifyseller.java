package com.mitul;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;

public class Notifyseller {
	
		public static boolean Notify(ArrayList list){
			ArrayList<String> phone=new ArrayList();
			ArrayList<String> email=new ArrayList();
			try{
			Connection con=connection.connect();
			PreparedStatement pst=null;
			ResultSet rs=null;
			Iterator iter = list.iterator();
		      while (iter.hasNext()) {
		         
		   
				 pst=con.prepareStatement("select * from users where userid='"+iter.next()+"'");
				 rs=pst.executeQuery();
				 if(rs.next()){
					 Sms.Notifyseller(rs.getString("firstname"),rs.getString("phone"));
					 sendmail.send(rs.getString("email"), "New order", "You receive new order plz vist :- https://bazar4u.in");
				 }
		      }
		//	sendhtmlmail.ordersummary(session.getAttribute("email").toString(),session.getAttribute("userid").toString(),session.getAttribute("name").toString());
			//Sms.sendOrderSummary(session.getAttribute("name").toString(), session.getAttribute("phone").toString(), session.getAttribute("userid").toString());
			
		      return true;
			}catch(Exception e){
				return false;
			}
		}
}
