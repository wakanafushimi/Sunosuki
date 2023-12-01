package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.LoginModel;
import model.SessionModel;

public class SessionDAO {
	private final String JDBC_URL="jdbc:mysql://localhost:3306/sunosuki";
	private final String DB_USER="root";
	private final String DB_PASS="";
	
	public void setSession(SessionModel sessionModel,LoginModel loginModel) {
		try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	    } catch (ClassNotFoundException e) {
	        throw new IllegalStateException("JDBCドライバを読み込めませんでした");
	    }
		
		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
	        conn.setAutoCommit(true);
        	String sql = "insert into session values (null,?,?,?,?);";
        	PreparedStatement stmt = conn.prepareStatement(sql);
//        	System.out.println(sessionModel.getDate()+sessionModel.getLocation()+sessionModel.getMessage());
        	stmt.setString(1,loginModel.getId());
        	stmt.setString(2,sessionModel.getDate());
        	stmt.setString(3,sessionModel.getLocation());
        	stmt.setString(4,sessionModel.getMessage());
        	stmt.executeUpdate();
	       
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			System.out.println("SQL State: " + e.getSQLState());
		    System.out.println("Vendor Error Code: " + e.getErrorCode());
			
		}
	}
}
