package cn.edu.zhku.DB;

import java.sql.*;


public class DB {

	public static Connection DBConn() throws ClassNotFoundException,
	SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		
		// ��ȡ���ݿ�����
		Connection conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/maiya", "root", "root");
		return conn;
	}
	
	public static void close(Connection conn) throws SQLException {
		if (conn != null) {
			conn.close();
		
		}
	}
}
