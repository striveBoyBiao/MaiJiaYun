package mjy.caigou.service.impl;

import java.util.List;

import mjy.caigou.dao.CommodityDao;
import mjy.caigou.dao.CommodityLqDao;
import mjy.caigou.dao.impl.CommodityDaoImpl;
import mjy.caigou.dao.impl.CommodityLqDaoImpl;
import mjy.caigou.po.GoodsPO;
import mjy.caigou.service.CommodityService;
import mjy.caigou.vo.GoodsVO;

public class CommodityServiceImpl implements CommodityService {
	private CommodityDao goodsDao=new CommodityDaoImpl();
	private CommodityLqDao lqdao=new CommodityLqDaoImpl();
	
	@Override
	public void updateStore(int goodid,int store) {
		goodsDao.updateStore(goodid,store);	
	}

	@Override
	public List<GoodsVO> queryAllGoods(int userId) {
		return goodsDao.queryAllGoods(userId);
	}

	@Override
	public List<GoodsVO> listBy(GoodsPO goodsPO) {
		
		return lqdao.listBy(goodsPO);
	}

}
