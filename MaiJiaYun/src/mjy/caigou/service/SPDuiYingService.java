package mjy.caigou.service;

import java.util.List;

import mjy.caigou.po.ShopGoodsPO;
import mjy.caigou.vo.ShopGoodsVO;

public interface SPDuiYingService {
	public List<ShopGoodsVO> queryShopGoods(int shopId, int isOnSelf);
	public List<ShopGoodsVO> query(ShopGoodsPO shopGoodsPo);//Ä£ºý²éÑ¯
	public List<ShopGoodsVO> getAllDuiYingGoods(int shopId, int iscorrespond);
	
	public void updateShopTable(int goodId);
	public void insertToGoods(int goodId,int userId);
	public void insertToUserStatus(int goodId,int userId);
}
