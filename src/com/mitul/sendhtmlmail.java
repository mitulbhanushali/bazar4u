package com.mitul;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

public class sendhtmlmail {

	public static void ordersummary(String to,String userid,String name){
		
		String myhtml="<html><head><title>Order summary</title></head><body>"
				+ "<b> Thanks &nbsp; "+name+"&nbsp; for Your order </b> </br>"
				+"<a href='http://bazar4u.in/ordersummary.jsp?id="+userid+"' > View Order </a><body>"
				+" </body></html>";
		
		sendmail.send(to, "Manage order", myhtml);
		
		
	}
}
