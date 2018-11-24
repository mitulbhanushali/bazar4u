package com.mitul;
import java.sql.*;

import com.mysql.jdbc.Connection;
public class connection {
	
		public static Connection connect(){
			try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bazaruin_appdatabase","developer","MitulYash123");
			return con;
			}catch(Exception e){
				
				return null;
			}
			
		}
}
