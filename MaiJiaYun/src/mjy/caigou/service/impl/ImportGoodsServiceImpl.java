package mjy.caigou.service.impl;

import java.util.ArrayList;
import java.util.List;

import mjy.caigou.dao.ShopDao;
import mjy.caigou.dao.ShopGoodsDao;
import mjy.caigou.dao.impl.ShopDaoImpl;
import mjy.caigou.dao.impl.ShopGoodsDaoImpl;
import mjy.caigou.service.ImportGoodsService;
import mjy.caigou.vo.ShopGoodsVO;
import mjy.caigou.vo.ShopVO;

public class ImportGoodsServiceImpl implements ImportGoodsService {
	
	private ShopGoodsDao shopGoodDao=new ShopGoodsDaoImpl();
	/**
	 * 得到所有店铺的名称
	 */
	@Override
	public List<String> getShopNames() {
		
		return null;
	}
	@Override
	public List<ShopGoodsVO> getShopGoodss(int shopId,int isImport) {
		List<ShopGoodsVO> shopGoodss=new ArrayList<>();
		shopGoodss=shopGoodDao.getShopGoods(shopId,isImport);
		return shopGoodss;
	}
	@Override
	public void updateShopGoodss(List<ShopGoodsVO> shopGoodss) {
		shopGoodDao.updateShopGoodss(shopGoodss);	
	}
	
	
	public static void main(String[] args) {
		List<ShopGoodsVO> shopGoodss=new ArrayList<>();
		ShopGoodsVO g=new ShopGoodsVO();
		g.setGoodId(1);
		shopGoodss.add(g);
		new ImportGoodsServiceImpl().updateShopGoodss(shopGoodss);
		System.out.println("导入成功");
	}

}
