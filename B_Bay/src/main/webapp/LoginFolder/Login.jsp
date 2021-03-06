<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	 	<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
		 <link rel = "stylesheet" href ="bootstrap/css/bootstrap.css"  type="text/css">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>B-BAY</title>
		<base href="http://localhost:8080/B_Bay/" />
	</head>
	
	
<body>	

	 <div class="container">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="login-form bg-light mt-4 p-4">
                    <form method="post" action="LoginFolder/LoginPath.jsp" class="row g-3">
                        <h4>eAuction</h4>
                        <div class="col-12">
                            <label>Username</label>
                            <input required="required"  name="userName" type="text"    class="form-control" placeholder="Username">
                        </div>
                        <div class="col-12">
                            <label>Password</label>
                            <input required="required" name="password" type="password" class="form-control" placeholder="Password">
                        </div>
                        
                        <div class="col-12">
                            <button type="submit"  class="btn btn-dark float-end">Login</button>
                        </div>
                    </form>
                    <hr class="mt-4">
                    <div class="col-12">
                        <p class="text-center mb-0">Don't Have An Account Yet? <a href="CreateAccountFolder/CreateAccount.jsp">Signup</a></p>
                    </div>
                    <div class="col-12">
                        <p class="text-center mb-0">Need To Update?<a href="UpdatePasswordFolder/UpdatePassword.jsp">Update</a></p>
                    </div>
                </div>
            </div>	
        </div>
    </div>
    



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>