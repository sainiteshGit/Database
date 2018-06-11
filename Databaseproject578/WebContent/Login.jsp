<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*"  %>
     <%@ page import ="java.lang.*"  %>
    <%@ page import ="java.util.*"  %>
    <%@ page import = "Project.Connect_Request" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="Home.css">
<title>Login</title>

</head>
<body id ="HomeBody">
<form action="LoginServlet" method="post" id="LoginForm">

<table border=1 align="center">
<tr>
<th>Username: </th>
<td width=200><input type="text"  style= "width: 200px;" name="username" placeholder="Please enter university email ID"></td>
</tr>

<tr>
<th>Password: </th>
<td width=200><input type="password"  style= "width: 200px;" name="passsword" placeholder="Please enter your password"></td>
</tr>


</table>

<center>
<input type="submit" value="Login" >
</center>

</form>
</body>
</html>