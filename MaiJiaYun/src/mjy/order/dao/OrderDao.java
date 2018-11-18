package mjy.order.dao;

import java.util.List;

import mjy.order.bean.po.OrderPO;
import mjy.order.bean.vo.Order;

public interface OrderDao {
	public List<Order> orderQuery(OrderPO orderPO);
	//查询所有订单
	public List<Order> queryAll();
	
	public int orderCounts(OrderPO orderPO);
	
	public void update(String orderCheck,Integer state);
}
