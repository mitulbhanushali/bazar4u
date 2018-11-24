package com.mitul;

import java.util.ArrayList;
import java.util.HashMap;
import java.sql.*;
public class search {
	private static HashMap category;
	private static HashMap pname;
	private static ArrayList<String> alllist;
	public static ArrayList<String> searching(String qry){
		
		try{
		dataset();
		 ArrayList<String> sendlist=new ArrayList<>();
		for(String s : alllist){
			if(s.contains(qry)){
				sendlist.add(s);
			}
		}
		return sendlist;
		}catch(Exception e){
			return null;
			
		}
		
		
	}
	
	public static void dataset(){
		
		try{
			Connection con=connection.connect();
			PreparedStatement pst=con.prepareStatement("select * from finaliteams");
			ResultSet rs=pst.executeQuery();
			alllist=new ArrayList<>();
			while(rs.next()){
				alllist.add(rs.getString("name"));
				alllist.add(rs.getString("category"));
			}
			rs.close();
			pst.close();
			con.close();
			
		}catch(Exception e){
			
		}
	}

}
