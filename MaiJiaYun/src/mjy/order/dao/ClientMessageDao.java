package mjy.order.dao;
/**
 * ����-���ͻ���Ϣ
 */
import java.util.List;

import mjy.order.bean.po.ClientMessagePo;
import mjy.order.bean.vo.Buyer;
import mjy.order.bean.vo.ClientMessage;
import mjy.order.bean.vo.Order;

public interface ClientMessageDao {
	/*��ѯ*/
	public ClientMessage queryClientMessage(ClientMessagePo cmpo);
	/*�����޸�*/
	public void update(Order order, Buyer buyer);

}
