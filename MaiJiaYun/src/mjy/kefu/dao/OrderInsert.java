 package mjy.kefu.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import mjy.caiwu.shoukuan.beans.CwShouKuanVO;
import mjy.caiwu.shoukuan.dao.impl.CwShouKuanDaoImpl;
import mjy.common.util.jdbc.BaseDao;
import mjy.kefu.beans.CustomerBeanPO;
import mjy.kefu.beans.OrderBeanPO;
import mjy.kefu.beans.OrderBeanPOLyl;

public class OrderInsert extends BaseDao<Object> {
	
	public boolean orderInsert(OrderBeanPOLyl orderBeanVOLyl) {
		String sql = "insert into order_order(orderTotal,orderWeight,orderPayMent,orderGoodNum,orderState,orderTime,orderFavorable,orderCode,userId,shopId,orderPayWay,logisticId,orderFee,orderFreight,orderSellerRemark,buyerId) VALUES(?,?,?,?,1,?,?,?,?,?,?,?,?,?,?,?)";
		List<Object> arrays = new ArrayList<Object>();
		arrays.add(orderBeanVOLyl.getOrderTotal());
		arrays.add(orderBeanVOLyl.getOrderWeight());
		arrays.add(orderBeanVOLyl.getOrderPayMent());
		arrays.add(orderBeanVOLyl.getOrderGoodNum());
		arrays.add(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		arrays.add(orderBeanVOLyl.getOrderFavorable());
		arrays.add(orderBeanVOLyl.getOrderCode());
		arrays.add(orderBeanVOLyl.getUserId());
		arrays.add(orderBeanVOLyl.getShopId());
		arrays.add(orderBeanVOLyl.getOrderPayWay());
		arrays.add(orderBeanVOLyl.getLogisticId());
		arrays.add(orderBeanVOLyl.getOrderFee());
		arrays.add(orderBeanVOLyl.getOrderFreight());
		arrays.add(orderBeanVOLyl.getOrderSellerRemark());
		arrays.add(orderBeanVOLyl.getBuyerId());
		
//	 	System.out.println(arrays);
		
		
		return SaveOrUpdate(sql, arrays);
	}
	
	

	@Override
	public List<Object> mapRow(ResultSet rs) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	OrderBeanPO order=new OrderBeanPO();
	
	
	
	public boolean yiShouInsert(OrderBeanPOLyl orderBeanVOLyl) {
		OrderQuery OrderQuery=new OrderQuery();
		OrderBeanPO orderBeanPO=new OrderBeanPO();
		
		String sql = "insert into caiwu_shoukuan (skPayerName,skPayerNickname,skReceiptsCode,skReceivable,skCreatorId,skCreateDate,skBeiZhu,skOperatorId,skOperationDate,skState,shouzhilxId) value(?,?,?,?,?,?,?,?,?,?,?)";
		List<Object> arrays = new ArrayList<Object>();
		//买家
//		OrderQuery.yishouQuery(orderBeanVOLyl.getBuyerId());
		
		
		CustomerQuery customerQuery=new CustomerQuery();
		List<CustomerBeanPO> result=customerQuery.yishouQuery(orderBeanVOLyl.getBuyerId());
		String Name=result.get(0).getBuyerName();
		System.out.println(Name+"name");
		arrays.add(Name);
		//昵称
		arrays.add(Name);
		//相关数据
		arrays.add(orderBeanVOLyl.getOrderCode());
		//应付：
		arrays.add(orderBeanVOLyl.getOrderPayMent());
		//创建人Id
		arrays.add(orderBeanVOLyl.getUserId());
		//创建时间
		arrays.add(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		//备注
		arrays.add(orderBeanVOLyl.getOrderSellerRemark());
		//操作人：
		arrays.add(orderBeanVOLyl.getUserId());
		//操作时间
		arrays.add(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		//skState userId
		arrays.add(1);
		//shouzhilxId
		arrays.add(1);
		//fkzhDafaultId
//		arrays.add(orderBeanVOLyl.getUserId());
		
		return SaveOrUpdate(sql, arrays);
		
	}
	
	
}
