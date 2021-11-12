package meet.util.db;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*
@Author:Surendra Kumar Sao

	>>Software Architect and Corporate Trainer
	>>+9 year exp in (mumbai,pune,hyd,bangaluru)
	>>Java Certified SCJP & SCWCD with 98%
	Trained more than 5k students and employees.
    MCA from (NIT)National Institute of Technology Raipur(C.G.)
	Email : sur.nit.mca@gmail.com
	Mobile 7987234544, 9009442844
	https://www.urbanpro.com/raipur/surendra-kumar-sao/reviews/7223178
	https://www.urbanpro.com/raipur/surendra-kumar-sao/1334109?_tp=
 
   CurrentYear 2019 
 */

public class SisDbConnectionUtil {
    //load driver
	private final static String DRIVER_CLASS="oracle.jdbc.driver.OracleDriver";
	private final static String URL ="jdbc:oracle:thin:@localhost:1521:XE";
	private final static String USER ="system";
	private final static String PASSWORD ="root";
	private static boolean  isDriverLoaded=false;
	
	static {
		try {
			Class.forName(DRIVER_CLASS);
			System.out.println("driver loaded");
			isDriverLoaded=true;
		} catch (ClassNotFoundException e) {
			System.out.println("ERROR : driver Class Not Found " + DRIVER_CLASS);
			e.printStackTrace();
		}
		
	}//end static block
	  
	
	public static Connection getConnection() throws SQLException{
		Connection con = null;
		 if(isDriverLoaded) {
			 con  = DriverManager.getConnection(URL,USER,PASSWORD);
		 }
	return con;
	}
	
	//close connection
	
	public static void closeConnection(Connection con) throws SQLException {
		
		if(con!=null) {
			con.close();
		}
		
	}
	
}
