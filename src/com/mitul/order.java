package com.mitul;


import java.sql.*;
public class order {
	
		public static boolean addorder(String fname,String lname,String email,String pincode,String address,String phone,String id,String qty) throws SQLException{
			
			Connection con=connection.connect();
			PreparedStatement pst=con.prepareStatement("insert into orders values(?,?,?,?,?,?,?,?)");
			pst.setString(1, email);
			pst.setString(2, fname);
			pst.setString(3, lname);
			pst.setString(4, phone);
			pst.setString(5, address);
			pst.setString(6, pincode);
			pst.setInt(7, Integer.parseInt(id));
			pst.setInt(8,Integer.parseInt(qty));
			int rs=pst.executeUpdate();
			if(rs>0){
				return true;
			}else{
				return false;
			}
			
		}
		
		public static boolean checklogin(String username,String password) throws SQLException{
			
			Connection con=connection.connect();
			PreparedStatement pst=con.prepareStatement("select * from shop_users where email=? and pass=?");
			pst.setString(1, username);
			pst.setString(2, password);
			ResultSet r=pst.executeQuery();
			if(r.next()){
				return true;
			}else{
				return false;
			}
			
		}
}
