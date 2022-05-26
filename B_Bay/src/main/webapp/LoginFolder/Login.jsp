<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>B-BAY</title>
	</head>

<body>	

<base href="http://localhost:8080/B_Bay/" />
		  
<form method="post" action="LoginFolder/LoginPath.jsp">
			<table>
				<tr>    
					<td>User Name</td><td><input type="text"required="required"  name="userName"></td>
				</tr>
				<tr>
					<td>Password</td><td><input type="text" required="required"name="password"></td>
				</tr>
			</table>
			<input type="submit" value="Log In">
</form>


<a href="CreateAccountFolder/CreateAccount.jsp">
		<button>Create Account</button>
</a>
<br/>
<a href="UpdatePasswordFolder/UpdatePassword.jsp">
		<button>Update Password</button>
</a>	
<br/>

		
		
</body>
</html>