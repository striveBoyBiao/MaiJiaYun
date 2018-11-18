package mjy.order.dao.impl;
/**
 * 查询order_logistic物流信息
 */
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mjy.order.bean.po.LogisticPO;
import mjy.order.bean.vo.Logistic;
import mjy.order.dao.LogisticDao;
import mjy.order.dao.RowMap;

public class LogisticDaoImpl extends BaseDao<Logistic> implements LogisticDao {
/*
 * 查询order_logistic表中的全部信息
 */
	@Override
	public List<Logistic> logisticQuery(LogisticPO logisticPO) {
		StringBuffer logisticSql = new StringBuffer("select * from order_logistic where 1 = 1");
		List<Object> parames=new ArrayList<Object>();
		
		if (logisticPO!=null) {
			if (logisticPO.getLogisticId()!=null) {
				logisticSql.append(" and logisticId = ?");
				parames.add(logisticPO.getLogisticId());
			}
			if (logisticPO.getLogisticName()!=null&&!logisticPO.getLogisticName().equals("")) {
				logisticSql.append(" and logisticName like ?");
				parames.add("%"+logisticPO.getLogisticName()+"%");
			}
		}
		String sql = logisticSql.toString();
//		System.out.println("sql:"+sql);
		return this.query(sql, parames, new RowMapAdaptive<Logistic>() {
			
			@Override
			public List<Logistic> mapRows(ResultSet res) {
				List<Logistic> list=null;
				try {
					list=new ArrayList<Logistic>();
					while(res.next()){
						Logistic logistic=new Logistic();
						logistic.setLogisticId(res.getInt("logisticId"));
						logistic.setLogisticName(res.getString("logisticName"));
						list.add(logistic);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				return list;
			}
		});
	}
	public static void main(String[] args) {
		LogisticDaoImpl logisticDaoImpl = new LogisticDaoImpl();
		LogisticPO logisticPO = new LogisticPO();
		logisticPO.setLogisticId(1);
		List<Logistic> logistics = logisticDaoImpl.logisticQuery(logisticPO);
		
		for (Logistic logistic : logistics) {
			System.out.println(logistic);
		}
	}
}
