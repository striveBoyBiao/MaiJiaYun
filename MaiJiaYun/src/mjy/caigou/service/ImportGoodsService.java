package mjy.caigou.service;

import java.util.List;

import mjy.caigou.vo.ShopGoodsVO;
import mjy.caigou.vo.ShopVO;

public interface ImportGoodsService {
	public List<String> getShopNames();//得到所有店铺的名称
	public List<ShopGoodsVO> getShopGoodss(int shopId,int isImport);//根据店铺id得到商品
	public void updateShopGoodss(List<ShopGoodsVO> shopGoodss); 
}

