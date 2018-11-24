package com.mitul;
import java.sql.*;
public class checking {

		public static boolean checkproduct(int id,String sellerid,String userid,int qty){
			
			try{
				Connection con=connection.connect();
				PreparedStatement pst =con.prepareStatement("select * from orders where productid=? and userid=? and sellerid=?");
				pst.setInt(1, id);
				pst.setString(2, userid);
				pst.setString(3, sellerid);
				ResultSet rs=pst.executeQuery();
				if(rs.next()){
					int oldqty=rs.getInt("qty");
					pst=con.prepareStatement("update orders set qty=? where productid=? and userid=? and sellerid=?");
					pst.setInt(1, oldqty+qty);
					pst.setInt(2, id);
					pst.setString(3, userid);
					pst.setString(4, sellerid);
					int count=pst.executeUpdate();
					rs.close();
					pst.close();
					con.close();
					return true;
					
					
				}else{
					return false;
				}
			}catch(Exception e){
				
				return false;
			}
			
	
		}
}
