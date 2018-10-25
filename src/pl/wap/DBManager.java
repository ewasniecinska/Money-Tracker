package pl.wap;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBManager {
	private static String _host = "db4free.net";
	private static String _port = "3306";
	private static String _user = "expenses_test_db";
	private static String _pass = "expenses_test_db";
	private static String _db = "expenses_test_db";
	
	private static Connection connection;
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		if (connection == null) {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://" + _host + ":" + _port + "/" + _db + "?useUnicode=true&character_set_server=utf8mb4";
			connection = DriverManager.getConnection(url, _user, _pass);
			
		}
		return connection;
	}
	
}
