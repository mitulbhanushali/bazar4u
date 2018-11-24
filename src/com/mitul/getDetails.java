package com.mitul;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Iterator;

public class getDetails {
	
	public static int products(){
		try{
			Connection con=connection.connect();
			PreparedStatement pst=null;
			ResultSet rs=null;    
				 pst=con.prepareStatement("select count(*) from finaliteams");
				 rs=pst.executeQuery();
				 if(rs.next()){
					 int count=rs.getInt("count(*)");
					 rs.close();
					 pst.close();
					 con.close();
					 return count;
				 }else{
					 rs.close();
					 pst.close();
					 con.close();
					 return 0;
				 }
				 
		}catch(Exception e){  
			return 0;
		}
	}
	
	public static int cityproducts(String city){
		try{
			Connection con=connection.connect();
			PreparedStatement pst=null;
			ResultSet rs=null;    
				 pst=con.prepareStatement("select count(*) from finaliteams where city='"+city+"'");
				 rs=pst.executeQuery();
				 if(rs.next()){
					 int count=rs.getInt("count(*)");
					 rs.close();
					 pst.close();
					 con.close();
					 return count;
				 }else{
					 rs.close();
					 pst.close();
					 con.close();
					 return 0;
				 }
				 
		}catch(Exception e){  
			return 0;
		}
	}
	
	public static int advertise(){
		try{
			Connection con=connection.connect();
			PreparedStatement pst=null;
			ResultSet rs=null;    
				 pst=con.prepareStatement("select count(*) from advertise");
				 rs=pst.executeQuery();
				 if(rs.next()){
					 int count=rs.getInt("count(*)");
					 rs.close();
					 pst.close();
					 con.close();
					 return count;
				 }else{
					 rs.close();
					 pst.close();
					 con.close();
					 return 0;
				 }
				 
		}catch(Exception e){  
			return 0;
		}
	}
	
	public static int cityadvertise(String city){
		try{
			Connection con=connection.connect();
			PreparedStatement pst=null;
			ResultSet rs=null;    
				 pst=con.prepareStatement("select count(*) from advertise where city='"+city+"'");
				 rs=pst.executeQuery();
				 if(rs.next()){
					 int count=rs.getInt("count(*)");
					 rs.close();
					 pst.close();
					 con.close();
					 return count;
				 }else{
					 return 0;
				 }
				 
		}catch(Exception e){  
			return 0;
		}
	}
	
	public static int users(){
		try{
			Connection con=connection.connect();
			PreparedStatement pst=null;
			ResultSet rs=null;    
				 pst=con.prepareStatement("select count(*) from users");
				 rs=pst.executeQuery();
				 if(rs.next()){
					 int count=rs.getInt("count(*)");
					 rs.close();
					 pst.close();
					 con.close();
					 return count;
				 }else{
					 rs.close();
					 pst.close();
					 con.close();
					 return 0;
				 }
				 
		}catch(Exception e){  
			return 0;
		}
	}
	
	public static int cityusers(String city){
		try{
			Connection con=connection.connect();
			PreparedStatement pst=null;
			ResultSet rs=null;    
				 pst=con.prepareStatement("select count(*) from users where city='"+city+"'");
				 rs=pst.executeQuery();
				 if(rs.next()){
					 int count=rs.getInt("count(*)");
					 rs.close();
					 pst.close();
					 con.close();
					 return count;
				 }else{
					 rs.close();
					 pst.close();
					 con.close();
					 return 0;
				 }
				 
		}catch(Exception e){  
			return 0;
		}
	}

}
