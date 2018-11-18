package mjy.login.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mjy.common.util.jdbc.JdbcUtil;
import mjy.login.beans.po.RepPO;
import mjy.login.dao.RepDao;

public class RepDaoImpl implements RepDao{
	
	
	@Override
	public boolean saveRep(List<RepPO> reps) {
		//先删除rep表里的数据
		List<Object> ps=new ArrayList<>();
		ps.add(reps.get(0).getEmpId());
		this.SaveOrUpdate("delete from common_rep where empId=?;",ps);
		//再添加rep
		for (RepPO repPO : reps) {
			List<Object> params=new ArrayList<>();
			params.add(repPO.getEmpId());
			params.add(repPO.getPostId());
			
			this.SaveOrUpdate("insert into common_rep values(?,?)",params);
		}
		return true;
	}
	//修改或删除rep
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
}
