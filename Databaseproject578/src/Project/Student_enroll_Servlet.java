package Project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Student_enroll_Servlet
 */
@WebServlet("/Student_enroll_Servlet")
public class Student_enroll_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static int first =0;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Student_enroll_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @param con
     * @param email
     * @param fname
     * @param lname
     * @param dOB
     * @param address
     * @param gender
     * @param gpa
     * @param prev_deg
     * @throws InstantiationException
     * @throws IllegalAccessException
     */
    private void first_student(Connection con,int sid,String email, String fname, String lname, String dOB, String address, String gender
    		,double gpa,String prev_deg, int prog_id) throws InstantiationException, IllegalAccessException {
    	
    	
    		try {
    	
    				String sql=
    	"insert into first_student (ssid,email,fname,lname,DOB,address,Gender,gpa,prevs_degree,prog_id)"
    	+ " values('"+sid+"','"+email+"','"+fname+"','"+lname+"','"+dOB+"','"+address+"','"+gender+"','"+gpa+"','"+prev_deg+"','"+prog_id+"')";
    				PreparedStatement ps=con.prepareStatement(sql);
    				ps.executeUpdate(sql);
    				
    				System.out.println("Data first Inserted successfully");
    				
    			} catch (SQLException e) {
    			e.printStackTrace();
    			}
    			
    		
    	}
	
    private void international_student(Connection con,int sid, String email, String fname, String lname, String dOB,
			String address, String gender, double gpa, String prev_deg, double eng_score, String country, int prog_id) {
		
    	try {
        	
			String sql=
"insert into int_student (isid,email,fname,lname,DOB,address,Gender,gpa,prevs_degree,country,english_score,prog_id)"
+ " values('"+sid+"','"+email+"','"+fname+"','"+lname+"','"+dOB+"','"+address+"','"+gender+"','"+gpa+"','"+prev_deg+"', '"+country+"','"+eng_score+"','"+prog_id+"')";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.executeUpdate(sql);
			
			System.out.println("Data INTL Inserted successfully");
			
		} catch (SQLException e) {
		e.printStackTrace();
		}
    	
		
	}
	
    private void Transfer_student(Connection con,int sid, String email, String fname, String lname, String dOB, String address,
			String gender, double gpa, String prev_deg, double eng_score, String course_comp, String uni_name,int prog_id) {
		
    	

    	try {
        	
			String sql=
"insert into trans_student (tsid,email,fname,lname,DOB,"
+ "address,Gender,gpa,courses_completed,univ_name,english_score,prog_id)"
+ " values('"+sid+"','"+email+"','"+fname+"','"+lname+"','"+dOB+"','"+address+"','"+gender+"','"+gpa+"', '"+course_comp+"','"+uni_name+"','"+eng_score+"','"+prog_id+"')";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.executeUpdate(sql);
			
			System.out.println("Data  Transfer Inserted successfully");
			
		} catch (SQLException e) {
		e.printStackTrace();
		}
	}
    
    private void Veteran_student(Connection con,int sid, String email, String fname, String lname, String dOB, String address,
			String gender,String vetstat, int prog_id) {
		
try {
        	
			String sql=
"insert into veteran_student (vsid,email,fname,lname,DOB,"
+ "address,Gender,vetarn_status, prog_id)"
+ " values('"+sid+"','"+email+"','"+fname+"','"+lname+"','"+dOB+"','"+address+"','"+gender+"','"+vetstat+"','"+prog_id+"' )";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.executeUpdate(sql);
			
			System.out.println("Data Veteran Inserted successfully");
			
		} catch (SQLException e) {
		e.printStackTrace();
		}
		
	}
    
    
    
    
    /**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	
			
			PrintWriter out= response.getWriter();
			response.setContentType("text/html");
			
			String email=null,fname=null, lname=null,DOB=null, address=null,Gender=null, category=null;
			double gpa=0.0,eng_score=0.0;
			int prog_id = 0;
			String prev_deg=null,country=null,course_comp=null,uni_name=null,vetstat=null;
			String temp1=null,temp2=null,temp3;
			
			email=request.getParameter("email").toString();
			fname=request.getParameter("FN").toString();
			lname=request.getParameter("LN").toString();
			DOB = request.getParameter("Date").toString();
			address = request.getParameter("add").toString();
			Gender=request.getParameter("Gen").toString();//Generic student until here
			
			//Program Id
			temp3 = request.getParameter("prog_id").toString();
					prog_id = Integer.parseInt(temp3);
			
		// Category of student	
			category=request.getParameter("category").toString();
			
			
			
			try {
			Connect_Request cr = new Connect_Request();
			Connection con = cr.getConnection();
				
				String sql=
	"insert into student (email,fname,lname,DOB,address,Gender,prog_id) values('"+email+"','"+fname+"','"+lname+"','"+DOB+"','"+address+"','"+Gender+"','"+prog_id+"')";
				PreparedStatement ps=con.prepareStatement(sql);
				ps.executeUpdate(sql);
				
			
				String query="select sid from student  where email=?";
				
			     PreparedStatement pps = con.prepareStatement(query);
			     pps.setString(1, email);
			      ResultSet rs=pps.executeQuery();
			
			      rs.beforeFirst();
			      int sid =0;
			      while(rs.next()) {
			       sid = Integer.parseInt(rs.getString("sid"));
			      }
			      
				if(category.equals("Fir")) {
				
					 temp1=request.getParameter("gpa").toString();
					gpa = Double.parseDouble(temp1);
					
					//Degree as string
				 prev_deg=request.getParameter("prevDeg").toString();
					
					//English score as decimal
					
					
					first_student(con,sid,email,fname,lname,DOB,address,Gender,gpa,prev_deg,prog_id);
				} 
				
				else if(category.equals("Int")) {

				 temp1=request.getParameter("gpa").toString();
					gpa = Double.parseDouble(temp1);
					
					//Degree as string
					prev_deg=request.getParameter("prevDeg").toString();
					
					//English score as decimal
					
				 temp2 = request.getParameter("eng_score").toString();
					eng_score = Double.parseDouble(temp2);
					

					//Country as string
					country = request.getParameter("country").toString();
					
								
					international_student(con,sid,email,fname,lname,DOB,address,Gender,gpa,prev_deg, eng_score, country, prog_id);
					
				} 
				
				else if(category.equals("Trans")) {
					
				 temp1=request.getParameter("gpa").toString();
					gpa = Double.parseDouble(temp1);
					
					//Degree as string
					prev_deg=request.getParameter("prevDeg").toString();
					
					//English score as decimal
					
				 temp2 = request.getParameter("eng_score").toString();
					eng_score = Double.parseDouble(temp2);
					
					//courses completed
					course_comp = request.getParameter("CourComp").toString();
					
					//University name
					uni_name = request.getParameter("univName").toString();
					
					
					
					Transfer_student(con,sid, email,fname,lname,DOB,address,Gender,gpa,prev_deg,eng_score, course_comp,uni_name,prog_id);
				} 
				
				else {
					
					//Veteran status
					vetstat = request.getParameter("vetstat").toString();
					
					
					Veteran_student(con,sid,email,fname,lname,DOB,address,Gender,vetstat, prog_id);
				}
				out.println("Data Inserted successfully");
				
			} catch (SQLException e) {
			e.printStackTrace();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
			if(out.checkError()==false)
			{
				out.println(" <input type=\"button\"  value=\"Check Out Courses\"  onClick=\"window.location.href('Courses.jsp')\"> ");
			}
	}
		
}		



