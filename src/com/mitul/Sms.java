package com.mitul;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

public class Sms {

	public static boolean sendOrderSummary(String name,String phone,String userid){
		
		try{
			String msg="%20Hello%20"+name+",%20your%20order%20is%20placed%20and%20you%20can%20check%20your%20order%20status%20by%20click%20on%20this%20link:-%20https://www.bazar4u.in/ordersummary.jsp?id="+userid;
		URL url=new URL("http://api.msg91.com/api/sendhttp.php?route=4&country=91&flash=0&unicode=0&campaign=viaSOCKET&authkey=170068Ai8KgRIyu7l5993d6f2&mobiles="+phone+"&message= "+msg+" &sender=BZuORD");
		URLConnection urlcon=url.openConnection();
		BufferedReader br=new BufferedReader(new InputStreamReader(urlcon.getInputStream()));
		
		return true;
		}catch(Exception e){
			return false;
		}
	}
public static boolean Notifyseller(String name,String phone){
		
		try{
			String msg="%20Hello%20"+name+",%20you%20receive%20new%20order%20and%20you%20can%20check%20your%20order%20by%20click%20on%20this%20link:-%20https://www.bazar4u.in/";
		URL url=new URL("http://api.msg91.com/api/sendhttp.php?route=4&country=91&flash=0&unicode=0&campaign=viaSOCKET&authkey=170068Ai8KgRIyu7l5993d6f2&mobiles="+phone+"&message= "+msg+" &sender=BZuORD");
		URLConnection urlcon=url.openConnection();
		BufferedReader br=new BufferedReader(new InputStreamReader(urlcon.getInputStream()));
		
		return true;
		}catch(Exception e){
			return false;
		}
	}
}
