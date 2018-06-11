package Project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Addcourses
 */
@WebServlet("/Addcourses")
public class Addcourses extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addcourses() {
        super();
        // TODO Auto-generated constructor stub
    }

    private void addCreditCourse(HttpServletResponse response, int cid, String title, String term, int prog_id, int fac_id, String cost,
			int credits, String Desc) throws IOException {
		// TODO Auto-generated method stub
    	
    	PrintWriter out= response.getWriter();
		response.setContentType("text/html");
    	try {
    		Connect_Request cr = new Connect_Request();
    		Connection con = cr.getConnection();
    			
    String insert_c = "insert into Courses(cid,title,Descrip,Term,fac_id,prog_id) values('"+cid+"', '"+title+"','"+Desc+"','"+term+"','"+fac_id+"','"+prog_id+"')";
    		
    		
    		PreparedStatement i_c=con.prepareStatement(insert_c);
			i_c.executeUpdate(insert_c);
			
    		if(!out.checkError()) {
    			
    		
    		String insert_cc=
    "insert into credit_course (cid,title,term,prog_id,fac_id,cost, credits) values('"+cid+"','"+title+"','"+term+"','"+prog_id+"','"+fac_id+"',   '"+cost+"',   '"+credits+"')";
    			
    			
    			
    			PreparedStatement i_cc=con.prepareStatement(insert_cc);
    			i_cc.executeUpdate(insert_cc);
    			
    		    if(!out.checkError()) {
    			
    		    	out.println("<meta http-equiv='refresh' content='5;URL= Admin.jsp'>");//redirects after 5 seconds
    				   out.println("<p style='color:Green;'> Credit Course added Successfully !</p>");
    		    } else {
    		    	out.println("<meta http-equiv='refresh' content='5;URL= Addcourses.jsp'>");//redirects after 5 seconds
 				   out.println("<p style='color:red;'> Credit Course Wasn't added !</p>");
    		    } // Insert in to credit courses
    		
    		    
    	}// Insert in to courses  
    		
    		else {
    			
    			out.println("<meta http-equiv='refresh' content='5;URL= Addcourses.jsp'>");//redirects after 5 seconds
				   out.println("<p style='color:red;'> Credit Course Wasn't added !</p>");
    			
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

		
	}


    
    
    private void addNonCreditCourse(HttpServletResponse response, int cid, String title, String term, int prog_id,
			int fac_id, String cost, String Desc) throws IOException {
		// TODO Auto-generated method stub
    	
    	
    	PrintWriter out= response.getWriter();
		response.setContentType("text/html");
    	try {
    		Connect_Request cr = new Connect_Request();
    		Connection con = cr.getConnection();
    			
    		
    		
    		String insert_c = "insert into Courses (cid,title,Descrip,Term,fac_id,prog_id) values ('"+cid+"','"+title+"','"+Desc+"','"+term+"','"+fac_id+"','"+prog_id+"')";
    		
    		PreparedStatement i_c=con.prepareStatement(insert_c);
			i_c.executeUpdate(insert_c);
    		
    		
			if(! out.checkError()) {
				
			
    			String sql=
    "insert into noncredit_course (cid,title,term,prog_id,fac_id,cost) values('"+cid+"','"+title+"','"+term+"','"+prog_id+"','"+fac_id+"',   '"+cost+"')";
    			
    			
    			
    			PreparedStatement ps=con.prepareStatement(sql);
    			ps.executeUpdate(sql);
    			
    			
    		    if(!out.checkError()) {
    			
    		    	out.println("<meta http-equiv='refresh' content='5;URL= Admin.jsp'>");//redirects after 5 seconds
    				   out.println("<p style='color:Green;'> Non Credit Course added Successfully !</p>");
    		    } else {
    		    	out.println("<meta http-equiv='refresh' content='5;URL= Addcourses.jsp'>");//redirects after 5 seconds
 				   out.println("<p style='color:red;'> Course Wasn't added !</p>");
    		    }// Insert non credit courses
    		    
    		    
			}// Insert Courses
			
			else {
				out.println("<meta http-equiv='refresh' content='5;URL= Addcourses.jsp'>");//redirects after 5 seconds
				   out.println("<p style='color:red;'> Course Wasn't added !</p>");
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

    	
    	
		
	}
    
    
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		int cid,prog_id,fac_id, credits;
		String title,term,cost, type_of_course, Desc;
		
		
		type_of_course = request.getParameter("ccnc").toString();
		
		
		if(type_of_course.equals("cc")) {
			
			cid = Integer.parseInt(request.getParameter("cid"));
			
			title = request.getParameter("title");
			
			Desc = request.getParameter("desc").toString();
			
			term = request.getParameter("term").toString();
			
			prog_id = Integer.parseInt(request.getParameter("prog_id").toString());
			
			
			cost = request.getParameter("cost").toString();
			
			fac_id= Integer.parseInt(request.getParameter("fac_id").toString());
			
			credits= Integer.parseInt(request.getParameter("credits").toString());
			
			
			
			addCreditCourse(response,cid,title,term,prog_id,fac_id,cost,credits,Desc);
			
		} else {
							cid = Integer.parseInt(request.getParameter("cid"));
							
							title = request.getParameter("title");
							
							Desc = request.getParameter("desc").toString();
							
							term = request.getParameter("term").toString();
							
							prog_id = Integer.parseInt(request.getParameter("prog_id").toString());
							
							
							cost = request.getParameter("cost").toString();
							
							fac_id= Integer.parseInt(request.getParameter("fac_id").toString());
							
							
							
							addNonCreditCourse(response,cid,title,term,prog_id,fac_id,cost,Desc);
			
		}
		
	
		
    	
	
	}

	



	

}
