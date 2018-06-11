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
<title>View Payment Details</title>
</head>
<body id="ccdetails">

<div >
	 <%
	 Connect_Request cc = new Connect_Request();
Connection con= null;
PreparedStatement ps = null;
ResultSet rs=null;
String sql="select pay_id,pay_date,type,stud_id,term,amount from payment;";

try {
con = cc.getConnection();
PreparedStatement pps = con.prepareStatement(sql);
rs=pps.executeQuery(); 
%>


<h5>Payment Details</h5>
<table border=1 id="CreditCourses">
<tr>
<th>Payid</th>
<th>Date</th>
<th>Type</th>
<th>Stud_id</th>
<th>Term</th>
<th>Amount</th>
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
<td width=180><%=rs.getString(6)%></td>
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