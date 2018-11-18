package mjy.caiwu.jichuziliao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mjy.common.util.jdbc.JdbcUtil;

public abstract class BaseDao<T> {

	public int SaveOrUpdate(String sql, List<Object> params) {
		int line = 0;
		Connection conn = null;
		PreparedStatement preState = null;

		try {
			conn = JdbcUtil.getConnection();
			preState = conn.prepareStatement(sql);
			int index = 1;
			for (Object param : params) {
				preState.setObject(index, param);
				index++;
			}
			line = preState.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(conn!=null){
				JdbcUtil.free(conn);
			}
		}
		return line;
	}
	
	public List<T> queryForList(String sql,List<Object> params){
		Connection conn = null;
		PreparedStatement preState = null;
		ResultSet set = null;
		List<T> list = new ArrayList<>();
		try {
			conn = JdbcUtil.getConnection();
			preState = conn.prepareStatement(sql);
			int index = 1;
			for (Object param : params) {
				preState.setObject(index, param);
				index++;
			}
			set = preState.executeQuery();
			if(set!=null){
				list = mapRow(set);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// 抽象方法实现结果集（对象的映射）
	public abstract List<T> mapRow(ResultSet set) throws SQLException;
}
