package mjy.order.service.impl;

import java.util.List;

import mjy.order.bean.po.OrderPO;
import mjy.order.bean.vo.Order;
import mjy.order.dao.OrderDao;
import mjy.order.dao.impl.OrderDaoImpl;
import mjy.order.service.OrderService;

public class OrderServiceImpl implements OrderService {
	OrderDao orderDao = new OrderDaoImpl();
	
	@Override
	public List<Order> orderQueryAll(OrderPO orderPO) {
		
		return orderDao.orderQuery(orderPO);
	}

	@Override
	public Order orderQuery(OrderPO orderPO) {
		if(orderDao.orderQuery(orderPO)!=null){
			return orderDao.orderQuery(orderPO).get(0);
		}
		return null;
	}

	@Override
	public int orderQueryCount(OrderPO orderPO) {
		
		return orderDao.orderCounts(orderPO);
	
	}

	@Override
	public void uqdate(String orderCheck,int state) {
		orderDao.update(orderCheck,state);
	}

}
