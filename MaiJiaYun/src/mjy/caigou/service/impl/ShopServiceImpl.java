package mjy.caigou.service.impl;

import java.util.ArrayList;
import java.util.List;

import mjy.caigou.dao.ShopDao;
import mjy.caigou.dao.impl.ShopDaoImpl;
import mjy.caigou.service.ShopService;
import mjy.caigou.vo.ShopVO;

public class ShopServiceImpl implements ShopService {
	private ShopDao importgoodsdao=new ShopDaoImpl();
	/**
	 * 得到所有店铺的名称
	 */
	@Override
	public List<String> getShopNames(int userId) {
		List<String> shopnames=new ArrayList<>();
		List<ShopVO> shopvo=importgoodsdao.getShop(userId);
		for (ShopVO sh : shopvo) {
			shopnames.add(sh.getShopName());
		}
		return shopnames;
	}

	

}
