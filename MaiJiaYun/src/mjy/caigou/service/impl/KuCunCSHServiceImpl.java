package mjy.caigou.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import mjy.caigou.dao.GoodsDao;
import mjy.caigou.dao.KuCunCSHQueryDao;
import mjy.caigou.dao.WarehouseDao;
import mjy.caigou.dao.impl.GoodsDaoImpl;
import mjy.caigou.dao.impl.KuCunCSHQueryDaoImpl;
import mjy.caigou.dao.impl.WarehouseDaoImpl;
import mjy.caigou.po.GoodsPO;
import mjy.caigou.po.KuCunCSHGoods2PO;
import mjy.caigou.po.KuCunCSHGoodsPO;
import mjy.caigou.service.KuCunCSHService;
import mjy.caigou.vo.GoodsVO;
import mjy.caigou.vo.WarehouseVO;

/**
 * 库存初始化页面的service层
 * @author 第九小组组员 张俊
 *
 */


public class KuCunCSHServiceImpl implements KuCunCSHService {
	
	
	/**
	 * 多条件查询：仓库，搜索条件，是否显示已设置仓库
	 * @author 第九小组组员张俊
	 */
	
	@Override
	public List<KuCunCSHGoodsPO> MultiQuery(String buttonValue, String searchValue, String stockStatus, int userId) {
		KuCunCSHQueryDao kucunCSHQueryDao=new KuCunCSHQueryDaoImpl();
		
		List<KuCunCSHGoodsPO> goods=kucunCSHQueryDao.MultiQuery(buttonValue, searchValue, stockStatus, userId);

		return goods;
	}

	
	/**
	 * 库存初始化   goodsStr=11:3,101:5,222:4
	 * @author 第九小组组员张俊
	 */
	@Override
	public void warehouseInit(String buttonValue, String goodsStr,int userId) {
		
		GoodsDao goodDao=new GoodsDaoImpl();
		KuCunCSHQueryDao kucunCSHQueryDao=new KuCunCSHQueryDaoImpl();
		//页面传过来的Goods
		List<KuCunCSHGoods2PO> goods=new ArrayList<KuCunCSHGoods2PO>();
		//对字符串进行处理
		KuCunCSHGoods2PO good=null;
		String goodStr[]=goodsStr.split(",");//将字符串11:3,101:5,222:4 分离成   11:3  101:5  222:4
		for (String string : goodStr) {
			String goodStr2[]=string.split(":");
			good=new KuCunCSHGoods2PO();
			good.setGoodId(Integer.parseInt(goodStr2[0]));
			good.setGoodCount(Integer.parseInt(goodStr2[1]));
			goods.add(good);
		}
		
		//根据仓库名得到(当前用户)仓库warehouseId
		int warehouseId=kucunCSHQueryDao.getWarehouseId(buttonValue, userId);
		//查询当前仓库所有的已设置库存goodId
		List<Integer> goodIds=kucunCSHQueryDao.queryGoodId(warehouseId);
		
		
		for (KuCunCSHGoods2PO goo : goods) {//页面传过来的Id
			boolean flag=false;
			for (Integer goodid : goodIds) {//数据库当前仓库已经设置的库存
				if(goo.getGoodId()==goodid){
					//做更新操作
					kucunCSHQueryDao.updateGoodCount(goo.getGoodId(), warehouseId, goo.getGoodCount());
					//设置总库存
					goodDao.goodRepertory(goo.getGoodId());
					flag=true;
					break;
				}
				
			}
			if(flag==false){
				//作插入操作
				kucunCSHQueryDao.insertGoodCount(goo.getGoodId(), warehouseId, goo.getGoodCount(), buttonValue);
				//设置总库存
				goodDao.goodRepertory(goo.getGoodId());
				
			}
			
			
		}
		
		
		
	}

	

	/**
	 * 获得当前用户所有的仓库 名
	 * @author 第九小组组员   张俊
	 */
	@Override
	public List<String> getWarehouseNames(int userId) {
		List<String> warehouseNames =new ArrayList<String>();
		
		WarehouseDao warehouseDao=new WarehouseDaoImpl();
		List<WarehouseVO> warehouseVOs=warehouseDao.getWarehouseById(userId); 
		
		//通过仓库对象得到仓库名
		for (WarehouseVO warehouseVO : warehouseVOs) {
			warehouseNames.add(warehouseVO.getWareHouseName());
		}
		
		return warehouseNames;
	}

	
	
	/**
	 * 获得所有商品->传到库存的
	 */
	@Override
	public List<GoodsVO> getAllGoods(int userId) {
		
		GoodsDao goodsDao=new GoodsDaoImpl();
		List<GoodsVO> goods=goodsDao.queryAllGoodsById(userId);

		return goods;
	}




	
	
	
}
