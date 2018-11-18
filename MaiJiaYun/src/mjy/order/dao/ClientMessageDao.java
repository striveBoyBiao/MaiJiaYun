package mjy.order.dao;
/**
 * 详情-》客户信息
 */
import java.util.List;

import mjy.order.bean.po.ClientMessagePo;
import mjy.order.bean.vo.Buyer;
import mjy.order.bean.vo.ClientMessage;
import mjy.order.bean.vo.Order;

public interface ClientMessageDao {
	/*查询*/
	public ClientMessage queryClientMessage(ClientMessagePo cmpo);
	/*保存修改*/
	public void update(Order order, Buyer buyer);

}
