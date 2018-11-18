package mjy.login.util;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import mjy.common.util.jdbc.JdbcUtil;

public class InitUser {
	/**
	 * 初始化用户的额外权限
	 * @param bossId
	 */
	public void initExtLimit(Integer bossId) {
		Connection con = JdbcUtil.getConnection();
		CallableStatement callStmt = null;
		String sql = "CALL initExtLimt(?)";
		try {
			callStmt = con.prepareCall(sql);
			callStmt.setInt(bossId, 1);
			callStmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JdbcUtil.free(con);
		}
	}
	
	/**
	 * 初始化用户code
	 * @param bossId
	 */
	public void initCode(Integer bossId) {
		Connection con = JdbcUtil.getConnection();
		String sql="CALL initCode(?)";
		CallableStatement callStmt = null;
		try {
			callStmt = con.prepareCall(sql);
			callStmt.setInt(bossId, 1);
			callStmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JdbcUtil.free(con);
		}
		
	}
}
