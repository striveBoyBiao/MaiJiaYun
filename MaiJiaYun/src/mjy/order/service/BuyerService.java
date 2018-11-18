package mjy.order.service;

import java.util.List;

import mjy.order.bean.po.BuyerPO;
import mjy.order.bean.vo.Buyer;

public interface BuyerService {
	
	List<Buyer> buyerQueryAll(BuyerPO buyerPO);
	Buyer buyerQuery(BuyerPO buyerPO);
}
