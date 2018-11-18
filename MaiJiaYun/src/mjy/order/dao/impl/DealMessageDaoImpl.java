package mjy.order.dao.impl;
/**
 * 详情->交易信息
 */
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mjy.order.bean.po.DealMessagePo;
import mjy.order.bean.vo.DealMessage;
import mjy.order.dao.DealMessageDao;
import mjy.order.dao.RowMap;


public class DealMessageDaoImpl extends BaseDao<DealMessage> implements DealMessageDao {

	@Override
	public DealMessage queryDealMessage(DealMessagePo dmpo) {
		/*通过订单表和买家表联合查询*/
		StringBuffer DealMessageSql=new StringBuffer("select * from order_order o join order_buyer b on b.buyerId=o.buyerId where 1=1");
		List<Object> parames=new ArrayList<Object>();
		
		if(dmpo.getOrderCode()!=null){
			DealMessageSql.append(" and o.orderCode=?");
			parames.add(dmpo.getOrderCode());
		}
		
		return query(DealMessageSql.toString(), parames, new RowMapAdaptive<DealMessage>() {
			
			@Override
			public List<DealMessage> mapRows(ResultSet res) {
				
				List<DealMessage> list=null;
				try {
					list=new ArrayList<DealMessage>();
					while(res.next()){
					DealMessage dm=new DealMessage();
					dm.setOrderPayWay(res.getInt("orderPayWay"));
					dm.setOrderPayTpye(res.getInt("orderPayTpye"));
					dm.setOrderPayTime(res.getString("orderPayTime"));
					dm.setAlipayId(res.getString("alipayId"));
					list.add(dm);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				return list;
			}
		}).get(0);
		
	}

}
