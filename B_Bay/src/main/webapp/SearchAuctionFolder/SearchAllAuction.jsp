<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Auction Search</title>
</head>	
<body>
	<%
	try {	
		%>
		<a href="SearchFilter.jsp">
			<button>Filter Options</button>
		</a>
		<% 
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		PreparedStatement stmt=con.prepareStatement("SELECT * FROM auction;");
		ResultSet result=stmt.executeQuery();	
		HttpSession sess = request.getSession();
		String idString = String.valueOf(sess.getAttribute("userID")); 	
		int id = Integer.parseInt(idString);
	
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
					<td>Place Bid</td>
				</tr>
					<%
					//parse out the results
					while (result.next()) { %>
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
							<td><%int bidderUserID = result.getInt("userID");
								if(bidderUserID == id){
									%><%
									
								}else{
									%>
									
										<a href=".../BidFolder/Bid.jsp">
											<button>Bid</button>
										</a>
									
									<% 
								}
							%>
							</td>
						</tr>
						
		
					<% }
					//close the connection.
					con.close();
					%>
		</table>
		
		<br>
		<a href="http://localhost:8080/B_Bay/Home.jsp">
			<button>Go To Home</button>
		</a>
	<% } catch (Exception ex) {
		
	}
	%>			
		  
	
		
		
</body>
</html>