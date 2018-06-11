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
<title>Mathematics</title>
</head>
<body>
<header></header>



<div>

<%
	 Connect_Request cc = new Connect_Request();
Connection con= null;
PreparedStatement ps = null;
ResultSet rs=null;
String sql="select c.cid,c.title from credit_course c,Programs p where p.prog_id=c.prog_id AND p.Dept_id='2430';";

try {
con = cc.getConnection();
PreparedStatement pps = con.prepareStatement(sql);
rs=pps.executeQuery(); 
%>


<h5 align="center">List of Programs</h5>
<table border=1  id = "ListofProgs" align="center">
<tr>
<th>CID</th>
<th>TITLE</th>
</tr>
<% 
rs.beforeFirst();
while(rs.next()){ %>
<tr>
<td><%=rs.getString(1)%></td>
<td width=180><%=rs.getString(2)%></td>
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