package mjy.kuguan.diaobo.service.impl;

import java.util.ArrayList;
import java.util.List;
import org.junit.Test;

import mjy.kuguan.diaobo.dao.GoodDao;
import mjy.kuguan.diaobo.dao.GoodWarehouseDao;
import mjy.kuguan.diaobo.dao.WarehouseDao;
import mjy.kuguan.diaobo.dao.impl.GoodDaoImpl;
import mjy.kuguan.diaobo.dao.impl.GoodWarehouseDaoImpl;
import mjy.kuguan.diaobo.dao.impl.WarehouseDaoImpl;
import mjy.kuguan.diaobo.po.GoodsPO;
import mjy.kuguan.diaobo.service.WarehouseService;
import mjy.kuguan.diaobo.vo.GoodWarehouseVO;
import mjy.kuguan.diaobo.vo.WarehouseVO;


public class WarehouseServiceImpl implements WarehouseService {
	
	WarehouseDao warehouseDao=new WarehouseDaoImpl();
	GoodWarehouseDao goodWarehouseDao=new GoodWarehouseDaoImpl();
	GoodDao goodDao=new GoodDaoImpl();
	/**
	 * 根据用户ID查询得到仓库名称
	 */
	@Override
	public List<WarehouseVO> getWarehouseName(Integer userId) {
		return warehouseDao.getWarehouseByUserId(userId);
	}
	
	/**
	 * 根据仓库名称得到该仓库下的所有商品信息
	 * 
	 */
	@Override
	public List<GoodsPO> getGoods(String warehouseName) {
		//根据仓库名称查询仓库ID
		List<WarehouseVO> warehouses= warehouseDao.getWareHouseByName(warehouseName);
		List<Integer> warehouseId=new ArrayList<Integer>();
		
		for (WarehouseVO warehouseVO : warehouses) {
			warehouseId.add(warehouseVO.getWareHouseId());
		}
		//根据仓库ID查询仓库商品表
		List<GoodWarehouseVO> goodWarehouseVO=null;
		for (Integer integer : warehouseId) {
			 goodWarehouseVO=goodWarehouseDao.getGoodwarehouse(integer);
		}
		
		//拿到该仓库Id下的商品ID和商品库存
		//得到GoodsPO
		List<GoodsPO> goodsPOs=new ArrayList<>();
		for (GoodWarehouseVO goodWarehouse : goodWarehouseVO) {
			GoodsPO goodsPO=goodDao.queryByGoodId(goodWarehouse.getGoodId()).get(0);
			goodsPO.setGoodCount(goodWarehouse.getGoodCount());
			goodsPOs.add(goodsPO);
		}		
		 return goodsPOs;
	}

	@Test
	public void Test1(){
		System.out.println(getWarehouseName(10001));
		//System.out.println(getGoods("仓库1"));
	}
	
}
