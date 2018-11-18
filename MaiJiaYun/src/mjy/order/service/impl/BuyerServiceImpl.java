package mjy.order.service.impl;

import java.util.List;

import mjy.order.bean.po.BuyerPO;
import mjy.order.bean.vo.Buyer;
import mjy.order.dao.BuyerDao;
import mjy.order.dao.impl.BuyerDaoImpl;
import mjy.order.service.BuyerService;

public class BuyerServiceImpl implements BuyerService {
	
	BuyerDao buyerDao = new BuyerDaoImpl(); 
	@Override
	public List<Buyer> buyerQueryAll(BuyerPO buyerPO) {
		
		return buyerDao.queryBuyer(buyerPO);
	}
	@Override
	public Buyer buyerQuery(BuyerPO buyerPO) {
		if (buyerDao.queryBuyer(buyerPO)!=null) {
			return buyerDao.queryBuyer(buyerPO).get(0);
		}
		return null;
	}

}
