package mjy.order.service;

import java.util.List;

import mjy.order.bean.po.OrderPO;
import mjy.order.bean.vo.Order;

public interface OrderService {
	List<Order> orderQueryAll(OrderPO orderPO);//��ѯ���ж���
	
	Order orderQuery(OrderPO orderPO);//��ѯ��������
	
	int orderQueryCount(OrderPO orderPO);//��ѯ����������
	//�޸Ķ�����
	void uqdate(String orderCheck,int state);
	
}
