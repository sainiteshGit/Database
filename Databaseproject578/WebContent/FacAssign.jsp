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
<title>Faculty Details</title>
</head>
<body>

<div id="FacultyTeaches">
	 <%
	 Connect_Request cc = new Connect_Request();
Connection con= null;
PreparedStatement ps = null;
ResultSet rs=null;
int fac_id = Integer.parseInt(request.getParameter("fac_id"));
String term = request.getParameter("term").toString();

String sql="select sr.sid,sr.cid from Student_Register sr, credit_course cc where cc.fac_id = '"+fac_id+"' AND cc.term = '"+term+"' AND sr.cid = cc.cid AND sr.term = cc.term";

try {
con = cc.getConnection();
PreparedStatement pps = con.prepareStatement(sql);
rs=pps.executeQuery(); 
%>


<h5>List of Courses you're teaching this semester</h5>
<table border=1>
<tr>
<th>sr.sid</th>
<th>sr.cid</th>
</tr>
<% 
rs.beforeFirst();
while(rs.next()){ %>
<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
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


<form action="FacultyAssignsGrade" method="post">
<fieldset>Assign Grade</fieldset>
<table align="center" border=1>


<tr>

<th>Choose your action: </th>
<td><select id = "act" name = "action">
<option disabled selected value> -- select an option --</option>
<option value="Ass">Assign Grade</option>
<option value="Rem">Remove Student</option>
</select></td>
</tr>

<tr>
<th>Student ID:</th>
<td><input type="text" name="sid"></td>
</tr>


<tr>
<th>Course ID:</th>
<td><input type="text" name="cid"></td>
</tr>


<tr>
<th>Term:</th>
<td><input type="text" name="term"></td>
</tr>


<tr>
<th>Grade:</th>
<td><input type="text" name="grade"></td>
</tr>
</table>

<center>
<input type="submit" value="submit">
</center>
</form>

</body>
</html>