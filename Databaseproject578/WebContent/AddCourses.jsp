<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add a credit Course to the catalog</title>
</head>
<body>

<form method="POST" action="Addcourses">


<label id="AddCC">Please fill out the details to Add a course to the catalog</label>

<table border=1 align="center" id="AddCreditCourse">

<tr>
<th>Type of Course: </th>
<td><select id = "Typeofcourse" name = "ccnc">
<option disabled selected value> -- select an option --</option>
<option value="cc">Credit Based Course</option>
<option value="Ncc">Non Credit Based Course</option>

</select></td>
</tr>

<tr>
<th> Course ID: </th>
<td><input type="text"  name="cid"></td>
</tr>

<tr>
<th>Title: </th>
<td><input type="text"  name="title"></td>
</tr>



<tr>
<th>Description: </th>
<td><input type="text"  name="desc"></td>
</tr>


<tr>
<th>term: </th>
<td><input type="text"  name="term"></td>
</tr>

<tr>
<th>Program ID: </th>
<td><input type="text"  name="prog_id"></td>
</tr>


<tr>
<th>Faculty ID: </th>
<td><input type="text"  name="fac_id"></td>
</tr>

<tr>
<th>Cost: </th>
<td><input type="text"  name="cost"></td>
</tr>


<tr>
<th>Credits: </th>
<td><input type="text"  name="credits"></td>
</tr>





</table>




<center>
<input type="submit" value="Submit">
</center>



</form>
</body>
</html>