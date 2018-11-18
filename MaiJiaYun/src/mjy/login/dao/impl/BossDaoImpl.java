package mjy.login.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mjy.common.util.jdbc.JdbcUtil;
import mjy.login.beans.po.BossPO;
import mjy.login.dao.BossDao;

public class BossDaoImpl implements BossDao {

	@Override
	public BossPO getBossPO(Integer bossID) {
		Connection conn = JdbcUtil.getConnection();
		String sql = "select * from common_boss  where userId=? ";
		BossPO boss=null;
	
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setInt(1, bossID);
			ResultSet result = preparedStatement.executeQuery();
				if (result.next()){
					boss=new BossPO();
					boss.setUserID(result.getInt(1));
					boss.setBossType(result.getInt(2));

					boss.setBossCompanyName(result.getString(3));
				}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.free(conn);
		}

		return boss;
		
	}

	@Override
	public boolean registerBossPO(BossPO b) {
		Connection connection = JdbcUtil.getConnection();
		String sql = "insert into common_boss values(?,?,?)";
		List<Object> params=new ArrayList<>();
		params.add(b.getUserID());
		params.add(b.getBossType());
		params.add(b.getBossCompanyName());
		
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
}
