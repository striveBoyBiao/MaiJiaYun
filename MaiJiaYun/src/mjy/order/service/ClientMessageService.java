package mjy.order.service;

import mjy.order.bean.po.ClientMessagePo;
import mjy.order.bean.vo.Buyer;
import mjy.order.bean.vo.ClientMessage;
import mjy.order.bean.vo.Order;

public interface ClientMessageService {
	public ClientMessage queryClient(ClientMessagePo cmpo);
	public void update(Order order, Buyer buyer);
}
