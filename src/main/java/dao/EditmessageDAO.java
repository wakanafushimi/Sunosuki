package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class EditmessageDAO {
	private final String JDBC_URL="jdbc:mysql://localhost:3306/sunosuki";
	private final String DB_USER="root";
	private final String DB_PASS="";
	
	public void editmessage(int sessionid,String message) {
		try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	    } catch (ClassNotFoundException e) {
	        throw new IllegalStateException("JDBCドライバを読み込めませんでした");
	    }
		
		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
	        conn.setAutoCommit(true);
	       
        	String sql = "update session set message=? where sessionId=?;";
        	PreparedStatement stmt = conn.prepareStatement(sql);
        	stmt.setString(1,message);
        	stmt.setInt(2,sessionid);
        	stmt.executeUpdate();
	        
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("EditmessageDAOのエラー");
			System.out.println("エラー1"+e.getMessage());
			System.out.println("SQL State: " + e.getSQLState());
		    System.out.println("Vendor Error Code: " + e.getErrorCode());
			
		}
	}
}

