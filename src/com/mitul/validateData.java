package com.mitul;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class validateData {
	
	public static boolean checkEmail(String email){
		
		
		try{
			Connection con=connection.connect();
			PreparedStatement pst=con.prepareStatement("select * from users where email=?");
			pst.setString(1, email);
			ResultSet rs=pst.executeQuery();
			if(rs.next()){
				return true;
				
			}else{
				return false;
			}
			
		}catch(Exception e){
			return false;
		}
	}
public static boolean checkPhone(String phone){
		
		
		try{
			Connection con=connection.connect();
			PreparedStatement pst=con.prepareStatement("select * from users where phone=?");
			pst.setString(1, phone);
			ResultSet rs=pst.executeQuery();
			if(rs.next()){
				return true;
				
			}else{
				return false;
			}
			
		}catch(Exception e){
			return false;
		}
	}

}
