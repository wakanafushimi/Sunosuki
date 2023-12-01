package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.SessionListModel;

public class SessionListDAO {
	private final String JDBC_URL="jdbc:mysql://localhost:3306/sunosuki";
	private final String DB_USER="root";
	private final String DB_PASS="";
	
	//配列sessiondetailの中身
		//[0]:sessionId
		//[1]:date
		//[2]:location
		//[3]:message
		//[4]:主催者username
		//[5]:メンバー数
		//[6]:車の台数
	
	public SessionListModel setSession(SessionListModel sessionListModel) {
		try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	    } catch (ClassNotFoundException e) {
	        throw new IllegalStateException("JDBCドライバを読み込めませんでした");
	    }
		
		List<String[]> sessionList=sessionListModel.getSessionList();
		List<List<String>> memberList=sessionListModel.getMemberList();
		String userid=null;
		
		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
	        conn.setAutoCommit(true);
        	String sql = "select * from session;";
        	PreparedStatement stmt = conn.prepareStatement(sql);
        	ResultSet rs=stmt.executeQuery();
        	
        	//sessionテーブルの各行について
        	while(rs.next()) {
        		String[] sessiondetail=new String[7];
        		
        		sessiondetail[0]=rs.getString("sessionId");
        		sessiondetail[1]=rs.getString("date");
        		sessiondetail[2]=rs.getString("location");
        		sessiondetail[3]=rs.getString("message");
        		userid=rs.getString("creater");
        		
        		//主催者のusernameを取得
        		String sql2 = "select username from userdetail where id=?;";
            	PreparedStatement stmt2 = conn.prepareStatement(sql2);
            	stmt2.setString(1,userid);
            	
            	ResultSet rs2=stmt2.executeQuery();
            	while(rs2.next()) {
            		sessiondetail[4]=rs2.getString("username");
            	}
            	
            	//メンバーの数を取得
            	String sql3="select count(*) from sessionmember where sessionId=?;";
            	PreparedStatement stmt3 = conn.prepareStatement(sql3);
            	stmt3.setString(1,sessiondetail[0]);
            	ResultSet rs3=stmt3.executeQuery();
            	
            	while(rs3.next()) {
            		int num=rs3.getInt("count(*)")+1;
            		sessiondetail[5]=String.valueOf(num);
            	}
            	
            	//メンバーのidを取得
            	String sql4="select memberId from sessionmember where sessionId=?;";
            	PreparedStatement stmt4 = conn.prepareStatement(sql4);
            	stmt4.setString(1,sessiondetail[0]);
            	ResultSet rs4=stmt4.executeQuery();
            	List<String> member=new ArrayList<>();
            	int cars=0;
            	String carsStr=null;
            	while(rs4.next()){
            		
            		//メンバーのusernameを取得しarraylistに格納
            		String sql5="select username from userdetail where id=?;";
            		PreparedStatement stmt5 = conn.prepareStatement(sql5);
                	stmt5.setString(1,rs4.getString("memberId"));
                	ResultSet rs5=stmt5.executeQuery();
                	while(rs5.next()) {
                		member.add(rs5.getString("username"));
                	}
                	
                	//メンバーの車の台数を取得
                	String sql6=" select count(*) from userdetail where id=? and car='あり';";
                	PreparedStatement stmt6 = conn.prepareStatement(sql6);
                	stmt6.setString(1,rs4.getString("memberId"));
                	ResultSet rs6=stmt6.executeQuery();
                	while(rs6.next()) {
                		int count=rs6.getInt("count(*)");
                		if(count==1) {
                			cars++;
                		}
                	}
                	carsStr=String.valueOf(cars);
                	if(cars==0) {
                		carsStr="0";
                	}
                	sessiondetail[6]=carsStr;
            	}
            	
        		sessionList.add(sessiondetail);
        		memberList.add(member);
        	}
        	
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			System.out.println("SQL State: " + e.getSQLState());
		    System.out.println("Vendor Error Code: " + e.getErrorCode());
			
		}
		sessionListModel.setSessionList(sessionList);
		return sessionListModel;
		
	}
}
