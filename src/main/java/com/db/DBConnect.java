package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	
	private static final String DB_NAME = "shoes_store";
	
	private static final String USERNAME = "NDD";
	private static final String PASSWORD = "123";
	
	private static Connection connection;
	
	public static Connection getConn() {
		try {
			DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
			
			String dbURL = "jdbc:sqlserver://localhost:1433;DatabaseName=" + DB_NAME + ";encrypt=true;trustServerCertificate=true";
			
			connection = DriverManager.getConnection(dbURL, USERNAME, PASSWORD);
			
			return connection;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
