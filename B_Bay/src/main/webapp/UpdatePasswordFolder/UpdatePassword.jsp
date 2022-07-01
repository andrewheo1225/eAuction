<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href ="../bootstrap/css/bootstrap.css"  type="text/css">
<meta charset="UTF-8">
<title>Update Password</title>
</head>
<body>

	 <div class="container">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="login-form bg-light mt-4 p-4">
                    <form method="post" action="UpdatePasswordData.jsp" class="row g-3">
                        <h4>Update </h4>
                        <div class="col-12">
                            <label>Username</label>
                            <input required="required"  name="userName" type="text"    class="form-control" placeholder="Username">
                        </div>
                        <div class="col-12">
                            <label>Email</label>
                            <input required="required" name="email" type="text" class="form-control" placeholder="Email">
                        </div>
                        
                        <div class="col-12">
                            <button type="submit"  class="btn btn-dark float-end">Confirm</button>
                        </div>
                    </form>
                    
                </div>
            </div>	
        </div>
    </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>



</body>
</html>