package mjy.order.service;

import mjy.order.bean.po.DealMessagePo;
import mjy.order.bean.vo.DealMessage;

public interface DealMessageService {
	public DealMessage queryDeal(DealMessagePo dmpo);
}
