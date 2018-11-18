package mjy.caiwu.fukuan.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mjy.common.util.jdbc.JdbcUtil;

public abstract class BaseDao<T> {

	public void SaveOrUpdate(String sql,List<Object> params){
		Connection connction=null;
		PreparedStatement stat=null;
		try {
			connction=JdbcUtil.getConnection();
			stat=connction.prepareStatement(sql);
			int parameterIndex=1;
			for (Object object : params) {
				stat.setObject(parameterIndex, object);
				parameterIndex++;
			}
			stat.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			try {
				if(connction.getAutoCommit()){
					JdbcUtil.free(connction);
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		
	}
	
	public List<T> queryForList(String sql, List<Object> params) {
		Connection connection = null;
		PreparedStatement stat = null;
		ResultSet rs = null;

		List<T> objs = new ArrayList<T>();
		try {
			connection = JdbcUtil.getConnection();

			stat = connection.prepareStatement(sql);
			int parameterIndex = 1;
			for (int i=0;i<params.size();i++) {
				stat.setObject(parameterIndex, params.get(i));
				parameterIndex++;
			}
			rs = stat.executeQuery();
			// 将结果集如何映射到对象
			if (rs != null) {
				objs = mapRow(rs);
			}

		} catch (Exception e) {
			
			e.printStackTrace();
		} finally {
			JdbcUtil.free(connection);
		}
		return objs;
	}
	
	public abstract List<T> mapRow(ResultSet rs) throws Exception;
}
