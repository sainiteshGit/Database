<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="Project.Connect_Request" %> 

     <%@ page import ="java.sql.*"  %>
     <%@ page import ="java.lang.*"  %>
    <%@ page import ="java.util.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="Home.css">
<title>Its working yo yo</title>
</head>

<body id="FacultyDetails">
<div id="FacultyDetails">
	 <%
	 Connect_Request cc = new Connect_Request();
Connection con= null;
PreparedStatement ps = null;
ResultSet rs=null;
String sql="select fname,lname,Specialization from Faculty";

try {
con = cc.getConnection();
PreparedStatement pps = con.prepareStatement(sql);
rs=pps.executeQuery(); 
%>


<h5>Available courses</h5>
<table border=1 id="Facultyprofile">
<tr>
<th>fname</th>
<th>lname</th>
<th>Specialization</th>
</tr>
<% 
rs.beforeFirst();
while(rs.next()){ %>
<tr>
<td><%=rs.getString(1)%></td>
<td width=100><%=rs.getString(2)%></td>
<td width=180><%=rs.getString(3)%></td>

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

</body>
</html>