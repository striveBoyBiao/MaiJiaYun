package mjy.order.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mjy.common.util.jdbc.JdbcUtil;
import mjy.order.dao.RowMap;

public class BaseDao<T> {
	
	private Connection connection;
	private PreparedStatement prep;
	private ResultSet res;
	
	//��ɾ�ã����ǻ����ò�����
	public int alter(String sql,List<Object> parames) {
		int result = -1;
		try {
			connection = JdbcUtil.getConnection();
			prep = connection.prepareStatement(sql);
			int parameterIndex = 1;
			for (Object parame : parames) {
				prep.setObject(parameterIndex, parame);
				parameterIndex++;
			}
			result = prep.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if (prep!=null) {
					prep.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			JdbcUtil.free(connection);
		}
		return result;
	}
	
	//���ݿ���ĵײ��ѯ
	public List<T> query(String sql,List<Object> parames,RowMap<T> rowMap) {
		List<T> lists = new ArrayList<T>();
		try {
			connection = JdbcUtil.getConnection();
			prep = connection.prepareStatement(sql);
			int parameterIndex = 1;
			for (Object parame : parames) {
				prep.setObject(parameterIndex, parame);
				parameterIndex++;
			}
			res = prep.executeQuery();
			if (res!=null) {
				lists = rowMap.mapRows(res);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if (res!=null) {
					res.close();
				}
				if (prep!=null) {
					prep.close();
				}
				JdbcUtil.free(connection);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return lists;
	}
	
	//������ݿ�����Ҫ��ѯ�����ݵ�������
	public int amount(String sql,List<Object> parames,RowMap<T> rowMap) {
		int amount = 0;
		try {
			connection = JdbcUtil.getConnection();
			prep = connection.prepareStatement(sql);
			int parameterIndex = 1;
			for (Object parame : parames) {
				prep.setObject(parameterIndex, parame);
				parameterIndex++;
			}
			res = prep.executeQuery();
			if (res!=null) {
				amount = rowMap.mapRowCounts(res);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if (res!=null) {
					res.close();
				}
				if (prep!=null) {
					prep.close();
				}
				JdbcUtil.free(connection);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return amount;
	}
	
	//��ѯ��ַʡ���У���
	public ResultSet queryAddress(String sql){
		
		connection = JdbcUtil.getConnection();
		try {
			prep = connection.prepareStatement(sql);
			res = prep.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
		
	}
	
	
	
}
