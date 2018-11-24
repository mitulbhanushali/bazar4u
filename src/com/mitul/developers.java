package com.mitul;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.HashMap;
public class developers {
	
	public static boolean setDeveloper(String name,String email,String phone,String type,String skill ){
		try{
			Connection con =connection.connect();
			PreparedStatement pst =con.prepareStatement("insert into developers (name,email,phone,type,skill) values(?,?,?,?,?)");
			pst.setString(1, name);
			pst.setString(2,email);
			pst.setString(3, phone);
			pst.setString(4, type);
			pst.setString(5, skill);
			//File f=new File("M:/"+fname);
			//InputStream is=new FileInputStream(f);
			int co=pst.executeUpdate();
			if(co>0){
				pst.close();
				con.close();
				//f.delete();
				return true;
			}
			else{
				pst.close();
				con.close();
				//f.delete();
				return false;
			}
			}catch(Exception es){
				System.out.println(es.getMessage());
				System.out.println(es.getStackTrace());
				return false;
			}
		
		
	}
	
	public static boolean  bug_report(HashMap map ){
		try{
			String name=(String)map.get("bugname");
			String email=(String)map.get("email");
			String type=(String)map.get("subject");
			String info=(String)map.get("message");
			byte image[]=(byte []) map.get("image");
			Connection con =connection.connect();
			PreparedStatement pst =con.prepareStatement("insert into bugreport (bugname,email,image,type,info) values(?,?,?,?,?)");
			pst.setString(1, name);
			pst.setString(2,email);
			pst.setBytes(3, image);
			pst.setString(4, type);
			pst.setString(5, info);
			//File f=new File("M:/"+fname);
			//InputStream is=new FileInputStream(f);
			int co=pst.executeUpdate();
			if(co>0){
				pst.close();
				con.close();
				//f.delete();
				return true;
			}
			else{
				pst.close();
				con.close();
				//f.delete();
				return false;
			}
			}catch(Exception es){
				System.out.println(es.getMessage());
				System.out.println(es.getStackTrace());
				return false;
			}
		
		
	}

}
