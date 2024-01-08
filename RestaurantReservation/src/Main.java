import java.sql.*;
import java.util.Scanner;

public class Main {
	
	public static Connection init() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		//Create Connection
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/restomanagement","root","");
			if(conn != null) {
				System.out.println("connection established");
				return conn;
			}else {
				System.out.println("cannot connect");
			}
		}catch(Exception e) {
			
		}
		return null;
	};

	public static void main(String[] args) {
		

	}

}
