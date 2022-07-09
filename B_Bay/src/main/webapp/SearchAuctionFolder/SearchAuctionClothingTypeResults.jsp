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
<title>Insert title here</title>
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
								try{
									String clothingType = (String)session.getAttribute("clothingType");
									String onlyAvailable =  request.getParameter("onlyAvailable");
									if(clothingType.equals("Pant")){
										String pantWaistVal =  request.getParameter("pantWaistOption");
										String pantType = request.getParameter("pantTypeOption");
										String pantGender =request.getParameter("pantGenderOption");
										String pantColor = request.getParameter("pantColorOption");
										String pantBidPrice = request.getParameter("pantBidPriceOption");
										
										int pantWaistValToInt = -1;
										double pantBidPriceToDouble = -1;
										 if(!(pantWaistVal.equals("null"))){//int values must be  convereted from string to int
											 pantWaistValToInt = Integer.parseInt(pantWaistVal);
										 }
										if(!(pantBidPrice.equals("null"))){
											pantBidPriceToDouble = Double.valueOf(pantBidPrice);
										}
											
										
										ApplicationDB db = new ApplicationDB();	
										Connection con = db.getConnection();
										//create filter mysql query
										StringBuilder filter = new StringBuilder();
										//there is at least one of the search values 
										//there is pantwaist
										filter.append("select distinct uniqueItemID, itemID, pant_waist,pant_type,pant_gender,color,bidPrice from pant p,auction a ");
										if( (pantWaistValToInt != -1) || (!(pantType.equals("null"))) || (!(pantGender.equals("null"))) 
												|| (!(pantColor.equals("null"))) ||  (pantBidPriceToDouble != -1)){
											filter.append("where ");
										}
										//--------
										if(pantWaistValToInt != -1 ){
											filter.append(" pant_waist = " + pantWaistValToInt + " ");
										}
										//there is pants type
										if(  pantWaistValToInt != -1  && ( !(pantType.equals("null")) ||!(pantGender.equals("null")) 
												||!(pantColor.equals("null")) || pantBidPriceToDouble != -1)){
											filter.append(" and ");
										}
										if( !(pantType.equals("null")) ){
											filter.append(" pant_type = '" + pantType + "' ");
										}
										//there is pants gender
										if( !(pantType.equals("null")) && ( !(pantGender.equals("null")) ||!(pantColor.equals("null")) || pantBidPriceToDouble != -1)){
											filter.append(" and ");
										}
										if( !(pantGender.equals("null"))){
											filter.append(" pant_gender = '" + pantGender + "' ");
										}
										//there is pants color
										if(!(pantGender.equals("null")) && (!(pantColor.equals("null")) || pantBidPriceToDouble != -1)){
											filter.append(" and ");
										}
										if(!(pantColor.equals("null"))){
											filter.append(" color = '" + pantColor + "' ");
										}
										//there is bid price
										if( !(pantColor.equals("null")) && pantBidPriceToDouble != -1){
											filter.append(" and ");
										}
										if( pantBidPriceToDouble != -1){
											filter.append(" bidPrice = " + pantBidPriceToDouble + " ");
										}
										
										if( (pantWaistValToInt != -1) || (!(pantType.equals("null"))) || (!(pantGender.equals("null"))) 
												|| (!(pantColor.equals("null"))) ||  (pantBidPriceToDouble != -1)){
											if(onlyAvailable.equals("Yes")){
												filter.append(" and p.itemID = a.auctionID and a.isAvailable = 'Y'");	
											}	
										}else{
											if(onlyAvailable.equals("Yes")){
												filter.append(" where p.itemID = a.auctionID and a.isAvailable = 'Y'");	
											}
										}
										//out.print(filter);			
										String whereQuery = filter.toString(); 
										 
									
										
										PreparedStatement stmt=con.prepareStatement(whereQuery);
								
										ResultSet result=stmt.executeQuery();	
											
									
										%>
										<table border = '1'  class="table table-striped table-hover">
												<tr>    
													<td>Unique Item ID</td>
													<td>Auction ID</td>
													<td>Pant Waist</td>
													<td>Pant Type</td>
													<td>Pant Gender</td>
													<td>Color</td>
													<td>Bid Price</td>
													
													
												</tr>
													<%
													//parse out the results
													while (result.next()) { %>
														<tr>    
															<td><%= result.getInt("uniqueItemID") %></td>
															<td><%= result.getInt("itemID") %></td>
															<td><%= result.getInt("pant_waist") %></td>
															<td><%= result.getString("pant_type") %></td>
															<td><%= result.getString("pant_gender") %></td>
															<td><%= result.getString("color") %></td>
															<td><%= result.getBigDecimal("bidPrice") %></td>
														</tr>		
													<% }
													//close the connection.
													con.close();
													%>
										</table> 
										
										
										<% 
									}else if(clothingType.equals("Shirt")){
										String shirtSize =  request.getParameter("shirtSizeOption");
										String shirtGender = request.getParameter("shirtGenderOption");
										String shirtBrand =request.getParameter("shirtBrandOption");
										String shirtColor = request.getParameter("shirtColorOption");
										String shirtBidPrice = request.getParameter("shirtBidPriceOption");
										double shirtBidPriceToDouble = -1;
										if(!(shirtBidPrice.equals("null"))){
											shirtBidPriceToDouble = Double.valueOf(shirtBidPrice);
										}
										
							
										ApplicationDB db = new ApplicationDB();	
										Connection con = db.getConnection();
										//create filter mysql query
										StringBuilder filter = new StringBuilder();
										//there is at least one of the search values 
										//there is shirt size
										filter.append("select distinct uniqueItemID, itemID, shirt_size,shirt_gender,shirt_brand,color,bidPrice from shirt s,auction a");
										if((!(shirtSize.equals("null")))  || (!(shirtGender.equals("null"))) || (!(shirtBrand.equals("null"))) 
												|| (!(shirtColor.equals("null"))) ||  (shirtBidPriceToDouble != -1)){
											filter.append("where ");
										}
										//--------
										if(!(shirtSize.equals("null")) ){
											filter.append(" shirt_size = '" + shirtSize + "' ");
										}
										//there is shirt gender
										if(  !(shirtSize.equals("null"))  && ( !(shirtGender.equals("null")) ||!(shirtBrand.equals("null")) 
												||!(shirtColor.equals("null")) || shirtBidPriceToDouble != -1)){
											filter.append(" and ");
										}
										if( !(shirtGender.equals("null")) ){
											filter.append(" shirt_gender = '" + shirtGender + "' ");
										}
										//there is shirt brand
										if( !(shirtGender.equals("null")) && ( !(shirtBrand.equals("null")) ||!(shirtColor.equals("null")) || shirtBidPriceToDouble != -1)){
											filter.append(" and ");
										}
										if( !(shirtBrand.equals("null"))){
											filter.append(" shirt_brand = '" + shirtBrand + "' ");
										}
										//there is shirt color
										if(!(shirtBrand.equals("null")) && (!(shirtColor.equals("null")) || shirtBidPriceToDouble != -1)){
											filter.append(" and ");
										}
										if(!(shirtColor.equals("null"))){
											filter.append(" color = '" + shirtColor + "' ");
										}
										//there is bid price
										if( !(shirtColor.equals("null")) && shirtBidPriceToDouble != -1){
											filter.append(" and ");
										}
										if( shirtBidPriceToDouble != -1){
											filter.append(" bidPrice = " + shirtBidPriceToDouble + " ");
										}
										
										if((!(shirtSize.equals("null")))  || (!(shirtGender.equals("null"))) || (!(shirtBrand.equals("null"))) 
												|| (!(shirtColor.equals("null"))) ||  (shirtBidPriceToDouble != -1)){
											if(onlyAvailable.equals("Yes")){
												filter.append(" and s.itemID = a.auctionID and a.isAvailable = 'Y'");	
											}	
										}else{
											if(onlyAvailable.equals("Yes")){
												filter.append(" where s.itemID = a.auctionID and a.isAvailable = 'Y'");	
											}
										}
										//out.print(filter);
										String whereQuery = filter.toString(); 
										 
										
										
										PreparedStatement stmt=con.prepareStatement(whereQuery);
										ResultSet result=stmt.executeQuery();	
												
										
									
										%>
										<table border = '1'  class="table table-striped table-hover">
												<tr>    
													<td>Unique Item ID</td>
													<td>Auction  ID</td>
													<td>Shirt Size</td>
													<td>Shirt Gender</td>
													<td>Shirt Brand</td>
													<td>Color</td>
													<td>Bid Price</td>
													
												</tr>
													<%
													//parse out the results
													while (result.next()) { %>
														<tr>    
															<td><%= result.getInt("uniqueItemID") %></td>
															<td><%= result.getString("itemID") %></td>
															<td><%= result.getString("shirt_size") %></td>
															<td><%= result.getString("shirt_gender") %></td>
															<td><%= result.getString("shirt_brand") %></td>
															<td><%= result.getString("color") %></td>
															<td><%= result.getBigDecimal("bidPrice") %></td>
															
														</tr>
														
										
													<% }
													//close the connection.
													con.close();
													%>
										</table> 									
										<% 
							}else{
								String shoeSize =  request.getParameter("shoeSizeOption");
								String shoeGender = request.getParameter("shoeGenderOption");
								String shoeBrand =request.getParameter("shoeBrandOption");
								String shoeColor = request.getParameter("shoeColorOption");
								String shoeBidPrice = request.getParameter("shoeBidPriceOption");
								double shoeBidPriceToDouble = -1;
								if(!(shoeBidPrice.equals("null"))){
									shoeBidPriceToDouble = Double.valueOf(shoeBidPrice);
								}
								double shoeSizeToDouble = -1;
								if(!(shoeSize.equals("null"))){
									shoeSizeToDouble = Double.valueOf(shoeSize);
								}
								
					
								ApplicationDB db = new ApplicationDB();	
								Connection con = db.getConnection();
								//create filter mysql query
								StringBuilder filter = new StringBuilder();
								//there is at least one of the search values 
								//there is shoe size
								filter.append("select distinct uniqueItemID, itemID,shoe_size,shoe_gender,shoe_brand,color,bidPrice from shoe s,auction a  ");
								if((shoeSizeToDouble != -1) || (!(shoeGender.equals("null"))) || (!(shoeBrand.equals("null"))) 
										|| (!(shoeColor.equals("null"))) ||  (shoeBidPriceToDouble != -1)){
									filter.append("where ");
								}
								//--------
								if(shoeSizeToDouble != -1 ){
									filter.append(" shoe_size = '" + shoeSizeToDouble + "' ");
								}
								//there is shoe gender
								if( shoeSizeToDouble != -1  && ( !(shoeGender.equals("null")) ||!(shoeBrand.equals("null")) 
										||!(shoeColor.equals("null")) || shoeBidPriceToDouble != -1)){
									filter.append(" and ");
								}
								if( !(shoeGender.equals("null")) ){
									filter.append(" shoe_gender = '" + shoeGender + "' ");
								}
								//there is shoe brand
								if( !(shoeGender.equals("null")) && ( !(shoeBrand.equals("null")) ||!(shoeColor.equals("null")) || shoeBidPriceToDouble != -1)){
									filter.append(" and ");
								}
								if( !(shoeBrand.equals("null"))){
									filter.append(" shoe_brand = '" + shoeBrand + "' ");
								}
								//there is shoe color
								if(!(shoeBrand.equals("null")) && (!(shoeColor.equals("null")) || shoeBidPriceToDouble != -1)){
									filter.append(" and ");
								}
								if(!(shoeColor.equals("null"))){
									filter.append(" color = '" + shoeColor + "' ");
								}
								//there is bid price
								if( !(shoeColor.equals("null")) && shoeBidPriceToDouble != -1){
									filter.append(" and ");
								}
								if( shoeBidPriceToDouble != -1){
									filter.append(" bidPrice = " + shoeBidPriceToDouble + " ");
								}
								
								 
								if((shoeSizeToDouble != -1) || (!(shoeGender.equals("null"))) || (!(shoeBrand.equals("null"))) 
										|| (!(shoeColor.equals("null"))) ||  (shoeBidPriceToDouble != -1)){
									if(onlyAvailable.equals("Yes")){
										filter.append(" and s.itemID = a.auctionID and a.isAvailable = 'Y'");	
									}	
								}else{
									if(onlyAvailable.equals("Yes")){
										filter.append(" where s.itemID = a.auctionID and a.isAvailable = 'Y'");	
									}
								}
								//out.print(filter);
								String whereQuery = filter.toString(); 
								
								
								PreparedStatement stmt=con.prepareStatement(whereQuery);
								ResultSet result=stmt.executeQuery();	
										
								
							
								%>
								<table border = '1'  class="table table-striped table-hover">
										<tr>    
											<td>Unique Item ID</td>
											<td>Auction ID</td>
											<td>Shoe Size</td>
											<td>Shoe Gender</td>
											<td>Shoe Brand</td>
											<td>Color</td>
											<td>Bid Price</td>
											
										</tr>
											<%
											//parse out the results
											while (result.next()) { %>
												<tr>    
													<td><%= result.getInt("uniqueItemID") %></td>
													<td><%= result.getInt("itemID") %></td>
													<td><%= result.getBigDecimal("shoe_size") %></td>
													<td><%= result.getString("shoe_gender") %></td>
													<td><%= result.getString("shoe_brand") %></td>
													<td><%= result.getString("color") %></td>
													<td><%= result.getBigDecimal("bidPrice") %></td>		
												</tr>
											<% }
											//close the connection.
											con.close();
											%>
								</table>
								<% 
							}
						
						}catch(Exception e){
							
						}
					%>
					<a href="http://localhost:8080/B_Bay/Home.jsp">
						<button>Go To Home</button>
					</a>
					<br>
									
                </div>
            </div>
        </section>
        <br>



 <!-- Footer-->
        <footer style = "min-height: 50vh;" class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; eAuction 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>	
</body>
</html>