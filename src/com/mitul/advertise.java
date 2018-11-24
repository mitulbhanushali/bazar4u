package com.mitul;

import java.nio.charset.Charset;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.HashMap;

public class advertise {

	
		public static String  setadvertise(HashMap map ,int counter){
			try{
				
				byte image[]=(byte []) map.get("image1");
				byte image2[]=(byte[])map.get("image2");
				byte image3[]=(byte[])map.get("image3");
				byte image4[]=(byte[])map.get("image4");
				byte image5[]=(byte[])map.get("image5");
				byte video[]=(byte[])map.get("image6");
				
				//if(image2.equals(null))
				String name=(String)map.get("ownname");
				String advertisename=(String)map.get("advname");
				String discription1=(String)map.get("advinfo");
				String discription="";
				if(discription1.length()>=512){
					 String tempdis=discription1.substring(0, 1020);
					 byte temp[]=tempdis.getBytes(Charset.forName("UTF-8"));
					 discription=new String(temp,"UTF-8");
					 
				}else{
					String tempdis=discription1;
					 byte temp[]=tempdis.getBytes(Charset.forName("UTF-8"));
					 discription=new String(temp,"UTF-8");
				}
				
				
				String address=(String)map.get("address");
				String phone=(String)map.get("phone");
				String email=(String)map.get("email");
				String userid=(String)map.get("userid");
				String city=(String)map.get("city");
				String fblink=(String)map.get("fblink");
				String instalink=(String)map.get("instalink");
				String youtubelink=(String)map.get("youtubelink");
				Connection con =connection.connect();
				PreparedStatement pst =con.prepareStatement("insert into advertise(name,image1,image2,image3,image4,image5,userid,info,fblink,instalink,youtubelink,address,phone,advname,city,email,video) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				
		
				pst.setString(1, name);
				pst.setBytes(2, image);
				pst.setBytes(3, image2);
				pst.setBytes(4, image3);
				pst.setBytes(5, image4);
				pst.setBytes(6, image5);
				pst.setString(7, userid);
				pst.setString(8, discription);
				pst.setString(9, fblink);
				pst.setString(10, instalink);
				pst.setString(11, youtubelink);
				pst.setString(12, address);
				pst.setString(13, phone);
				pst.setString(14, advertisename);
				pst.setString(15, city);
				pst.setString(16, email);
				pst.setBytes(17, video);
				
				int co=pst.executeUpdate();
				if(co>0){
					pst.close();
					con.close();
					
					return "true";
				}
				else{
					pst.close();
					con.close();
					
					return "false";
				}
				
				
			}catch(Exception e){
				
				return e.getMessage();
			}
			
		}
}
