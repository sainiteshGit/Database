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
<title> For Credit Course Registration </title>
<link rel="stylesheet" href="Home.css">
</head>
<body id="ccdetails">

<div >
	 <%
	 Connect_Request cc = new Connect_Request();
Connection con= null;
PreparedStatement ps = null;
ResultSet rs=null;
String sql="select cid, title, term, cost, credits from credit_course";

try {
con = cc.getConnection();
PreparedStatement pps = con.prepareStatement(sql);
rs=pps.executeQuery(); 
%>


<h5>Available courses</h5>
<table border=1 id="CreditCourses">
<tr>
<th>cid</th>
<th>title</th>
<th>term</th>
<th>cost</th>
<th>credits</th>
</tr>
<% 
rs.beforeFirst();
while(rs.next()){ %>
<tr>
<td><%=rs.getString(1)%></td>
<td width=180><%=rs.getString(2)%></td>
<td width=180><%=rs.getString(3)%></td>
<td width=180><%=rs.getString(4)%></td>
<td width=180><%=rs.getString(5)%></td>
</tr>
<% } %>
</table>
<% 
}
catch(SQLException sqe)
{
out.println("home"+sqe);
}
%>

	 </div>



<form action="Credit_Course_Register" method="post">

<table border=1 align="center" id="ccdetailstable">
<tr>
<th>Student ID: </th>
<td><input type="text"  name="sid"></td>
</tr>

<tr>
<th>Course ID: </th>
<td><input type="text"  name="cid"></td>
</tr>


<tr>
<th>Term: </th>
<td><input type="text"  name="term"></td>
</tr>


</table>

<center>
<input type="submit" value="Register" name="Register">
</center>

</form>


</body>
</html>