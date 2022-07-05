<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%><!DOCTYPE html>
<html>
<head>
<base href="http://localhost:8080/B_Bay/" />
<meta charset="UTF-8">
<title>Bid Data Page</title>
</head>
<body>
<%
	try {	
		double bidInput = Double.parseDouble(request.getParameter("bidInput"));
		
		int auctionID = 0;
		int userID = 0;
		Cookie cookie = null;
        Cookie[] cookies = null;
        cookies = request.getCookies();
        
        
        if(cookies != null ) {
           for (int i = 0; i < cookies.length; i++) {
              cookie = cookies[i];
              String name =  cookie.getName();
              String value = cookie.getValue();
              if(name.equals("cookie_id")){
            	  userID = Integer.parseInt(value);
              }
              if(name.equals("cookieAuctionID")){
            	  auctionID = Integer.parseInt(value);
              }
           }
        }
		
        ApplicationDB db1 = new ApplicationDB();	
		Connection con1 = db1.getConnection();
		String query = "update auction set highestBidder = " + userID + " , currentBidPrice = " + bidInput + " where auctionID = " + auctionID;
		PreparedStatement updateStud=con1.prepareStatement(query); 
		updateStud.executeUpdate();
		
		
		
		//NOT THE BEST CODE BUT TOO LAZY TO MAKE BETTER. cant determine if clothingtype is pant/shirt/shoe so must check each 
		
		StringBuilder clothingType = new StringBuilder();
		PreparedStatement stmt=con1.prepareStatement("select itemID from pant");
		ResultSet result=stmt.executeQuery();
		while(result.next()){
			int itemID = result.getInt("itemID");
			if(itemID == auctionID){
				clothingType.append("pant");
			}
		}
		PreparedStatement stmt2=con1.prepareStatement("select itemID from shirt");
		ResultSet result2=stmt2.executeQuery();
		while(result2.next()){
			int itemID1 = result2.getInt("itemID");
			if(itemID1 == auctionID){
				clothingType.append("shirt");
			}
		}
		PreparedStatement stmt3=con1.prepareStatement("select itemID from shoe");
		ResultSet result3=stmt3.executeQuery();
		while(result3.next()){
			int itemID3 = result3.getInt("itemID");
			if(itemID3 == auctionID){
				clothingType.append("shoe");
			}
		}	
		String clothingTypeToString = String.valueOf(clothingType);
		String query1 = "update " + clothingTypeToString + " set bidPrice = " + bidInput + " where itemID = " + auctionID + ";";
		PreparedStatement updateStud1=con1.prepareStatement(query1); 
		updateStud1.executeUpdate();

		con1.close();
		%>
	    <script type="text/javascript">
	    	alert('Successfully updated current bid price and highest bidder!');
	 	 </script>
	    <% 

		 %>
        <script type="text/javascript">
        window.location= "http://localhost:8080/B_Bay/Home.jsp";
	     </script>
	     <% 
        
	
	} catch (Exception ex) {
   
	}
	%>			
		  
	
		
</body>
</html>