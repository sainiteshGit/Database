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
<title>Its working</title>
</head>


<%

Connect_Request cr1= new Connect_Request(); 
Connection con=cr1.getConnection();
Statement ps = null;
ResultSet rs=null;
String sql="select * from User_sob";
ps=con.createStatement();
rs = ps.executeQuery(sql); 
 while(rs.next()) {
	 out.print(rs.getString(1));
	 out.print(rs.getString(2));
	 out.print(rs.getString(3));
	 out.print(rs.getString(4));
	 out.print(rs.getString(5));
	 out.print(rs.getString(6));
 }
 

%>

</html>