package mjy.caiwu.kucunchengben.util;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import mjy.caiwu.kucunchengben.po.KucuncbPo;
import mjy.caiwu.kucunchengben.vo.Caigou_goods;

public class DbUtil {
	private static final String URL;
	private static final String USER;
	private static final String PASSWORD;
	private static Connection con;
	private static PreparedStatement st;

	static {

		URL = "jdbc:mysql://192.168.41.2:3306/maijiayun?characterEncoding=utf8";
		USER = "sa";
		PASSWORD = "sa";
	}

	public void update(String sql, Object... objects) throws ClassNotFoundException, SQLException {
		con = init();
		st = con.prepareStatement(sql);
		for (int i = 0; i < objects.length; i++) {
			st.setObject(i + 1, objects[i]);
		}
		st.execute();
		close();
	}

	public <T> List<T> select(Class<T> clz, String sql, Object... objects) throws Exception {
		List<T> list = new ArrayList<>();
		con = init();
		st = con.prepareStatement(sql);
		for (int i = 0; i < objects.length; i++) {
			st.setObject(i + 1, objects[i]);
		}
		ResultSet rs = st.executeQuery();
		ResultSetMetaData md = rs.getMetaData();
		int columns = md.getColumnCount();
		while (rs.next()) {
			T t = clz.newInstance();
			for (int i = 0; i < columns; i++) {
				Field fie = clz.getDeclaredField(md.getColumnName(i + 1));
				if (rs.getObject(i + 1)!=null) {
					fie.setAccessible(true);
					fie.set(t, rs.getObject(i + 1));
				} else {
					fie.setAccessible(true);
					fie.set(t, null);
				}
			}
			list.add(t);
		}
		close();
		return list;
	}

	// ********************************************************
	public void update(String sql, Connection con, Object... objects) throws ClassNotFoundException, SQLException {
		st = con.prepareStatement(sql);
		for (int i = 0; i < objects.length; i++) {
			st.setObject(i + 1, objects[i]);
		}
		st.execute();
		close();
	}

	public <T> List<T> select(Class<T> clz, Connection con, String sql, Object... objects) throws Exception {
		List<T> list = new ArrayList<>();
		st = con.prepareStatement(sql);
		for (int i = 0; i < objects.length; i++) {
			st.setObject(i + 1, objects[i]);
		}
		ResultSet rs = st.executeQuery();
		ResultSetMetaData md = rs.getMetaData();
		int columns = md.getColumnCount();
		while (rs.next()) {
			T t = clz.newInstance();
			for (int i = 0; i < columns; i++) {
				Field fie = clz.getDeclaredField(md.getColumnName(i + 1));
				if (rs.getObject(i + 1)!=null) {
					fie.setAccessible(true);
					fie.set(t, rs.getObject(i + 1));
				} else {
					fie.setAccessible(true);
					fie.set(t, null);
				}
			}
			list.add(t);
		}
		close();
		return list;
	}

	/*
	 * ***************分页查询******************
	 */
	public <T> List<T> selectFenye(Class<T> cla, String sql,int pageNum, int pageSize, Object object) {
		int first = (pageNum - 1) * pageSize;
		List<T> list = null;
		try {
			if (object == null || object == "") {
				list = select(cla, sql, first, pageSize);
			} else {
				list = select(cla, sql, "%" + object + "%", "%" + object + "%", first, pageSize);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/*
	 * *********************************
	 */
	public Connection init() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(URL, USER, PASSWORD);
		return con;
	}

	public void close() throws SQLException {
		st.close();
		con.close();
	}

	public void close(Connection con) throws SQLException {
		st.close();
		con.close();
	}
}
