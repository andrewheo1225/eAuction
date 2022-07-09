<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
     <meta name="description" content="" />
     <meta name="author" content="" />
	 <base href="http://localhost:8080/B_Bay/" />
	 <link rel="icon" type="image/x-icon" href="package/dist/assets/favicon.ico" />
	 <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
	 <link href="package/dist/css/styles.css" rel="stylesheet" />
<title></title>
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
        
 
<%
	try{
		String clothingType = request.getParameter("ClothingType"); 
		session.setAttribute("cloth", clothingType);
		
		if(clothingType.equals("Pant")){
			%>
			
			<form  style= "margin:10px 15px;" action="SellFolder/SellClothingTypeAttributeData.jsp">
					<div class="form-group">
					    <label>Start Date</label>
					    <input type="text"  required="required" value="yyyy-mm-dd" name="startDate" class="form-control"  placeholder="Enter Start Date">
					</div>
					<div class="form-group">
					    <label>End Date</label>
					    <input type="text"  required="required" value="yyyy-mm-dd" name="endDate" class="form-control"  placeholder="Enter End Date">
					</div>
					<div class="form-group">
					    <label>Initial Bid Price</label>
					    <input type="number" step = "0.01"required="required"min = "0" name="initialBidPrice" class="form-control"  placeholder="Enter Bid Price">
					</div>
					<div class="form-group">
					    <label>Increment Bid Value</label>
					    <input type="number"  step = "0.01"required="required"min = "0" name="incrementBidPrice" class="form-control"  placeholder="Enter Increment Bid Price">
					</div>
					<div class="form-group">
					    <label>Minimum Bid Required</label>
					    <input type="number" type="number" step = "0.01"required="required"min = "0" name="minBid" class="form-control"  placeholder="Enter Miniumum Price">
					</div>
					<div class="form-group">
					    <label>Pant Waist</label>
					    <input type="number" required="required" min = "0" name="pant_waist" class="form-control"  placeholder="Enter Pant Waist">
					</div>
					<div class="form-group">
					    <label>Pant Type</label>
					    <input type="text"required="required" name="pant_type" class="form-control"  placeholder="Enter Pant Type">
					</div>
					<div class="form-group">
					    <label>Pant Gender</label>
					    <input type="text" required="required"name="pant_gender" class="form-control"  placeholder="Enter Pant Gender">
					</div>
					<div class="form-group">
					    <label>Pant Color</label>
					    <input type="text"required="required" name="color" class="form-control"  placeholder="Enter Color">
					</div>
	
					<p>Would you like the item to be available?</p>
					<select style="margin-top:-5px;" class="form-select" aria-label="Please Select" name="isAvailable">
					    	<option value="Y">Yes</option>
					    	<option value="N">No</option>
			  		</select>
			  		
			  	
			  	<div style= "margin:15px 0px;" class="row">
					<div class="col">
						 <button type="submit" class="btn btn-primary">Submit</button>
					</div>
				  	<div class="col">
				  		<a href="http://localhost:8080/B_Bay/Home.jsp">
							<button>Go To Home</button>
						</a>
				  	</div>
				</div>
			</form>
		<% 
		}else if(clothingType.equals("Shirt")){
			%>
			<form  style= "margin:10px 15px;" action="SellFolder/SellClothingTypeAttributeData.jsp">
					<div class="form-group">
					    <label>Start Date</label>
					    <input type="text"  required="required" value="yyyy-mm-dd" name="startDate" class="form-control"  placeholder="Enter Start Date">
					</div>
					<div class="form-group">
					    <label>End Date</label>
					    <input type="text"  required="required" value="yyyy-mm-dd" name="endDate" class="form-control"  placeholder="Enter End Date">
					</div>
					<div class="form-group">
					    <label>Initial Bid Price</label>
					    <input type="number" step = "0.01"required="required"min = "0" name="initialBidPrice" class="form-control"  placeholder="Enter Bid Price">
					</div>
					<div class="form-group">
					    <label>Increment Bid Value</label>
					    <input type="number"  step = "0.01"required="required"min = "0" name="incrementBidPrice" class="form-control"  placeholder="Enter Increment Bid Price">
					</div>
					<div class="form-group">
					    <label>Minimum Bid Required</label>
					    <input type="number" type="number" step = "0.01"required="required"min = "0" name="minBid" class="form-control"  placeholder="Enter Miniumum Price">
					</div>
					<div class="form-group">
					    <label>Shirt Size</label>
					    <input type="text" required="required"  name="shirt_size" class="form-control"  placeholder="Enter Shirt Size">
					</div>
					<div class="form-group">
					    <label>Shirt Gender</label>
					    <input type="text"required="required" name="shirt_gender" class="form-control"  placeholder="Enter Shirt Gender">
					</div>
					<div class="form-group">
					    <label>Shirt Brand</label>
					    <input type="text" required="required"name="shirt_brand" class="form-control"  placeholder="Enter Shirt Brand">
					</div>
					<div class="form-group">
					    <label>Shirt Color</label>
					    <input type="text"required="required" name="color" class="form-control"  placeholder="Enter Shirt Color">
					</div>
	
					<p>Would you like the item to be available?</p>
					<select style="margin-top:-5px;" class="form-select" aria-label="Please Select" name="isAvailable">
					    	<option value="Y">Yes</option>
					    	<option value="N">No</option>
			  		</select>
			  		
			  	
			  	<div style= "margin:15px 0px;" class="row">
					<div class="col">
						 <button type="submit" class="btn btn-primary">Submit</button>
					</div>
				  	<div class="col">
				  		<a href="http://localhost:8080/B_Bay/Home.jsp">
							<button>Go To Home</button>
						</a>
				  	</div>
				</div>
			</form>
			
	
		<% 
		}else{
			%>
			<form  style= "margin:10px 15px;" action="SellFolder/SellClothingTypeAttributeData.jsp">
					<div class="form-group">
					    <label>Start Date</label>
					    <input type="text"  required="required" value="yyyy-mm-dd" name="startDate" class="form-control"  placeholder="Enter Start Date">
					</div>
					<div class="form-group">
					    <label>End Date</label>
					    <input type="text"  required="required" value="yyyy-mm-dd" name="endDate" class="form-control"  placeholder="Enter End Date">
					</div>
					<div class="form-group">
					    <label>Initial Bid Price</label>
					    <input type="number" step = "0.01"required="required"min = "0" name="initialBidPrice" class="form-control"  placeholder="Enter Bid Price">
					</div>
					<div class="form-group">
					    <label>Increment Bid Value</label>
					    <input type="number"  step = "0.01"required="required"min = "0" name="incrementBidPrice" class="form-control"  placeholder="Enter Increment Bid Price">
					</div>
					<div class="form-group">
					    <label>Minimum Bid Required</label>
					    <input type="number" type="number" step = "0.01"required="required"min = "0" name="minBid" class="form-control"  placeholder="Enter Miniumum Price">
					</div>
					<div class="form-group">
					    <label>Shoe Size</label>
					    <input type="number" required="required"  min = "0"step = "0.5"  name="shoe_size" class="form-control"  placeholder="Enter Shoe Size">
					</div>
					<div class="form-group">
					    <label>Shoe Gender</label>
					    <input type="text"required="required" name="shoe_gender" class="form-control"  placeholder="Enter Shoe Gender">
					</div>
					<div class="form-group">
					    <label>Shoe Brand</label>
					    <input type="text" required="required"name="shoe_brand" class="form-control"  placeholder="Enter Shoe Brand">
					</div>
					<div class="form-group">
					    <label>Shoe Color</label>
					    <input type="text"required="required" name="color" class="form-control"  placeholder="Enter Shoe Color">
					</div>
	
					<p>Would you like the item to be available?</p>
					<select style="margin-top:-5px;" class="form-select" aria-label="Please Select" name="isAvailable">
					    	<option value="Y">Yes</option>
					    	<option value="N">No</option>
			  		</select>
			  		
			  	
			  	<div style= "margin:15px 0px;" class="row">
					<div class="col">
						 <button type="submit" class="btn btn-primary">Submit</button>
					</div>
				  	<div class="col">
				  		<a href="http://localhost:8080/B_Bay/Home.jsp">
							<button>Go To Home</button>
						</a>
				  	</div>
				</div>
			</form>
			
		<% 
		}
	}catch(Exception e){
		
	}
%>

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