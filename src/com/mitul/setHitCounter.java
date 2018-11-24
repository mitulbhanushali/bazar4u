package com.mitul;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class setHitCounter {
	
	public  synchronized void  setproductcount(String id){
		
		Connection con=connection.connect();
		try {
			PreparedStatement pst=con.prepareStatement("select userid from finaliteams where id=?");
			pst.setInt(1, Integer.parseInt(id));
			ResultSet rs=pst.executeQuery();
			if(rs.next()){
				String userid=rs.getString("userid");
			
				pst=null;
				pst=con.prepareStatement("select producthits from users where userid=?");
				pst.setString(1, userid);
				rs=null;
				rs=pst.executeQuery();
				if(rs.next()){
						int producthits;
					if((Object)rs.getInt("producthits")==null){
							producthits=0;
						}else{
							producthits=rs.getInt("producthits");
						}
						producthits+=1;
						pst=null;
						pst=con.prepareStatement("update users  set producthits=?  where userid=?");
						pst.setInt(1, producthits);
						pst.setString(2, userid);
						pst.executeUpdate();
						
				}else{
					return;
				}
			}else{
				return;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	public  synchronized void  setshopcount(String id){
		
		Connection con=connection.connect();
		try {
			PreparedStatement pst=con.prepareStatement("select shophits from users where id=?");
			pst.setInt(1, Integer.parseInt(id));
			ResultSet rs=pst.executeQuery();
				if(rs.next()){
						int shophits;
						if((Object)rs.getInt("shophits")==null){
							shophits=0;
						}else{
							shophits=rs.getInt("shophits");
						}
						shophits+=1;
						pst=null;
						pst=con.prepareStatement("update users  set producthits=?  where id=?");
						pst.setInt(1, shophits);
						pst.setInt(2, Integer.parseInt(id));
						pst.executeUpdate();
						
				}else{
					return;
				}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
