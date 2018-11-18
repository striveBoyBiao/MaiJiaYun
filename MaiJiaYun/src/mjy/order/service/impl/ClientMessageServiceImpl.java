package mjy.order.service.impl;


import mjy.order.bean.po.ClientMessagePo;
import mjy.order.bean.po.OrderPO;
import mjy.order.bean.vo.Buyer;
import mjy.order.bean.vo.ClientMessage;
import mjy.order.bean.vo.Order;
import mjy.order.dao.ClientMessageDao;
import mjy.order.dao.OrderDao;
import mjy.order.dao.impl.ClientMessageDaoImpl;
import mjy.order.dao.impl.OrderDaoImpl;
import mjy.order.service.ClientMessageService;

public class ClientMessageServiceImpl implements ClientMessageService {
	ClientMessageDao cmdao=new ClientMessageDaoImpl();
	@Override
	public ClientMessage queryClient(ClientMessagePo cmpo) {
		return cmdao.queryClientMessage(cmpo);
	}
	@Override
	public void update(Order order, Buyer buyer) {
		 cmdao.update(order, buyer);
	}
	
	
	
	
	
	
	
//	public static void main(String[] args) {
//		/*检测客户信息完整*/
//		ClientMessageService cmgs=new ClientMessageServiceImpl();
//		ClientMessagePo cmpo=new ClientMessagePo();
//		cmpo.setOrderCode("OD201612061634001");
//		ClientMessage cli=cmgs.queryClient(cmpo);
//		System.out.println(cli.toString());
//		
//	}
}
