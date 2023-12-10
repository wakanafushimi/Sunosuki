package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.ForSessionModel;

public class ForSessionDAO {
	private final String JDBC_URL="jdbc:mysql://localhost:3306/sunosuki";
	private final String DB_USER="root";
	private final String DB_PASS="";
	
	public ForSessionModel getSessionList(ForSessionModel forSessionModel) {
		try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	    } catch (ClassNotFoundException e) {
	        throw new IllegalStateException("JDBCドライバを読み込めませんでした");
	    }
		
		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
	        conn.setAutoCommit(true);
	        
	        //入力した日付に合致したsessionのsessionidをsessionArrayに入れる
        	String sql = "select sessionId from session where date = ?;";
        	PreparedStatement stmt = conn.prepareStatement(sql);
        	stmt.setString(1, forSessionModel.getDate());
	        ResultSet rs=stmt.executeQuery();
	        
	        List<String> spesessionidList=forSessionModel.getSpesessionidList();
	        
	        while(rs.next()) {
	        	spesessionidList.add(rs.getString("sessionId"));
//	        	System.out.println(rs.getString("sessionId")); //チェック用
	        }
	        
//	        for(String session:sessionList) {
////	        	System.out.println(session); //チェック用
//	        }
	        
	        forSessionModel.setSpesessionidList(spesessionidList);
//	        System.out.println(sessionList.size());	//チェック用
	        
	        
	        //わざわざListを配列にしてる
//	        String[] sessionArray=new String[sessionList.size()];
//	        if(sessionList!=null) {
////		        System.out.println(sessionArray.length); //チェック用
//		        
//		        int i=0;
//		        for(String values:sessionList) {
//		        	sessionArray[i]=values;
//		        	System.out.println(sessionArray[i]);	
//		        	i=i+1;
//		        }
//		        
//		        forSessionModel.setSessionArray(sessionArray);
//	        }
	        
	        
	        //合致したsessionのメンバーをArrayListに入れる
	        
	        List<List<String>> spememberList=forSessionModel.getSpememberList();
	        
	        for(int i=0;i<spesessionidList.size();i++) {
	        	String sql2="select memberId from sessionmember where sessionId = ?;";
	        	PreparedStatement stmt2 = conn.prepareStatement(sql2);
	        	stmt2.setString(1,spesessionidList.get(i));
	        	ResultSet rs2=stmt2.executeQuery();
	        	
	        	List<String> spemember=new ArrayList<>();
	        	
	        	while(rs2.next()) {
		        	spemember.add(rs2.getString("memberId"));
		        }
	        	
	        	spememberList.add(spemember);
	        }
	        forSessionModel.setSpememberList(spememberList);
	        
	        
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("ForSessionDAOのエラー");
			System.out.println("エラー1"+e.getMessage());
			System.out.println("SQL State: " + e.getSQLState());
		    System.out.println("Vendor Error Code: " + e.getErrorCode());
			
		}
		
		return forSessionModel;		
	}
}
