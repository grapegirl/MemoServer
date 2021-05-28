package utils;

import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

/**
 * DB 연결 관리 유틸 클래스
 * 
 * @author grapegirl
 */
public class DBConnectionUtil {

	/** DB driver */
	private static final String DRIVER_NAME = "com.mysql.jdbc.Driver";

	/** 커넥션 */
	private static Connection mConnection = null;

	/**
	 * @Method : getConnection
	 * @Description : 커넥션 반환 메소드
	 */
	public static Connection getConnection() throws SQLException {
		try {
			Class.forName(DRIVER_NAME);
			
			String name = XMLParser.getXMLObject("dbName");
			String password = XMLParser.getXMLObject("dbPassword");
			String url = XMLParser.getXMLObject("dbUrl");
			
			
//			System.out.println("@@ getConnection() DB name : " + name);
//			System.out.println("@@ getConnection() DB password : " + password);
//			System.out.println("@@ getConnection() DB url : " + url);
			mConnection = (Connection) DriverManager.getConnection(url, name, password);
			
			
		} catch (ClassNotFoundException cnfe) {
			System.out.println("DBConnectionUtil Excetipn ClassNotFoundException Error");
		} catch (Exception e) {
			System.out.println("DBConnectionUtil Excetipn Exception Error : " + e.getMessage());
		}
		return mConnection;
	}

	/***
	 * @Method : closeConnection
	 * @Description : 커넥션 닫기 메소드
	 */
	public static void closeConnection() {
		if (mConnection != null) {
			try {
				mConnection.close();
			} catch (Exception e) {
			}
		}
	}
}