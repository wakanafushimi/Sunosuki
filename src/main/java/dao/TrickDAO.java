package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.LoginModel;
import model.ProfileModel;

public class TrickDAO {
	private final String JDBC_URL="jdbc:mysql://localhost:3306/sunosuki";
	private final String DB_USER="root";
	private final String DB_PASS="";
	
	public void setDetail(LoginModel loginModel,TrickModel trickModel) {
		
			
		try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	    } catch (ClassNotFoundException e) {
	        throw new IllegalStateException("JDBCドライバを読み込めませんでした");
	    }
		
		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
	        conn.setAutoCommit(false);
	        
	        //trick_aにidが登録済みか調べる
	        String sql = "select * from trick_a where id = ?;";
	        try (PreparedStatement stmt = conn.prepareStatement(sql)){
	        	stmt.setString(1,loginModel.getId());
 	        	ResultSet rs=stmt.executeQuery();
 	        	conn.commit();
 	        	
 	        	int i=0;

 	        	if(!rs.next()) { 	 
 	        		while(rs.next()) {
 	        		
 	        		String sqlIn = "insert into trick_a values(?,?);";
 	        		try(PreparedStatement stmtIn = conn.prepareStatement(sqlIn)){
 	        		stmtIn.setString(1, loginModel.getId());
	        		stmtIn.setString(2, trickModel.getTrick_a().get(i));
	        		stmtIn.executeUpdate();
	        		conn.commit();
	        		
	        		i=i+1;
 	        		}catch(SQLException e) {
 	        			e.printStackTrace();
 	        			conn.rollback();
 	        			System.out.println("エラー1"+e.getMessage());
 	        		}
 	        		}
 	        	}
 	        	 	        	
 	        	//idが登録済みだったら
 	        	//（TrickModelには入力されたものがはいってる）
 	        	else  {
 	        		if(trickModel.getTrick_a().get(0)!=null) {
 		        		String sqlImg=" UPDATE userdetail SET img = ? WHERE id = ?;";
 		        		try(PreparedStatement stmtImg = conn.prepareStatement(sqlImg)){
 		        		stmtImg.setString(1, profileModel.getImg());
 		        		stmtImg.setString(2, loginModel.getId());
 		        		stmtImg.executeUpdate(); 
 		        		conn.commit();
 		        		}catch(SQLException e) {
 		        			e.printStackTrace();
 		        			conn.rollback();
 	 	        			System.out.println(e.getMessage());
 		        		}
 		        		
 	 	        	}
 	        		
 	        		if(profileModel.getUsername()!=null) {
 	        			String sqlUsername=" UPDATE userdetail SET username = ? WHERE id = ?;";
 	        			try(PreparedStatement stmtUsername = conn.prepareStatement(sqlUsername)){
 	        			stmtUsername.setString(1, profileModel.getUsername());
 	        			stmtUsername.setString(2, loginModel.getId());
 	        			stmtUsername.executeUpdate(); 
 	        			conn.commit();
 	        			}catch(SQLException e) {
 	        				e.printStackTrace();
 	        				conn.rollback();
 	 	        			System.out.println(e.getMessage());
 	        			}
 	        		}	        		
 	        		
 	        		if(profileModel.getPref()!=null) {
 		        		String sqlPref=" UPDATE userdetail SET pref = ? WHERE id = ?;";
 		        		try(PreparedStatement stmtPref = conn.prepareStatement(sqlPref)){
 		        		stmtPref.setString(1, profileModel.getPref());
 		        		stmtPref.setString(2, loginModel.getId());
 		        		stmtPref.executeUpdate(); 
 		        		conn.commit();
 		        		}catch(SQLException e) {
 		        			e.printStackTrace();
 		        			conn.rollback();
 	 	        			System.out.println(e.getMessage());
 		        		}
 	 	        	}
 	        		
 	        		if(profileModel.getCar()!=null) {
 		        		String sqlCar=" UPDATE userdetail SET car = ? WHERE id = ?;";
 		        		try(PreparedStatement stmtCar = conn.prepareStatement(sqlCar)){
 		        		stmtCar.setString(1, profileModel.getCar());
 		        		stmtCar.setString(2, loginModel.getId());
 		        		stmtCar.executeUpdate(); 
 		        		conn.commit();
 		        		}catch(SQLException e) {
 		        			e.printStackTrace();
 		        			conn.rollback();
 	 	        			System.out.println(e.getMessage());
 		        		}
 	 	        	}
 	        		
 	        		if(profileModel.getSelfintro()!=null) {
 		        		String sqlSelfintro=" UPDATE userdetail SET selfintro = ? WHERE id = ?;";
// 		        		System.out.println("selfintroのinputはnullじゃないとして分岐");
 		        		
 		        		try(PreparedStatement stmtSelfintro = conn.prepareStatement(sqlSelfintro)){
 		        		stmtSelfintro.setString(1, profileModel.getSelfintro());
 		        		stmtSelfintro.setString(2, loginModel.getId());
// 		        		System.out.println("selfintro更新OK");
 		        		stmtSelfintro.executeUpdate(); 
 		        		conn.commit();
 		        		}catch(SQLException e) {
 		        			e.printStackTrace();
 		        			conn.rollback();
 	 	        			System.out.println(e.getMessage());
 		        		}
 		        		
 	 	        	}else {
// 	 	        		System.out.println("selfintroのinputはnullとして分岐");
 	 	        	}
 	        		
// 	        		System.out.println("id登録済みケースsetDetail終了");
	        			
	        	}	        		        	
	        	
	        }catch(SQLException e){
	        	e.printStackTrace();
	        	System.out.println("エラー１"+e.getMessage());
	        	conn.rollback();
	        }
		}catch(SQLException e) {
			e.printStackTrace();
			
			System.out.println("エラー２"+e.getMessage());
		}		
	}
	
	public ProfileModel getDetail(LoginModel loginModel) {
		try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	    } catch (ClassNotFoundException e) {
	        throw new IllegalStateException("JDBCドライバを読み込めませんでした");
	    }
		
		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
	        conn.setAutoCommit(true);
        	String sql = "select * from userdetail where id = ?;";
        	PreparedStatement stmt = conn.prepareStatement(sql);
        	stmt.setString(1,loginModel.getId());
	        ResultSet rs=stmt.executeQuery();
	        
	        ProfileModel profileModel=new ProfileModel();
	        
	        while(rs.next()) {
	        
	        
	        String img=rs.getString("img");
	        profileModel.setImg(img);
	        
	        String username=rs.getString("username");
	        profileModel.setUsername(username);
	        
	        String pref=rs.getString("pref");
	        profileModel.setPref(pref);
	        
	        String car=rs.getString("car");
	        profileModel.setCar(car);
	        
	        String selfintro=rs.getString("selfintro");
	        profileModel.setSelfintro(selfintro); 
	
//	        System.out.println("getDetail成功");
	        }
	        
//	        System.out.println("getDetailで該当idなし");
	        return profileModel;
	       
	        
	      
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("エラー3"+e.getMessage());
			return null;
		}
		
		
	}
}
