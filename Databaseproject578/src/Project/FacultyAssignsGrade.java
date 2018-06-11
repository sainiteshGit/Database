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
 * Servlet implementation class FacultyAssignsGrade
 */
@WebServlet("/FacultyAssignsGrade")
public class FacultyAssignsGrade extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FacultyAssignsGrade() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int sid = 0;
		String cid,term,grade,act;
		
		sid = Integer.parseInt(request.getParameter("sid"));
		cid = request.getParameter("cid").toString();
		term = request.getParameter("term").toString();
		grade = request.getParameter("grade").toString();
		
		act = request.getParameter("action").toString();
		
		String sql = "";
		
		PrintWriter out= response.getWriter();
		response.setContentType("text/html");
		
		
		try {
			Connect_Request cr = new Connect_Request();
			Connection con = cr.getConnection();
				
			if(act.equals("Ass")) {
				
				 sql = "UPDATE Student_Register  SET grade = '"+grade+"' where sid = '"+sid+"' AND cid = '"+cid+"' AND term = '"+term+"' ";
									
				
			} else  {
				
			sql = "delete from Student_Register where sid = '"+sid+"' AND cid = '"+cid+"' AND term = '"+term+"' ";
				
			}
				PreparedStatement ps=con.prepareStatement(sql);
				ps.executeUpdate(sql);
				
				if(!out.checkError()) {
	
					out.println("<meta http-equiv='refresh' content='5;URL= Faculty.jsp'>");//redirects after 5 seconds
					   out.println("<p style='color:Green;'> Update Successfully !</p>");
				}
				else {
					out.println("<meta http-equiv='refresh' content='5;URL= FacAssign.jsp.jsp'>");//redirects after 5 seconds
					   out.println("<p style='color:Green;'>Sorry we couldn't assign the grade !</p>");
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

}
