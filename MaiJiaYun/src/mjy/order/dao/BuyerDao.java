package mjy.order.dao;

import java.util.List;

import mjy.order.bean.po.BuyerPO;
import mjy.order.bean.vo.Buyer;

public interface BuyerDao {
	public List<Buyer> queryBuyer(BuyerPO buyerPO);
		
}
