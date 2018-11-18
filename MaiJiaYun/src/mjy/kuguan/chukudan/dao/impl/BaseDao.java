package mjy.kuguan.chukudan.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import mjy.kuguan.chukudan.util.JdbcUtil;







public abstract class BaseDao<T> {
	
	/**
	 * 增删改
	 * @param sql
	 * @param params
	 */
	public void SaveOrUpdate(String sql, List<Object> params) {
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (connection.getAutoCommit()) {
					JdbcUtil.free(connection);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}


	/**
	 * 查询多个
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
			// 将结果集如何映射到对象
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

	// 抽象方法实现结果集->对象的映射
	public abstract List<T> mapRow(ResultSet rs) throws Exception;
	
	/**
	 * 虎哥的查询方法
	 * @param sql
	 * @param params
	 * @return
	 */
	public List<T> query(String sql){
		Connection con = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		List<T> ulist=new ArrayList<>();
		try {
			con=JdbcUtil.getConnection();
			stat=con.prepareStatement(sql);
			rs=stat.executeQuery();
			if(rs!=null){
				ulist=mapRow(rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				if(con.getAutoCommit()){
				closeAll(con,stat,rs);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return ulist;
	}
	/**
	 * 虎哥的查询方法
	 * @param sql
	 * @param params
	 * @return
	 */
	public List<T> query1(String sql,Object...objects){
		Connection con = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		List<T> ulist=new ArrayList<>();
		try {
			con=JdbcUtil.getConnection();
			stat=con.prepareStatement(sql);
			for (int i = 0; i < objects.length; i++) {
				stat.setObject(i+1, objects[i]);
			}
			rs=stat.executeQuery();
			if(rs!=null){
				ulist=mapRow(rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				if(con.getAutoCommit()){
				closeAll(con,stat,rs);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return ulist;
	}
	/**
	 * 虎哥的,获取数量
	 * @param sql
	 * @param params
	 * @return
	 */
	public int getNum(String sql){
		Connection con = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		int count=0;

		try {
			con=JdbcUtil.getConnection();
			stat=con.prepareStatement(sql);
			rs=stat.executeQuery();
			if(rs.next()){
				count=rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				if(con.getAutoCommit()){
				closeAll(con,stat,rs);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return count;
	}
	
	/**
	 * 关闭连接
	 * @param con
	 * @param pst
	 * @param rs
	 */
	public static void closeAll(Connection con,PreparedStatement pst,ResultSet rs){
			try {
				if(con!=null){
					con.close();
				}
				if(pst!=null){
					pst.close();
				}
				if(rs!=null){
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}


}
