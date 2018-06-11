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
 * Servlet implementation class Credit_Course_Register
 */
@WebServlet("/Credit_Course_Register")
public class Credit_Course_Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Credit_Course_Register() {
        super();
        // TODO Auto-generated constructor 
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String temp1,temp2,term;
		
		int sid,cid =0;
		
		temp1=request.getParameter("sid").toString();
		temp2=request.getParameter("cid").toString();
		term = request.getParameter("term").toString();
		
		PrintWriter out= response.getWriter();
		response.setContentType("text/html");
		
		sid = Integer.parseInt(temp1);
		cid = Integer.parseInt(temp2);
		
		try {
			Connect_Request cr = new Connect_Request();
			Connection con = cr.getConnection();
				
				String sql=
	"insert into Student_Register (sid,cid,term) values('"+sid+"','"+cid+"','"+term+"')";
				PreparedStatement ps=con.prepareStatement(sql);
				ps.executeUpdate(sql);
				
				if(!out.checkError()) {
					out.println("<meta http-equiv='refresh' content='5;URL= Courses.jsp'>");//redirects after 5 seconds
					   out.println("<p style='color:Green;'>Data Inserted Successfully !</p>");
				} else {
					out.println("<meta http-equiv='refresh' content='5;URL= Courses.jsp'>");//redirects after 5 seconds
					   out.println("<p style='color:Green;'>Couldn't register for course !</p>");
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
