import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseDAO {
	public Connection open() {
		try {
			// load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");
			// link to a connection user/password/host/dbName
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/another", 
					"username", "password");
			return conn;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public void close(Connection conn) {
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
