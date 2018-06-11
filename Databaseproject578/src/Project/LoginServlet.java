package Project;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	 RequestDispatcher rd1;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    public static String login_authentication(Connection con,String un,String password) {

   	 String sql=
   				"select ID from Users where email = '"+un+"' ";
   	PreparedStatement ps;
   	
   	
     if(un.endsWith("princegeorge.edu"))
     {
			try {
					ps = con.prepareStatement(sql);
					ResultSet rs = ps.executeQuery();
					rs.beforeFirst();
					rs.next(); 
				 	
						if(rs.getString(1) != null) {
							
					if(un.endsWith("@students.princegeorge.edu")&&password.equals("student123"))	{
									    return "Valid Student";	
									    } 
					else if(un.endsWith("@admin.princegeorge.edu")&&password.equals("admin123")){
						return "Valid Admin";
							}
					else {
										if(password.equals("faculty123"))
											return "Valid Faculty";
										else 
											return "Invalid UserName/Password";
									}	
								} // 
						
						
						else{
											return "Invalid UserName/Password";
										}
						
						
					
					 
					} // try statement
			catch (SQLException e) {
					// TODO Auto-generated catch block
					
					 e.printStackTrace();
				System.out.println("ERROR HERE");
				return "Invalid UserName/Password";
				
				 }
     } // main email check
     
     
     else
    	 return "Invalid UserName/Password";
    	 
     }


 /**
  * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
  */
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  
	 
	 try {
  
  Connection con=null;
  Connect_Request cc = new Connect_Request();
  con = cc.getConnection();
     PreparedStatement ps;
     
    
     PrintWriter out=response.getWriter();
     response.setContentType("text/html");
     String username= request.getParameter("username").toString();
     String password= request.getParameter("passsword").toString();
      String x=login_authentication(con,username,password);
      
      
      if(x.equals("Invalid UserName/Password")){
       System.out.println("Not Logged in");
       out.println("You are not Logged in");
       rd1 = request.getRequestDispatcher("/Home.jsp");
          rd1.forward(request, response);
        }
      
      
      else{
    	  if(x.equals("Valid Student")){
    	       HttpSession lsession = request.getSession();
    	       lsession.setAttribute("id",x );

    	       out.println("Successfully Logged in");
    	       
    	      rd1 = request.getRequestDispatcher("/Student.jsp");
    	      rd1.forward(request, response);
    		  
    	  }
    	  else if(x.equals("Valid Faculty")){
    	       HttpSession lsession = request.getSession();
    	       lsession.setAttribute("id",x );

    	       out.println("Successfully Logged in");
    	       
    	       
    	      rd1 = request.getRequestDispatcher("/Faculty.jsp");
    	      rd1.forward(request, response);
    		  
    	  }
    	  else if(x.equals("Valid Admin")){
   	       HttpSession lsession = request.getSession();
   	       lsession.setAttribute("id",x );

   	       out.println("Successfully Logged in");
   	      rd1 = request.getRequestDispatcher("/Admin.jsp");
   	      rd1.forward(request, response);
   		  
   	  }
      
      }
      
  }
catch(Exception e)
 {
e.printStackTrace();
 System.out.println("HERE EXCEPTION");

 }
}


}