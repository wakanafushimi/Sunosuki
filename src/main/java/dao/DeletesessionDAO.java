package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeletesessionDAO {
	private final String JDBC_URL="jdbc:mysql://localhost:3306/sunosuki";
	private final String DB_USER="root";
	private final String DB_PASS="";

	public void Deletesession(String sessionId) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new IllegalStateException("JDBCドライバを読み込めませんでした");
		}

		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
			conn.setAutoCommit(true);

			//sessionテーブルからの削除
			String sql = "delete from session where sessionId = ?;";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1,sessionId);
			stmt.executeUpdate();

			//sessionmemberテーブルからの削除
			String sql1="delete from sessionmember where sessionId = ?;";
			PreparedStatement stmt1 = conn.prepareStatement(sql1);
			stmt1.setString(1,sessionId);
			stmt1.executeUpdate();

		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("DeletesessionDAOのエラー");
			System.out.println(e.getMessage());
			System.out.println("SQL State: " + e.getSQLState());
			System.out.println("Vendor Error Code: " + e.getErrorCode());

		}
	}
}
