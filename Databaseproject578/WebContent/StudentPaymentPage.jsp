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
<title>Student Registration Details</title>
</head>
<body>


<div id="RegisteredCourseInformation">
	 <%
	 Connect_Request cc = new Connect_Request();
Connection con= null;
PreparedStatement ps = null;
ResultSet rs=null;
int sid = Integer.parseInt(request.getParameter("stid"));
String term = request.getParameter("termd").toString();

String sql="select sr.cid, cc.cost from Student_Register sr, credit_course cc where sr.sid = '"+sid+"' AND sr.term = '"+term+"'   AND sr.cid = cc.cid AND sr.term = cc.term";

try {
con = cc.getConnection();
PreparedStatement pps = con.prepareStatement(sql);
rs=pps.executeQuery(); 
%>


<h5>List of Courses you have registered for this semester and their price</h5>
<table border=1>
<tr>
<th>sr.cid</th>
<th>cc.cost</th>
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


<form action="PaymentServlet" method="post">
	
	<table border=1 align="center">
<tr>
<th>Student ID: </th>
<td><input type="text"  name="sid"></td>
</tr>

<tr>
<th>Amount: </th>
<td><input type="text"  name="amount"></td>
</tr>



<tr>
<th>Term: </th>
<td><input type="text"  name="term"></td>
</tr>

<tr>
<th>Date of Payment: </th>
<td><input type="text"  name="py_date"></td>
</tr>


<tr>
<th>Please choose type of payment: </th>
<td><select id = "paytype" name = "pt">
<option disabled selected value> -- select an option --</option>
<option value="OnlineCredit">Online Credit Card</option>
<option value="OnlineDebit">Online Debit Card</option>
<option value="OnlineCheck">Online Check</option>
<option value="OnlineTransfer">Online Transfer</option>

</select></td>
</tr>

<tr>
<th>Card Number: </th>
<td><input type="text"  name="CardNum"></td>
</tr>




</table>

<center>
<input type="submit" value="submit">
</center>

</form>




</body>
</html>