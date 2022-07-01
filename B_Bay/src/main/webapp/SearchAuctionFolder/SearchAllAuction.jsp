<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
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
	 
	<title>Auction Search</title>
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
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                               <div>
	                               	<a class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4" href = "LoginFolder/LogoutPath.jsp">
	                               		<i class="bi bi-collection"></i>
	                               	</a>                               
                                </div>
                                <h2 class="fs-4 fw-bold">Log Out</h2>
                                <p class="mb-0">Click the above button to log out. We will miss you!</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <div >
	                                <a class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4" onclick="confirmAction()">
	                                	<i class="bi bi-cloud-download"></i>
	                                </a>
                                </div>
                                <h2 class="fs-4 fw-bold">Delete Account</h2>
                                <p class="mb-0">Click the above button to delete your account. All information regarding your account will be deleted</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <div >
	                                <a class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4" href = "SearchAuctionFolder/SearchAllAuction.jsp">
	                                	<i class="bi bi-card-heading"></i>
	                                </a> 
                                </div>
                                <h2 class="fs-4 fw-bold">Search Auction</h2>
                                <p class="mb-0">Search all auction listings. You can filter or purchase!</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <div >
	                                <a class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4" href = "SellFolder/Sell.jsp">
	                                	<i class="bi bi-bootstrap"></i>
	                                </a>
                                </div>
                                <h2 class="fs-4 fw-bold">Sell Items</h2>
                                <p class="mb-0">Sell your clothing items. You can customize for your choices!</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <div >
                               		<a class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4" href = "YourBidsFolder/YourBids.jsp">
                               			 <i class="bi bi-code"></i>
                               		</a>
                                </div>
                                <h2 class="fs-4 fw-bold">Check Bids</h2>
                                <p class="mb-0">Find out which items you are bidding for and keep track of the list!</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <div >
                                	<a class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4" href = "YourItemsFolder/YourItems.jsp">
                                		<i class="bi bi-patch-check"></i>
                                	</a>
                                </div>
                                <h2 class="fs-4 fw-bold">Your Items</h2>
                                <p class="mb-0">Check which items you have listed! Find out who is your highest bidder!</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
	
	
	<%
	try {	
		%>
		<a href="SearchAuctionFolder/SearchFilter.jsp">
			<button>Filter Options</button>
		</a>
		<% 
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		PreparedStatement stmt=con.prepareStatement("SELECT * FROM auction;");
		ResultSet result=stmt.executeQuery();	
		PreparedStatement stmt2=con.prepareStatement("SELECT * FROM auction;");
		ResultSet result2=stmt2.executeQuery();	
		
		HttpSession sess = request.getSession();
		String idString = String.valueOf(sess.getAttribute("userID")); 	
		int id = Integer.parseInt(idString);
		
		String query = "select auctionID from auction where userID = " + id;
		PreparedStatement stmt1=con.prepareStatement(query);
		ResultSet result1=stmt1.executeQuery();
		%><br><% 
		out.print("Your auction ID are: ");
		while(result1.next()){
			out.print(result1.getInt("auctionID") + " ");
		}
		%><br><% 
		out.println("Your userID is: " + id);
		%>
		<br>
		<a href="http://localhost:8080/B_Bay/Home.jsp">
			<button>Go To Home</button>
		</a>
		
		<br>
		
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
		<form  method="post" action="BidFolder/Bid.jsp">
			<p>Select which auction to buy!</p>
			  	 <select name="auctionIDOption">
			        <%  while(result2.next()){ 
			        	int auctionID1 = result2.getInt("auctionID");
			        	int bidderUserID1 = result2.getInt("userID");
			        	String isAvailable1 = result2.getString("isAvailable");
			        	if(bidderUserID1 != id && isAvailable1.equals("Y")){
			        		%><option value = "<%=auctionID1%>"><%=auctionID1%></option><% 
			        	}
			        }
			        	%>
			     </select>
			<input type="submit" value="Submit"> 	 	
		</form>
		<%con.close(); %>
	<% } catch (Exception ex) {
		
	}
	%>			
		  
	


 <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; eAuction 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>		
</body>
</html>