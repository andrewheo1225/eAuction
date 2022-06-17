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