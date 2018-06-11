package Project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    
    private String[] validateminmCourses(String stud_id, String term) {
		// TODO Auto-generated method stub
    	
    	
    	String findStu="select fname from int_student  where isid = '"+stud_id+"'  ";
    	
    	int count_of_courses = 0;
    	
    	String type_stu = "Non_Int";
    	
    	String int_status = "Invalid";
    	
    	String fname = null;
    	
    	
    	try {
			Connect_Request cr = new Connect_Request();
			Connection con = cr.getConnection();
				
				PreparedStatement ps=con.prepareStatement(findStu);
				ResultSet rs = ps.executeQuery(findStu);
				
				rs.beforeFirst();
				while(rs.next()) {
					
					 fname =  rs.getString(1);
					 
					
				}
				
				if(fname !=null) {
					
					type_stu = "Int";
					
					String sql = "select count(sr.cid) as total_courses from Student_Register sr, int_student i"

 + "where i.isid = '"+stud_id+"' AND i.isid = sr.sid AND sr.term = '"+term+"';" ;
					
					
					ResultSet rs1 = ps.executeQuery(sql);
					rs1.beforeFirst();
					
					while(rs1.next()) {
						
						
						count_of_courses  = Integer.parseInt(rs1.getString(1));
					}
					
					
					if(count_of_courses >= 3)
						int_status = "Valid";
					
					
						
					
				}// first name not null 
					
					
			      
								
			} catch (SQLException e) {
			e.printStackTrace();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	
    	
    	
    	
    	
    	String[] stat = {null, null};
		stat[0] = type_stu;
		stat[1] = int_status;
		
		return stat;
	}
    
    
    private String validatePayment(String stud_id, String amt, String term) {
		// TODO Auto-generated method stub
	
    	String sql="select sum(cc.cost) from Student_Register sr, credit_course cc where " +
"sr.sid = '"+stud_id+"' AND sr.term = '"+term+"'   AND sr.cid = cc.cid AND sr.term = cc.term";
    	float t1 = 0;
    	
    	String decision = "Invalid";
    	
    	
    	try {
			Connect_Request cr = new Connect_Request();
			Connection con = cr.getConnection();
				
				PreparedStatement ps=con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery(sql);
				
				rs.beforeFirst();
				while(rs.next()) {
					
					 t1 =  Float.parseFloat(rs.getString(1));
					 
					
				}
				
				int stu_payd_amnt = Integer.parseInt(amt);
				
				int actl_halfamnt = (int) t1;
				
				if(stu_payd_amnt >= (  actl_halfamnt /2))
					decision ="Valid";
					
			      
								
			} catch (SQLException e) {
			e.printStackTrace();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	
    	return decision;
		

	}
    
    
    
    private String insert_to_database( HttpServletResponse response, String stud_id, String amount, String term, String pay_date, String type,
			String CardNum) throws IOException {
		// TODO Auto-generated method stub
    	
    	String status_insert = "UnSuccessful";
    	
    	PrintWriter out= response.getWriter();
		response.setContentType("text/html");
		
    	try {
    		Connect_Request cr = new Connect_Request();
    		Connection con = cr.getConnection();
    			
    			String sql=
    "insert into payment (stud_id,amount,term,pay_date,type,CardNum) values('"+stud_id+"','"+amount+"','"+term+"','"+pay_date+"','"+type+"','"+CardNum+"')";
    			PreparedStatement ps=con.prepareStatement(sql);
    			ps.executeUpdate(sql);
    			
    		    if(!out.checkError()) {
    			
    			status_insert = "Successful";
    		    }
    			
    		} catch (SQLException e) {
    		e.printStackTrace();
    		} catch (InstantiationException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		} catch (IllegalAccessException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}		
    		
    		
    		
    		return status_insert;

	}
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stu
		
		PrintWriter out= response.getWriter();
		response.setContentType("text/html");
		
		String stud_id,amount, term,pay_date, type,CardNum;
		
	
		stud_id=request.getParameter("sid").toString();
		amount=request.getParameter("amount").toString();
		term=request.getParameter("term").toString();
		pay_date = request.getParameter("py_date").toString();
		type = request.getParameter("pt").toString();
		CardNum = request.getParameter("CardNum").toString();
		
		
		// Validate whether the student is international or not
		String[] dec = validateminmCourses(stud_id, term);
		
		if(dec[0].equals("Int") ) {
			
			if(dec[1].equals("Valid")) {
				
			
		// Validate the payment made by the student
		String decision= validatePayment(stud_id, amount,term);
		
		if(decision.equals("Valid")) {
			
		String status = insert_to_database(response,stud_id,amount,term,pay_date,type,CardNum);
		
			if(status.equals("Successful")) {
				out.println("<meta http-equiv='refresh' content='5;URL= Student.jsp'>");//redirects after 5 seconds
			   out.println("<p style='color:Green;'>Payment made Successfully !</p>");
			}
			
			else {
				out.println(" Sorry, payment was un successfull! ");
			}
				
		
		} // Decision of valid payment
		
		else {
			
			out.println("<meta http-equiv='refresh' content='5;URL= Payment.jsp'>");//redirects after 5 seconds
			   out.println("<p style='color:red;'>Sorry, You seemed to entered less amount, please enter atleast half of your total courses cost !</p>");
			
		}
			}// Valid International student
			else {
				out.println("<meta http-equiv='refresh' content='5;URL= Student.jsp'>");//redirects after 5 seconds
				   out.println("<p style='color:red;'>As an international student, you have to register for atleast 3 courses in a semester! </p>");
				
			}
		} // International Student
		
		
		
		// Non-International
		else if(dec[0].equals("Non_Int")){
			
			
			
			// Validate the payment made by the student
			String decision= validatePayment(stud_id, amount,term);
			
			if(decision.equals("Valid")) {
				
				String status = insert_to_database(response,stud_id,amount,term,pay_date,type,CardNum);
				
				if(status.equals("Successful")) {
					out.println("<meta http-equiv='refresh' content='5;URL= Student.jsp'>");//redirects after 5 seconds
				   out.println("<p style='color:Green;'>Data Inserted Successfully !</p>");
				}
				
				else {
					out.println(" Insert un successfull ");
				}
			
					
			
			} // Decision of valid payment
			
			else {
				
				out.println("<meta http-equiv='refresh' content='5;URL= Payment.jsp'>");//redirects after 5 seconds
				   out.println("<p style='color:red;'>Sorry, You seemed to entered less amount, please enter atleast half of your total courses cost !</p>");
				
			}
		
			
		}
		
		
		else {
			out.println(" Not a valid Student ID");
		}
		
		
		
		
		
		
	}


	

	

}
