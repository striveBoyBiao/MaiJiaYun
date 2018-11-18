package mjy.order.service;

import java.util.List;

import mjy.order.bean.po.ShopPO;
import mjy.order.bean.vo.Shop;

public interface ShopService {
	
	Shop shopQuery(ShopPO shopPO);
	List<Shop> shopQueryAll();
}
