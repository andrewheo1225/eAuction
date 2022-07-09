<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Filters</title>
 <meta charset="utf-8" />
     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
     <meta name="description" content="" />
     <meta name="author" content="" />
	 <base href="http://localhost:8080/B_Bay/" />
	 <link rel="icon" type="image/x-icon" href="package/dist/assets/favicon.ico" />
	 <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
	 <link href="package/dist/css/styles.css" rel="stylesheet" />
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
        
        
        <div class="h-100 d-flex align-items-center justify-content-center">
		  <div style = "margin: 15px;">
			    <h1>Please select the type of clothing you want to sell!</h1>
				<br>
				<form  class="h-100 d-flex align-items-center justify-content-center" action="SellFolder/SellClothingTypeAttribute.jsp">
				  	<select class="form-select" aria-label="Please Select" name="ClothingType">
				    	<option value="Pant">Pant</option>
				    	<option value="Shirt">Shirt</option>
				   	    <option value="Shoe">Shoe</option>
				  	</select>
				
				 	 <input style = "margin-left:15px;" type="submit" value="Submit"> 
				</form>
				
		  </div>
		</div>


 <!-- Footer-->
        <footer style = "min-height: 75vh;" class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; eAuction 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>	
	
</body>
</html>