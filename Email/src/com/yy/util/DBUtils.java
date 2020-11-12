package com.yy.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class DBUtils {
	private static String driver = null;
	private static String url = null;
	private static String userName = null;
	private static String password = null;
	
	static {
		InputStream ins = DBUtils.class.getResourceAsStream("/db/properties");
		Properties props = new Properties();
		try {
			props.load(ins);
			driver = props.getProperty("mysql.driver");
			url = props.getProperty("mysql.url");
			userName = props.getProperty("mysql.userName");
			password = props.getProperty("mysql.password");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConn() throws SQLException {
		return DriverManager.getConnection(url, userName, password);
	}
	
	public static void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
}
