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
<title>Student Enrollment Form</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script>
        $(document).ready(function (){
            $("#cat").change(function() {
                
                	$("#gpa").hide();
                    $("#prev_deg").hide();
                    $("#eng_sc").hide();
                    $("#country").hide();
                    $("#Course_Comp").hide();
                    $("#univ_name").hide();
                if ($(this).val() == "Fir") {
                    $("#gpa").show();
                    $("#prev_deg").show();
                }
          
                
                else      if ($(this).val() == "Int") {
                	 $("#gpa").show();
                     $("#prev_deg").show();
                    $("#eng_sc").show();
                    $("#country").show();
                } 
                
                else if($(this).val() == "Trans") {
                	$("#gpa").show();
                	 $("#eng_sc").show();
                    $("#univ_name").show();
                    $("#Course_Comp").show();
                }
                
                else if( $(this).val() == "Vet") {
                	 $("#vet_stat").show();
                     
                    
                }
                else{
                	$("#gpa").hide();
                    $("#prev_deg").hide();
                    $("#eng_sc").hide();
                    $("#country").hide();
                    $("#Course_Comp").hide();
                    $("#univ_name").hide();
                }
                
                
                
                
                
                
                
                
            });
        });
    </script>

<link rel="stylesheet" href="Home.css">
</head>
<body id="stuenbody">


<div >
	 <%
	 Connect_Request cc = new Connect_Request();
Connection con= null;
PreparedStatement ps = null;
ResultSet rs=null;
String sql="select prog_id, prog_name from Programs";

try {
con = cc.getConnection();
PreparedStatement pps = con.prepareStatement(sql);
rs=pps.executeQuery(); 
%>


<h5 align="center">List of Programs</h5>
<table border=1  id = "ListofProgs" align="center">
<tr>
<th>prog_id</th>
<th>prog_name</th>
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



<form action="Student_enroll_Servlet" method="post" >

<label id="stuleg">Please fill out the details to enroll</label>

<table border=1 align="center" id="Studenroll">
<tr>
<th>Email </th>
<td><input type="text"  name="email"></td>
</tr>

<tr>
<th>First Name: </th>
<td><input type="text"  name="FN"></td>
</tr>



<tr>
<th>Last Name: </th>
<td><input type="text"  name="LN"></td>
</tr>

<tr>
<th>Date of Birth: </th>
<td><input type="text"  name="Date"></td>
</tr>


<tr>
<th>Phone Number: </th>
<td><input type="text"  name="PN"></td>
</tr>


<tr>
<th>Address: </th>
<td><input type="text"  name="add"></td>
</tr>


<tr>
<th>Gender: </th>
<td><input type="text"  name="Gen"></td>
</tr>


<tr>
<th>Student Category: </th>
<td><select id = "cat" name = "category">
<option disabled selected value> -- select an option --</option>
<option value="Fir">First-time Student</option>
<option value="Int">International Student</option>
<option value="Trans">Transfer Student</option>
<option value="Vet">Veteran Student</option>

</select></td>
</tr>

<tr>
<th>Program ID: </th>
<td><input type="text"  name="prog_id"></td>
</tr>




</table>


<center><p id="gpa"  style="display:none; align=center"> <label class="stud">Previous CGPA:</label> <input type="text"  name="gpa">
    </p></center>
    
<center><p id="prev_deg"  style="display:none; align=center"> <label class="stud"> Previous Degree:</label> <input type="text"  name="prevDeg">
    </p></center>
    
    <center><p id="eng_sc"  style="display:none; align=center"><label class="stud">English Score:</label> <input type="text"  name="eng_score">
    </p></center>
    
    <center><p id="country"  style="display:none; align=center"> <label class="stud">Country: </label><input type="text"  name="country">
    </p></center>
    
    <center><p id="Course_Comp"  style="display:none; align=center"><label class="stud">Course Completed:</label> <input type="text"  name="CourComp">
    </p></center>
    
    <center><p id="univ_name"  style="display:none; align=center"><label class="stud">University Name:</label> <input type="text"  name="univName">
    </p></center>
    
    
     <center><p id="vet_stat" style="display:none; align=center"><label class="stud">Veteran Status:</label> <input type="text"  name="vetstat">
    </p></center>
    
    
    
    
<center>
<input type="submit" value="submit">
</center>

</form>



</body>
</html>