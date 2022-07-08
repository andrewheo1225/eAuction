<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%><!DOCTYPE html>
<html>
<head>
<base href="http://localhost:8080/B_Bay/" />
<meta charset="UTF-8">

	 <meta charset="utf-8" />
     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
     <meta name="description" content="" />
     <meta name="author" content="" />
	 <base href="http://localhost:8080/B_Bay/" />
	 <link rel="icon" type="image/x-icon" href="package/dist/assets/favicon.ico" />
	 <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
	 <link href="package/dist/css/styles.css" rel="stylesheet" />
<title>Check Self Bids</title>
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
                        <li class="nav-item"><a class="nav-link" href="http://localhost:8080/B_Bay/AboutFolder/AboutWebsite.jsp">About</a></li>
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
								
								ApplicationDB db = new ApplicationDB();	
								Connection con = db.getConnection();
								
								HttpSession sess = request.getSession();
								String idString = String.valueOf(sess.getAttribute("userID")); 	
								int id = Integer.parseInt(idString);
								
								String query = "select * from auction where highestBidder = " + id;
								PreparedStatement stmt=con.prepareStatement(query);
								ResultSet result=stmt.executeQuery();	

							%>
								<div style = "margin: 0px 0px 15px 0px;" class="row">
									 <div class="col">These are your bids:
									 </div>
									 <div class="col">
									  	<a href="http://localhost:8080/B_Bay/Home.jsp">
											<button>Go To Home</button>
										</a>
									 </div>
									  
								</div>
						
							<table border = '1' class="table table-striped table-hover">
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
										</tr>
										
						
									<% }
								
									
									%>
						</table>
						
						
						
						<%
						con.close();
						%>	
					<% 
					}catch (Exception ex) {
						
					}
					%>		
                </div>
            </div>
        </section>
 

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