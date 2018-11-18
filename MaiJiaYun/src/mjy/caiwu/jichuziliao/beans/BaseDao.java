package mjy.caiwu.jichuziliao.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mjy.common.util.jdbc.JdbcUtil;
public abstract class  BaseDao<T> {
	/**
	 * ���뱣������
	 * @param sql
	 * @param params
	 */
	public void SaveorUpdate(String sql,List<Object>params){
		Connection connection =null;
		PreparedStatement stat=null;
		try {
			connection =JdbcUtil.getConnection();
			stat=connection.prepareStatement(sql);
			int parameterIndex=1;
			for (Object param : params) {
				stat.setObject(parameterIndex, param);
				parameterIndex++;
			}
			stat.executeUpdate();

		} catch (SQLException e) {
			
		}finally{
			try {
				if(connection.getAutoCommit()){
					JdbcUtil.free(connection);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	/**
	 * ��ȡ���ݵ�������
	 * @param sql
	 * @param params
	 * @return
	 */
	public int getCount(String sql, List<Object> params) {
		Connection connection = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		int count = 0;
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
		/**
		 * ��ѯ������
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
			// ����������ӳ�䵽����
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
	// ���󷽷�ʵ�ֽ����->�����ӳ��
	  public abstract List<T> mapRow(ResultSet rs) throws Exception;
}
