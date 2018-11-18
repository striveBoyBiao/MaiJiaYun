package mjy.kuguan.cangkuxinxi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.common.util.jdbc.JdbcUtil;

/*
 * �ײ�DAO
 */
public abstract class BaseDAO<T> {

	// ��ɾ��
	public int executeUpdate(String sql, List<Object> arrays) {
		Connection connection = null;
		PreparedStatement ps = null;
		int flag = 0;
		try {
			connection = JdbcUtil.getConnection();
			ps = connection.prepareStatement(sql);
			int parameterIndex = 1;
			for (Object param : arrays) {
				ps.setObject(parameterIndex, param);
				parameterIndex++;
			}
			flag = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.free(connection);
		}
		return flag;
	}

	// ��ѯ
	public List<T> queryForList(String sql, List<Object> params) {
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		List<T> objs = new ArrayList<T>();
		try {
			connection = JdbcUtil.getConnection();
			ps = connection.prepareStatement(sql);
			int parameterIndex = 1;
			for (Object param : params) {
				ps.setObject(parameterIndex, param);
				parameterIndex++;
			}
			rs = ps.executeQuery();
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

	// ����� ---> ����
	public abstract List<T> mapRow(ResultSet rs) throws Exception;

}
