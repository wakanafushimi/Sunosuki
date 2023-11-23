package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import model.ForCoachModel;

public class ForCoachDAO {
	private final String JDBC_URL="jdbc:mysql://localhost:3306/sunosuki";
	private final String DB_USER="root";
	private final String DB_PASS="";
	
	public ForCoachModel getCoaches(ForCoachModel forCoachModel) {
		try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	    } catch (ClassNotFoundException e) {
	        throw new IllegalStateException("JDBCドライバを読み込めませんでした");
	    }
		
		List<String> coaches=forCoachModel.getCoachesList();
		
		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
	        conn.setAutoCommit(true);
        	String sql = "select id from trick_a where trick = ?;";
        	PreparedStatement stmt = conn.prepareStatement(sql);
        	stmt.setString(1, forCoachModel.getTrick());
	        ResultSet rs=stmt.executeQuery();
	        
	        while(rs.next()) {
	        	coaches.add(rs.getString(1));
	        }
	        
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("エラー1"+e.getMessage());
			System.out.println("SQL State: " + e.getSQLState());
		    System.out.println("Vendor Error Code: " + e.getErrorCode());
			
		}
		
		forCoachModel.setCoachesList(coaches);
		return forCoachModel;		
	}
		
}
