package mjy.caigou.dao;

import java.util.List;

import mjy.caigou.po.ShopGoodsPO;
import mjy.caigou.vo.ShopGoodsVO;

public interface ShopGoodsDao {

	public List<ShopGoodsVO> getShopGoods(int shopId,int isImport);

	//根据商品id得到商品
	public List<ShopGoodsVO> getShopGoods(int goodId);

	//更新对应信息
	public void updateShopGoods(ShopGoodsPO shopGoodsPO);
	//更新多个商品
	public void updateShopGoodss(List<ShopGoodsVO> shopGoodss);
	
	public List<ShopGoodsVO> queryShopGoods(int shopId,int isOnSelf);
	public List<ShopGoodsVO> query(ShopGoodsPO shopGoodsPo);//模糊查询
	public List<ShopGoodsVO> getAllDuiYingGoods(int shopId,int iscorrespond);
	public void updateShopTable(int goodId);
	public void insertToGoods(int goodId,int userId);
	public void insertToUserStatus(int goodId,int userId);
}
