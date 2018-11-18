package mjy.kefu.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.common.util.jdbc.BaseDao;
import mjy.kefu.beans.LogisticBeanPO;

public class LogisticQuery extends BaseDao<LogisticBeanPO>{
	public List<LogisticBeanPO> logisticQuery(){
		String sql="select * from order_logistic";
		List<Object> params=new ArrayList<Object>();
		return queryForList(sql, params);
	}
	
	@Override
	public List<LogisticBeanPO> mapRow(ResultSet rs) throws Exception {
		List<LogisticBeanPO> list = new ArrayList<LogisticBeanPO>();
		LogisticBeanPO logistic = null;
		while (rs.next()) {
			logistic = new LogisticBeanPO();
			logistic.setLogisticId(rs.getString("logisticId"));
			logistic.setLogisticName(rs.getString("logisticName"));
			list.add(logistic);
		}
		return list;
	}
}
