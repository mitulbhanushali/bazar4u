package com.mitul;
import java.util.Properties;

import javax.mail.*;    
import javax.mail.internet.*;
import javax.mail.Authenticator;
public class sendmail {

		public static boolean send(String to,String sub,String msg){
			
			  Properties props = new Properties();    
//	          props.put("mail.smtp.host", "smtp.gmail.com");    
//	          props.put("mail.smtp.socketFactory.port", "465");    
//	          props.put("mail.smtp.socketFactory.class",    
//	                    "javax.net.ssl.SSLSocketFactory");    
//	          props.put("mail.smtp.auth", "true");    
//	          props.put("mail.smtp.port", "465");    
			  
			  props.put("mail.smtp.host", "smtp.gmail.com");
				props.put("mail.smtp.socketFactory.port", "465");
				props.put("mail.smtp.socketFactory.class",
						"javax.net.ssl.SSLSocketFactory");
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.port", "465");

			  
	          //get Session   
	          Session session = Session.getDefaultInstance(props,    
	           new javax.mail.Authenticator() {    
	           protected PasswordAuthentication getPasswordAuthentication() {    
	           return new PasswordAuthentication("bazar4uonly@gmail.com","MitulYash@1222");  
	           }    
	          });    
	          //compose message    
	          try {    
	           MimeMessage message = new MimeMessage(session);   
	           message.setFrom(new InternetAddress("bazar4uonly@gmail.com"));
	           message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
	           message.setSubject(sub);    
	           message.setText(msg,"utf-8","html");    
	           //send message  
	           Transport.send(message);    
	           //System.out.println("message sent successfully");  
	           return true;
	          } catch (Exception e) {System.out.println(e); return false;}    
	             
	    }
			
		}


