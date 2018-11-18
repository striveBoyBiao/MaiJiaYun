package mjy.order.dao;

import java.util.List;

import mjy.order.bean.po.OrderPO;
import mjy.order.bean.vo.Order;

public interface OrderDao {
	public List<Order> orderQuery(OrderPO orderPO);
	//��ѯ���ж���
	public List<Order> queryAll();
	
	public int orderCounts(OrderPO orderPO);
	
	public void update(String orderCheck,Integer state);
}
