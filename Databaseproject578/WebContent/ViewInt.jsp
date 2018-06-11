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
<title>View International Students In Non-credit Courses</title>
</head>
<body>


<div >
	 <%
	 Connect_Request cc = new Connect_Request();
Connection con= null;
PreparedStatement ps = null;
ResultSet rs=null;
String sql="select fname,lname,isid from int_student where isid IN (select sid from student  where sid IN (select sid from Student_Register  NATURAL JOIN  (select cid from noncredit_course) as noncrcid )       );";

try {
con = cc.getConnection();
PreparedStatement pps = con.prepareStatement(sql);
rs=pps.executeQuery(); 
%>


<h5>List of International Students in Non-credift based courses</h5>
<table border=1 id="CreditCourses">
<tr>
<th>First Name</th>
<th>Last Name</th>
<th>Student ID</th>
</tr>
<% 
rs.beforeFirst();
while(rs.next()){ %>
<tr>
<td width=100><%=rs.getString(1)%></td>
<td width=100><%=rs.getString(2)%></td>
<td width=100><%=rs.getString(3)%></td>
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