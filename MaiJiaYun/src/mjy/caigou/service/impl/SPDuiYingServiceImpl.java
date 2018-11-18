package mjy.caigou.service.impl;

import java.util.List;

import mjy.caigou.dao.ShopGoodsDao;
import mjy.caigou.dao.impl.ShopGoodsDaoImpl;
import mjy.caigou.po.ShopGoodsPO;
import mjy.caigou.service.SPDuiYingService;
import mjy.caigou.vo.ShopGoodsVO;

public class SPDuiYingServiceImpl implements SPDuiYingService {
	private ShopGoodsDao shopGoodsDao=new ShopGoodsDaoImpl();

	@Override
	public List<ShopGoodsVO> queryShopGoods(int shopId, int isOnShelf) {
		
		return shopGoodsDao.queryShopGoods(shopId, isOnShelf);
	}

	@Override
	public List<ShopGoodsVO> query(ShopGoodsPO shopGoodsPo) {
		return shopGoodsDao.query(shopGoodsPo);
	}

	@Override
	public List<ShopGoodsVO> getAllDuiYingGoods(int shopId, int iscorrespond) {
		return shopGoodsDao.getAllDuiYingGoods(shopId, iscorrespond);
	}

	@Override
	public void updateShopTable(int goodId) {
		shopGoodsDao.updateShopTable(goodId);
	}

	@Override
	public void insertToGoods(int goodId,int userId) {
		
		shopGoodsDao.insertToGoods(goodId,userId);
	}

	@Override
	public void insertToUserStatus(int goodId, int userId) {
		shopGoodsDao.insertToUserStatus(goodId, userId);
		
	}

}
