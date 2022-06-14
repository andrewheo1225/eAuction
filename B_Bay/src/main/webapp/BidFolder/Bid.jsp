<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bid Page</title>
</head>
<body>
<%
	try {	
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
           }
        }
        
        
        String auctionIDString =  request.getParameter("auctionIDOption");
        int auctionID = Integer.parseInt(auctionIDString);
        out.println("Your auctionID is: " + auctionID);
        out.println("Your userID is: " + userID);
        %><br><% 
        
        
	
	
	} catch (Exception ex) {
		
	}
	%>			
		  
	
		
</body>
</html>