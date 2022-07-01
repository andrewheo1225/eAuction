<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta name="viewport" http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>B-BAY</title>
		<base href="http://localhost:8080/B_Bay/" />
		 <script>
     	 function confirmAction() {
	        let confirmAction = confirm("Are you sure to delete your account?");
	        if (confirmAction) {
	        	window.location= "http://localhost:8080/B_Bay/DeleteFolder/DeleteAccount.jsp";
	        	
	        } else {
	        	window.location= "http://localhost:8080/B_Bay/Home.jsp";
	        
	        }
	      }
  		  </script>
  		  <link rel = "stylesheet" href ="bootstrap/css/bootstrap.css">
  		
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	</head>
<body>
	
	
	Welcome <%=session.getAttribute("user") %>
	<br>
	Your userID is <%
	HttpSession sess = request.getSession();
	int id=(Integer)sess.getAttribute("userID"); 
	out.print(id);
	sess.setAttribute("userID",id);
	
	String IDtoString = String.valueOf(id);
	// Create cookies for first and last names.      
	Cookie cookie_id = new Cookie("cookie_id",IDtoString );
	cookie_id.setMaxAge(60*60*24); 
	response.addCookie( cookie_id );
	%>
	
		<br>
		
		<a href="LoginFolder/LogoutPath.jsp">
			<button>Log Out</button>
		</a>
		
		<br>
		
		<a >
			<button onclick="confirmAction()">Delete Account</button>
		</a>
		<br>
		<a href="SearchAuctionFolder/SearchAllAuction.jsp">
			<button>Search For Items</button>
		</a>
	
		<br>
		<a href="SellFolder/Sell.jsp">
			<button>Sell Items</button>
		</a>
		<br>
		<a href="YourBidsFolder/YourBids.jsp">
			<button>Check Your Bids</button>
		</a>
		<br>
		<a href="YourItemsFolder/YourItems.jsp">
			<button>Your Items</button>
		</a>
	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>
