package mjy.kuguan.diaobo.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mjy.common.util.jdbc.JdbcUtil;


/**
 * DAO层父类封装增删改查操作
 * @author student
 *
 * @param <T>
 */

public abstract class BaseDao<T> {

	/**
	 * 增删改操作
	 * @param sql
	 * @param params
	 */
	public boolean SaveOrUpdate(String sql, List<Object> params) {
		Connection connection = null;
		PreparedStatement stat = null;
		try {
			connection = JdbcUtil.getConnection();

			stat = connection.prepareStatement(sql);
			int parameterIndex = 1;
			for (Object param : params) {
				stat.setObject(parameterIndex, param);
				parameterIndex++;
			}
			stat.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if (connection.getAutoCommit()) {
					JdbcUtil.free(connection);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}
	
	/**
	 * 查询总记录数
	 * @param sql
	 * @param params
	 * @return
	 */
	public int getCount(String sql, List<Object> params) {
		Connection connection = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		int count = -1;
		try {
			connection = JdbcUtil.getConnection();

			stat = connection.prepareStatement(sql);
			int parameterIndex = 1;
			for (Object param : params) {
				stat.setObject(parameterIndex, param);
				parameterIndex++;
			}

			rs = stat.executeQuery();
			
			if (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.free(connection);
		}
		return count;
	}
	
	
	public T queryForSingle(String sql, List<Object> params){
		List<T> objs=queryForList(sql,params);
		if(objs.size()!=0){
			return objs.get(0);
		}
		return null;
	}
	
	/**
	 * 查询操作
	 * @param sql
	 * @param params
	 * @return
	 */
	public List<T> queryForList(String sql, List<Object> params) {
		Connection connection = null;
		PreparedStatement stat = null;
		ResultSet rs = null;

		List<T> objs = new ArrayList<T>();
		try {
			connection = JdbcUtil.getConnection();

			stat = connection.prepareStatement(sql);
			
			
				
			int parameterIndex = 1;
			for (Object param : params) {
				stat.setObject(parameterIndex, param);
				parameterIndex++;
			}

			rs = stat.executeQuery();
			
			if (rs != null) {
				objs = mapRow(rs);

			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.free(connection);
		}
		return objs;
	}

	
	public abstract List<T> mapRow(ResultSet rs) throws Exception;
	
}
