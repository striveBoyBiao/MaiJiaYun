package mjy.order.service;

import java.util.List;

import mjy.order.bean.po.OrderPO;
import mjy.order.bean.vo.Order;

public interface OrderService {
	List<Order> orderQueryAll(OrderPO orderPO);//查询所有订单
	
	Order orderQuery(OrderPO orderPO);//查询单独订单
	
	int orderQueryCount(OrderPO orderPO);//查询订单总条数
	//修改订单；
	void uqdate(String orderCheck,int state);
	
}
