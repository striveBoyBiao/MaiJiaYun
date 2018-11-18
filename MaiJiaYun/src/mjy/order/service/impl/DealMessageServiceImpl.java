package mjy.order.service.impl;

import mjy.order.bean.po.DealMessagePo;
import mjy.order.bean.vo.DealMessage;
import mjy.order.dao.DealMessageDao;
import mjy.order.dao.impl.DealMessageDaoImpl;
import mjy.order.service.DealMessageService;

public class DealMessageServiceImpl implements DealMessageService {
	DealMessageDao dmdao=new DealMessageDaoImpl();
	@Override
	public DealMessage queryDeal(DealMessagePo dmpo) {
		return dmdao.queryDealMessage(dmpo);
	}

}
