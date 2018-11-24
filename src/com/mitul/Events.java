package com.mitul;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Random;

public class Events {
	
	
	public static boolean setevent(HashMap map){
		

		try{
			
			
			byte image[]=(byte []) map.get("image1");
			byte image2[]=(byte[])map.get("image2");
			byte image3[]=(byte[])map.get("image3");
			byte image4[]=(byte[])map.get("image4");
			
			String ename=(String)map.get("eventname");
			String fb=(String)map.get("fblink");
			String youtube=(String)map.get("youtubelink");
			String insta=(String)map.get("instalink");
			String einfo=(String)map.get("eventinfo");
			String userid=(String)map.get("userid");
			String hostname=(String)map.get("hostname");
			String phone=(String)map.get("phone");
			String city=(String)map.get("city");
			String eplace=(String)map.get("eventplace");
			String tempdate=(String)map.get("eventdate");
			String date=tempdate.split("-")[0];
			String time=tempdate.split("-")[1];
			DateFormat format=new SimpleDateFormat("d MMMM yyyy",Locale.ENGLISH);
			Date fdate=format.parse(date);
			java.sql.Date sqlDate=new java.sql.Date(fdate.getTime());
			DateFormat timeformat=new SimpleDateFormat("hh:mm a");
			Date ftime=(Date)timeformat.parse(time);
			java.sql.Timestamp sqlTime=new java.sql.Timestamp(ftime.getTime());
			
			Connection con =connection.connect();
			PreparedStatement pst =con.prepareStatement("insert into events(eventname,eventinfo,image1,image2,image3,image4,userid,eventplace,phone,eventdate,eventtime,hostname,facebooklink,youtubelink,instagramlink,city) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			
	
			pst.setString(1, ename);
			pst.setString(2,einfo);
			pst.setBytes(3, image);
			pst.setBytes(4, image2);
			pst.setBytes(5, image3);
			pst.setBytes(6, image4);
			pst.setString(7, userid);
			pst.setString(8, eplace);
			pst.setString(9, phone);
			pst.setDate(10,sqlDate);
			pst.setTimestamp(11, sqlTime);
			pst.setString(12, hostname);
			pst.setString(13, fb);
			pst.setString(14, youtube);
			pst.setString(15, insta);
			pst.setString(16,city);
			
			int co=pst.executeUpdate();
			if(co>0){
				pst.close();
				
				con.close();
				
				return true;
			}
			else{
				pst.close();
				con.close();
				
				return false;
			}
			
			
		}catch(Exception e){
			
			return false;
		}
		
	
	}
	
public static boolean editevent(HashMap map,int counter){
		
		
		try{
			
			
			
		//	String ename=(String)map.get("eventname");
			String einfo=(String)map.get("eventinfo");
			String userid=(String)map.get("userid");
			//String hostname=(String)map.get("hostname");
			//String phone=(String)map.get("phone");
			String eplace=(String)map.get("eventplace");
			String fb=null;
					fb=(String)map.get("fblink");
			String insta=null;
					insta=(String)map.get("instalink");
			String youtube=null;
				youtube=(String)map.get("youtubelink");
				if(fb==""){
					fb=null;
						
				}
				if(insta==""){
					insta=null;
						
				}
				if(youtube==""){
					youtube=null;
						
				}
			String tempdate=(String)map.get("eventdatetime");
			int eid=Integer.parseInt((String)map.get("eventid"));
			String date=tempdate.split("-")[0];
			String time=tempdate.split("-")[1];
			DateFormat format=new SimpleDateFormat("d MMMM yyyy",Locale.ENGLISH);
			Date fdate=format.parse(date);
			java.sql.Date sqlDate=new java.sql.Date(fdate.getTime());
			DateFormat timeformat=new SimpleDateFormat("hh:mm a");
			Date ftime=(Date)timeformat.parse(time);
			java.sql.Timestamp sqlTime=new java.sql.Timestamp(ftime.getTime());
			//String userid=(String)map.get("userid");
			Connection con =connection.connect();
			PreparedStatement pst=null;
			String qry="";
			
			
			if(counter<1){
				qry="update events set eventdate=? , eventtime=?, eventplace=? , eventinfo=? , facebooklink=? , instagramlink=? , youtubelink=? where eventid=?";
				 pst =con.prepareStatement(qry);
				 	
				 	pst.setDate(1,sqlDate);
					pst.setTimestamp(2, sqlTime);
					pst.setString(3, eplace);
				 	pst.setString(4,einfo);
				 	pst.setString(5,fb);
				 	pst.setString(6,youtube);
				 	pst.setString(7,insta);
				 	pst.setInt(8, eid);
				 	
				 	
				
					
				
			}else{
				byte image[]=(byte []) map.get("eventimage1");
				byte image2[]=(byte[])map.get("eventimage2");
				byte image3[]=(byte[])map.get("eventimage3");
				byte image4[]=(byte[])map.get("eventimage4");
					pst =con.prepareStatement("update events set eventdate=? , eventtime=?, eventplace=? , eventinfo=?, image1=?,image2=?,image3=?,image4=? , facebooklink=? , instagramlink=? , youtubelink=? where eventid=?");
			

					pst.setDate(1,sqlDate);
					pst.setTimestamp(2, sqlTime);
					pst.setString(3, eplace);
				 	pst.setString(4,einfo);	
				 	pst.setBytes(5, image);
					pst.setBytes(6, image2);
					pst.setBytes(7, image3);
					pst.setBytes(8, image4);
					pst.setString(9,fb);
				 	pst.setString(10,youtube);
				 	pst.setString(11,insta);
					pst.setInt(12, eid);
					
					 
			}
			
			int co=pst.executeUpdate();
			
			if(co>0){
				pst.close();
				con.close();
				
				return true;
			}
			else{
				pst.close();
				con.close();
				
				return false;
			}
			
			
		}catch(Exception e){
			return false;
			
			
		}
	}


}
