package com.mitul;
import java.sql.*;
import java.util.HashMap;
import java.io.*;
import java.nio.charset.Charset;

import com.mitul.*;
import com.mysql.jdbc.Connection;
public class additems {

	public static boolean setitem(String id,String name,String price ,String fname)throws Exception{
		
		try{
		Connection con =connection.connect();
		PreparedStatement pst =con.prepareStatement("insert into iteams values(?,?,?,?)");
		pst.setInt(1, Integer.parseInt(id));
		pst.setString(2,name);
		pst.setInt(3, Integer.parseInt(price));
		File f=new File("M:/"+fname);
		InputStream is=new FileInputStream(f);
		pst.setBinaryStream(4, is);
		int co=pst.executeUpdate();
		if(co>0){
			pst.close();
			con.close();
			f.delete();
			return true;
		}
		else{
			pst.close();
			con.close();
			f.delete();
			return false;
		}
		}catch(Exception es){
			System.out.println(es.getMessage());
			System.out.println(es.getStackTrace());
			return false;
		}
		
	}
	
	public static boolean setmultiiteam(HashMap map,int counter){
		
	
		try{
			
			byte image[]=(byte []) map.get("image1");
			byte image2[]=(byte[])map.get("image2");
			byte image3[]=(byte[])map.get("image3");
			byte image4[]=(byte[])map.get("image4");
			
			if(image==null || image.length==0){
				return false;
			}
			
			//if(image2.equals(null))
			String name=(String)map.get("name");
			String catagory=(String)map.get("catagory");
			String discription1=(String)map.get("discription");
			String discription="";
			if(discription1.length()>=1024){
				 String tempdis=discription1.substring(0, 1020);
				 byte temp[]=tempdis.getBytes(Charset.forName("UTF-8"));
				 discription=new String(temp,"UTF-8");
				 
			}else{
				String tempdis=discription1;
				 byte temp[]=tempdis.getBytes(Charset.forName("UTF-8"));
				 discription=new String(temp,"UTF-8");
			}
			
			int  price=Integer.parseInt((String)map.get("price"));
			int discount=Integer.parseInt((String)map.get("discount"));
			String userid=(String)map.get("userid");
			String seller=(String)map.get("seller");
			String city=(String)map.get("city");
			Connection con =connection.connect();
			PreparedStatement pst =con.prepareStatement("insert into finaliteams(name,price,image1,image2,image3,image4,userid,discount,discription,category,seller,city) values(?,?,?,?,?,?,?,?,?,?,?,?)");
			
	
			pst.setString(1, name);
			pst.setInt(2,price);
			pst.setBytes(3, image);
			pst.setBytes(4, image2);
			pst.setBytes(5, image3);
			pst.setBytes(6, image4);
			pst.setString(7, userid);
			pst.setInt(8, discount);
			pst.setString(9, discription);
			pst.setString(10, catagory);
			pst.setString(11, seller);
			pst.setString(12, city);
			
			int co=pst.executeUpdate();
			if(co>0){
				pst.close();
				con.close();
				
				return true;
			}
			else{
				pst.close();
				con.close();
				
				return false;
			}
			
			
		}catch(Exception e){
			
			return false;
		}
	}
	
public static boolean setitem1(HashMap map)throws Exception{
		
		try{
		Connection con =connection.connect();
		PreparedStatement pst =con.prepareStatement("insert into iteams values(?,?,?,?)");
		pst.setInt(1, Integer.parseInt((String)map.get("id")));
		pst.setString(2,(String)map.get("name"));
		pst.setInt(3, Integer.parseInt((String)map.get("price")));
		//File f=new File("M:/"+fname);
		//InputStream is=new FileInputStream(f);
		pst.setBytes(4, (byte[])map.get("image"));
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

public static boolean editmultiiteam(HashMap map,String userid){
	
	
	try{
		
		byte image[]=(byte []) map.get("productimage1");
		byte image2[]=(byte[])map.get("productimage2");
		byte image3[]=(byte[])map.get("productimage3");
		byte image4[]=(byte[])map.get("productimage4");
		String sql=null;
		if(image!=null && image.length!=0){
			
		}
		//if(image2.equals(null))
		String name=(String)map.get("productname");
		String catagory=(String)map.get("productcategory");
		//String discription=(String)map.get("productdiscription");
		String discription=(String)map.get("productdiscription");
		//String discription="";
		
		
		int  price=Integer.parseInt((String)map.get("productprice"));
		int discount=Integer.parseInt((String)map.get("productdiscount"));
		int id=Integer.parseInt((String)map.get("productid"));
		if(!checkdetails.checkproductuser(userid, id)){
			return false;
		}
		//String userid=(String)map.get("userid");
		Connection con =connection.connect();
		PreparedStatement pst=null;
		String qry="";
		
			qry="update finaliteams set name=?,price=?,discount=?,discription=?,category=? where id=?";
			 pst =con.prepareStatement(qry);
			pst.setString(1, name);
			pst.setInt(2,price);
			pst.setInt(3, discount);
			pst.setString(4, discription);
			pst.setString(5, catagory);
			pst.setInt(6, id);
			
			int co=pst.executeUpdate();
			if(co>0){
				
				if(image!=null && image.length!=0){
					pst =con.prepareStatement("update finaliteams set image1=? where id=?");
					pst.setBytes(1, image);
					pst.setInt(2, id);
					pst.executeUpdate();
				}
				if(image2!=null && image2.length!=0){
					pst =con.prepareStatement("update finaliteams set image2=? where id=?");
					pst.setBytes(1, image2);
					pst.setInt(2, id);
					pst.executeUpdate();
				}
				if(image3!=null && image3.length!=0){
					pst =con.prepareStatement("update finaliteams set image3=? where id=?");
					pst.setBytes(1, image3);
					pst.setInt(2, id);
					pst.executeUpdate();
				}
				if(image4!=null && image4.length!=0){
					pst =con.prepareStatement("update finaliteams set image4=? where id=?");
					pst.setBytes(1, image4);
					pst.setInt(2, id);
					pst.executeUpdate();
				}
				pst.close();
				con.close();
				
				return true;
			}else{
				pst.close();
				con.close();
				
				return false;
			}
		
			
		
		
	}catch(Exception e){
		System.out.println(e.getMessage());
		System.out.println(e.getStackTrace());
		return false;
	}
}

	public static boolean updateprofilepic(HashMap map,String userid){
		try{
			boolean result=false;
			
			byte image[]=(byte []) map.get("productimage1");
			String address=(String )map.get("address");
			boolean addr=false;
			String sql=null;
			if(address!=null && address.length()>0 ){
				sql="update users set address=?  where userid=?";
				
				Connection con =connection.connect();
				PreparedStatement pst=con.prepareStatement(sql);
				pst.setString(1, address);
				pst.setString(2, userid);
				int rs=pst.executeUpdate();
				if(rs>0){
					pst.close();
					con.close();
					result=true ;
				}else{
					pst.close();
					con.close();
					result=false;
				}
			}
			if(image!=null && image.length>0 ){
				sql="update users set image1=? where userid=?";
				InputStream is = new ByteArrayInputStream(image);
				Connection con =connection.connect();
				PreparedStatement pst=con.prepareStatement(sql);
				pst.setBlob(1, is);
				pst.setString(2, userid);
				int rs=pst.executeUpdate();
				if(rs>0){
					pst.close();
					con.close();
					result=true;
				}else{
					pst.close();
					con.close();
					result=false;
				}
			}

			
			
			return result;
			
			
			
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		
	}
		
	
}
