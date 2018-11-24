package com.mitul;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class checkdetails {
	
	public static boolean  checkproductuser(String userid,int productid){
		
		
		try{
			Connection con =connection.connect();
			PreparedStatement pst=null;
			String qry="";
			
				qry="select * from finaliteams  where id=? and userid=?";
				 pst =con.prepareStatement(qry);
				 pst.setInt(1, productid);
				 pst.setString(2, userid);
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
