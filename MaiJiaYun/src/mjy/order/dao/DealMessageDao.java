package mjy.order.dao;
/**
 * ����-��������Ϣ
 */
import java.util.List;

import mjy.order.bean.po.DealMessagePo;
import mjy.order.bean.vo.DealMessage;

public interface DealMessageDao {
	public DealMessage queryDealMessage(DealMessagePo dmpo);
	
}
