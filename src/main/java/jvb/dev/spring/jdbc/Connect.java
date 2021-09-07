package jvb.dev.spring.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connect {
	private static Connection connection = null;

    public static Connection getConnection() {
    	try {
    		Class.forName("com.mysql.jdbc.Driver");
    		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_spring_web", "root", "");
		} catch (Exception e) {
			System.out.println(e);
		}
    	return connection;
        
    }
}
