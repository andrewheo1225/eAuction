package com.cs336.pkg;
import com.cs336.pkg.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.PreparedStatement;

public class ApplicationDB {
	
	public ApplicationDB(){
		
	}
	
	public int createAccount(Users u){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        java.sql.PreparedStatement ps=con.prepareStatement(  
	        		"INSERT INTO users(userName, email, password, address, birthday)"
	        				+ "VALUES (?, ?, ?, ?, ?)");
	        ps.setString(1,u.getuserName());  
	        ps.setString(2,u.getEmail());  
	        ps.setString(3,u.getPassword());  
	        ps.setString(4,u.getAddress());  
	        ps.setString(5,u.getBirthday());  
	        status=ps.executeUpdate(); 
	        con.close();
	    }catch(Exception e){
	    	System.out.println(e);
	    	
	    }  
	    return status;  
	} 
	public int createAuction(Auction a){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        java.sql.PreparedStatement ps=con.prepareStatement(  
	        		"INSERT INTO auction(userID, startDate, endDate, initialBidPrice, incrementBidPrice, minBid,currentBidPrice,isAvailable,highestBidder)"
	        				+ "VALUES (?, ?,?, ?, ?, ?,?,?,?)");
	        ps.setInt(1,a.getUserID());
	        ps.setString(2,a.getStartDate());  
	        ps.setString(3,a.getEndDate());  
	        ps.setDouble(4,a.getInitialBidPrice());  
	        ps.setDouble(5,a.getIncrementBidPrice());  
	        ps.setDouble(6,a.getMinBid());  
	        ps.setDouble(7,a.getCurrentBidPrice());  
	        ps.setString(8,a.getIsAvailable());
	        ps.setInt(9,a.getHighestBidderID());
	        status=ps.executeUpdate(); 
	        con.close();
	    }catch(Exception e){
	    	System.out.println(e);
	    	
	    }  
	    return status;  
	} 
	public int createItems(Items i){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        java.sql.PreparedStatement ps=con.prepareStatement(  
	        		"INSERT INTO items() values()");
	      
	        status=ps.executeUpdate(); 
	        con.close();
	    }catch(Exception e){
	    	System.out.println(e);
	    	
	    }  
	    return status;  
	} 
	
	public int createItemsPants(Pants p){  
	    int status=0;  
	    try{  
	    	Connection con=getConnection();  
	        java.sql.PreparedStatement ps=con.prepareStatement(  
	        		"INSERT INTO pant(itemID,pant_waist, pant_type, pant_gender,color,bidPrice)"
	        				+ "VALUES (?, ?, ?, ?, ?,?)");
	        ps.setInt(1,p.getItemID());  
	        ps.setInt(2,p.getPantWaist());  
	        ps.setString(3,p.getPantType());  
	        ps.setString(4,p.getPantGender());  
	        ps.setString(5,p.getColor());  
	        ps.setDouble(6,p.getBidPrice());  

	        status=ps.executeUpdate(); 
	    }catch(Exception e){
	    	System.out.println(e);
	    	
	    }  
	    return status;  
	} 
	public int createItemsShirts(Shirts s){  
	    int status=0;  
	    try{  
	    	Connection con=getConnection();  
	        java.sql.PreparedStatement ps=con.prepareStatement(  
	        		"INSERT INTO shirt(itemID,shirt_size, shirt_gender, shirt_brand,color,bidPrice)"
	        				+ "VALUES (?, ?, ?, ?, ?, ?)");
	        ps.setInt(1,s.getItemID());  
	        ps.setString(2,s.getShirtSize());  
	        ps.setString(3,s.getShirtGender());  
	        ps.setString(4,s.getShirtBrand());  
	        ps.setString(5,s.getColor());  
	        ps.setDouble(6,s.getBidPrice());  

	        status=ps.executeUpdate(); 
	    }catch(Exception e){
	    	System.out.println(e);
	    	
	    }  
	    return status;  
	} 
	
	public int createItemsShoes(Shoes s){  
	    int status=0;  
	    try{  
	    	Connection con=getConnection();  
	        java.sql.PreparedStatement ps=con.prepareStatement(  
	        		"INSERT INTO shoe(itemID,shoe_size, shoe_gender, shoe_brand,color,bidPrice)"
	        				+ "VALUES (?, ?, ?, ?, ?, ?)");
	        ps.setInt(1,s.getItemID());  
	        ps.setDouble(2,s.getShoeSize());  
	        ps.setString(3,s.getShoeGender());  
	        ps.setString(4,s.getShoeBrand());  
	        ps.setString(5,s.getColor());  
	        ps.setDouble(6,s.getBidPrice());  

	        status=ps.executeUpdate(); 
	    }catch(Exception e){
	    	System.out.println(e);
	    	
	    }  
	    return status;  
	} 
	
	public int createHasRelationship(Has h){  
	    int status=0;  
	    try{  
	    	Connection con=getConnection();  
	        java.sql.PreparedStatement ps=con.prepareStatement(  
	        		"INSERT INTO has(userID)"
	        				+ "VALUES (?)");
	        ps.setInt(1,h.getUserID()); 
	        status=ps.executeUpdate(); 
	    }catch(Exception e){
	    	System.out.println(e);
	    	
	    }  
	    return status;  
	} 
	public int createContainsRelationship(Contains c){  
	    int status=0;  
	    try{  
	    	Connection con=getConnection();  
	        java.sql.PreparedStatement ps=con.prepareStatement(  
	        		"INSERT INTO contains(itemID,auctionID)"
	        				+ "VALUES (?,?)");
	        ps.setInt(1,c.getItemID());  
	        ps.setInt(2,c.getAuctionID());  
	       

	        status=ps.executeUpdate(); 
	    }catch(Exception e){
	    	System.out.println(e);
	    	
	    }  
	    return status;  
	}
	
	
	
	public  Connection getConnection(){
		
		//Create a connection string
		String connectionUrl = "jdbc:mysql://localhost:3306/bootleg_ebay?autoReconnect=true&useSSL=false";
		Connection connection = null;
		
		try {
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			//Create a connection to your DB
			connection = DriverManager.getConnection(connectionUrl,"root", "Wolfbrother1!");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return connection;
		
	}
	
	public void closeConnection(Connection connection){
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	
	
	public static void main(String[] args) {
		ApplicationDB dao = new ApplicationDB();
		Connection connection = dao.getConnection();
		
		System.out.println(connection);		
		dao.closeConnection(connection);
	}
	
	

}
