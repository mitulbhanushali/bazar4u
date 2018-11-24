package com.mitul;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

public class SmsGateway {
	
	public static boolean sendSms(String phone,String msg,String type){
		
		try{
			
		URL url=new URL("http://api.msg91.com/api/sendhttp.php?route=4&country=91&flash=0&unicode=0&campaign=viaSOCKET&authkey=170068Ai8KgRIyu7l5993d6f2&mobiles="+phone+"&message= "+msg+" &sender="+type);
		URLConnection urlcon=url.openConnection();
		BufferedReader br=new BufferedReader(new InputStreamReader(urlcon.getInputStream()));
		
		return true;
		}catch(Exception e){
			return false;
		}
	}

}
