<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%><!DOCTYPE html>
<html>
<head>
 	<meta charset="utf-8" />
     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
     <meta name="description" content="" />
     <meta name="author" content="" />
	 <base href="http://localhost:8080/B_Bay/" />
	 <link rel="icon" type="image/x-icon" href="package/dist/assets/favicon.ico" />
	 <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
	 <link href="package/dist/css/styles.css" rel="stylesheet" />
	<base href="http://localhost:8080/B_Bay/" />
	
<title>Bid Page</title>
</head>
<body>

 <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container px-lg-5">
                <a class="navbar-brand" href="#!">eAuction</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="http://localhost:8080/B_Bay/Home.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="http://localhost:8080/B_Bay/AboutFolder/Template/dist/AboutWebsite.jsp">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="https://github.com/andrewheo1225">Contact</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        
    	<section class="pt-4">
            <div class="container px-lg-5">
                <!-- Page Features-->
                <div class="row gx-lg-5">
                		
							
                		
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
					    	
						    %>
						    <div class="row">
								  <div class="col"><%out.print("Your userID is: " + userID);%></div>
								  <div class="col">
								  	
								  </div>
							</div>
						
					 
					       
							<br>
							<%
							ApplicationDB db = new ApplicationDB();	
							Connection con = db.getConnection();
							String query = "select * from auction where auctionID = " + auctionID;
							PreparedStatement stmt=con.prepareStatement(query);
							ResultSet result=stmt.executeQuery();
							
							while (result.next()) {
							%>
							<table border = '1'  class="table table-striped table-hover">
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
					        <div class="row">
								  <div class="col">
								  		  
			                		<a href="SearchAuctionFolder/SearchAllAuction.jsp">
										<button>Cancel</button>
									</a>
								  </div>
								  <div class="col">
								  	<p>
									The required minimum bid for the bid to be considered valid is <%=incrementBidPrice%> + <%=minBid%>  + <%=currentBidPrice %>
										= <%=totalReq%>!
									</p>
								  </div>
								  <div class="col">
							  		  <form action="BidFolder/BidData.jsp">
								  		<table>
											<tr>    
												<td>Bid Input</td><td><input type="number"  min = "<%=totalReq%>" value = "0" step= "0.01" name="bidInput"></td>
											</tr>
											
										</table>
								 	 <input type="submit" value="Submit"> 
									</form>
								  </div>
							</div>
					       <% 
							}
					        con.close();
						} catch (Exception ex) {
							
						}
						%>			
			              
			              
          		
                </div>
            </div>
        </section>
        <br>
    	
 	
 <!-- Footer-->
        <footer style = "min-height: 100vh;" class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; eAuction 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>		
</body>
</html>