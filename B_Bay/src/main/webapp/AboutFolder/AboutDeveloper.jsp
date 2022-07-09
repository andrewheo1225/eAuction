
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Developer</title>
	 <meta charset="utf-8" />
     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
     <meta name="description" content="" />
     <meta name="author" content="" />
	 <base href="http://localhost:8080/B_Bay/" />
	 <link rel="icon" type="image/x-icon" href="package/dist/assets/favicon.ico" />
	 <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
	 <link href="package/dist/css/styles.css" rel="stylesheet" />
	 <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
	 <link href="AboutFolder/AboutDeveloper.css" rel="stylesheet"/>
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


	

	<section id="about-section" class="pt-5 pb-5">
	    <div class="container wrapabout">
	        <div class="red"></div>
	        <div class="row">
	            <div class="col-lg-6 align-items-center justify-content-left d-flex mb-5 mb-lg-0">
	                <div class="blockabout">
	                    <div class="blockabout-inner text-center text-sm-start">
	                        <div class="title-big pb-3 mb-3">
	                            <h3>ABOUT ME</h3>
	                        </div>
	                        <p class="description-p text-muted pe-0 pe-lg-0">
	                            My name is Andrew Heo and I am an undergraduate student at Rutgers University, graduating in 2024. I started getting into web development a few years ago 
	                            and I am currently trying to improve my skills through projects like these. 
	                        </p>
	                        <p class="description-p text-muted pe-0 pe-lg-0">
	                        	Thanks for checking out my website! Feel free to look at my Github and contact me regarding anything!
	                        </p>
	                        <div class="sosmed-horizontal pt-3 pb-3">
	                            <a href="https://www.facebook.com/profile.php?id=100071982594286"><i class="fa fa-facebook"></i></a>
	                            <a href="https://www.instagram.com/02_hya/"><i class="fa fa-instagram"></i></a>
	                            <a href="https://www.linkedin.com/in/andrew-heo-56b0a81b6/"><i class="fa fa-linkedin"></i></a>
	                        </div>
	                        <a href="https://github.com/andrewheo1225" class="btn rey-btn mt-3">See More</a>
	                    </div>
	                </div>
	            </div>
	            <div class="col-lg-6 mt-5 mt-lg-0">
	                <figure class="col-lg-9" style="padding-left: 0px;  padding-right: 0px;">
	                    <img class="img-fluid" src="http://localhost:8080/B_Bay/Pictures/sexyGuy.jpg" alt="potoabout" />
	                </figure>
	            </div>
	        </div>
	    </div>
	</section>


	  
	
 <!-- Footer-->
        <footer style = "min-height: 23vh;" class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; eAuction 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>	
</body>
</html>