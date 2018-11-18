package mjy.order.service.impl;

import java.util.List;

import mjy.order.bean.po.ShopPO;
import mjy.order.bean.vo.Shop;
import mjy.order.dao.ShopDao;
import mjy.order.dao.impl.ShopDaoImpl;
import mjy.order.service.ShopService;

public class ShopServiceImpl implements ShopService {
	ShopDao shopDao = new ShopDaoImpl();
	@Override
	public Shop shopQuery(ShopPO shopPO) {
		if (shopDao.shopQuery(shopPO)!=null) {
			return shopDao.shopQuery(shopPO).get(0);
		}
		return null;
	}
	@Override
	public List<Shop> shopQueryAll() {
		
		return shopDao.shopQuery(null);
	}

}
