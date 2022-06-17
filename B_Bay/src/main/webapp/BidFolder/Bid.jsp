<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%><!DOCTYPE html>
<html>
<head>
<base href="http://localhost:8080/B_Bay/" />
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
        Cookie cookieAuctionID = new Cookie("cookieAuctionID",auctionIDString );
        cookieAuctionID.setMaxAge(60*60*24); 
    	response.addCookie(cookieAuctionID);
        %><br><% 
        out.println("Your userID is: " + userID);
        %>
        <br>
        <a href="SearchAuctionFolder/SearchAllAuction.jsp">
			<button>Cancel</button>
		</a>
		<br>
		<%
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		String query = "select * from auction where auctionID = " + auctionID;
		PreparedStatement stmt=con.prepareStatement(query);
		ResultSet result=stmt.executeQuery();
		
		while (result.next()) {
		%>
		<table border = '1'>
		<tr>    
			<td>auctionID</td>
			<td>Start Date</td>
			<td>End Date</td>
			<td>Initial Bid Price</td>
			<td>Increment Of Bid To Be Valid</td>
			<td>Minimum Bid</td>
			<td>Current Bid</td>
			<td>Is Available</td>
			<td>Highest Bidder ID</td>
			
		</tr>
			<%
			//parse out the results
			 %>
				<tr>    
					<td><%= result.getInt("auctionID") %></td>
					<td><%= result.getDate("startDate") %></td>
					<td><%= result.getDate("endDate") %></td>
					<td><%= result.getBigDecimal("initialBidPrice") %></td>
					<td><%= result.getBigDecimal("incrementBidPrice") %></td>
					<td><%= result.getBigDecimal("minBid") %></td>
					<td><%= result.getBigDecimal("currentBidPrice") %></td>
					<%String isAvailable = result.getString("isAvailable");
							String answer;
							if(isAvailable.equals("Y")){
								%> <td>For Sale</td><% 
							}else{
								 %><td>Not For Sale</td><% 
					}%>
					<%int val = result.getInt("highestBidder");
							if(val == -1){
								%> <td>No Highest Bidder</td><% 
							}else{
								 %><td><%=result.getInt("HighestBidder")%></td><% 
					}%>
				</tr>
</table>
		<%
		double incrementBidPrice = Double.parseDouble(String.valueOf(result.getBigDecimal("incrementBidPrice")));
		double minBid = Double.parseDouble(String.valueOf(result.getBigDecimal("minBid")));
		double currentBidPrice = Double.parseDouble(String.valueOf(result.getBigDecimal("currentBidPrice")));
		double totalReq = incrementBidPrice + minBid + currentBidPrice;
		%>
		<p>
		The required minimum bid for the bid to be considered valid is <%=incrementBidPrice%> + <%=minBid%>  + <%=currentBidPrice %>
			= <%=totalReq%>!
		</p>
		<form action="BidFolder/BidData.jsp">
	  		<table>
				<tr>    
					<td>Bid Input</td><td><input type="number"  min = "<%=totalReq%>" value = "0" step= "0.01" name="bidInput"></td>
				</tr>
				
			</table>
	 	 <input type="submit" value="Submit"> 
		</form>
        <% 
        
       
		}
        con.close();
	} catch (Exception ex) {
		
	}
	%>			
		  
	
		
</body>
</html>