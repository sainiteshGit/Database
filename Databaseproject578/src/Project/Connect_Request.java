package Project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect_Request {
	
	public 	Connection getConnection() throws InstantiationException, IllegalAccessException {
		Connection c=null;	
		
		
		try {
			Object newInstance;
	        newInstance = Class.forName("com.mysql.jdbc.Driver").newInstance();
	        c = DriverManager.getConnection("jdbc:mysql://triton.towson.edu:3360/aadira1db", "aadira1", "Cosc*yx2r");// Please use your database name here
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return c;
		}

		

}
