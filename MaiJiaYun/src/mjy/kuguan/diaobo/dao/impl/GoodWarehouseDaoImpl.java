package mjy.kuguan.diaobo.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import mjy.kuguan.diaobo.dao.GoodWarehouseDao;
import mjy.kuguan.diaobo.vo.GoodWarehouseVO;

public class GoodWarehouseDaoImpl extends BaseDao<GoodWarehouseVO> implements GoodWarehouseDao{

	/**
	 * 根据仓库ID查询商品仓库表
	 */
	@Override
	public List<GoodWarehouseVO> getGoodwarehouse(Integer warehouseId) {
		String sql="select * from caigou_goodwarehouse where warehouseId=?";
		List<Object> params=new ArrayList<>();
		params.add(warehouseId);	
		return this.queryForList(sql, params);
	}
	
	@Test
	public void test(){
		System.out.println(getGoodwarehouse(2));
	}
	

	
	
	@Override
	public List<GoodWarehouseVO> mapRow(ResultSet rs) throws Exception {
		List<GoodWarehouseVO> goodWarehouseVOs=new ArrayList<>();
		GoodWarehouseVO goodWarehouseVO=null;
		while(rs.next()){
			goodWarehouseVO=new GoodWarehouseVO();
			goodWarehouseVO.setWarehouseId(rs.getInt("warehouseId"));
			goodWarehouseVO.setGoodId(rs.getInt("goodId"));
			goodWarehouseVO.setGoodCount(rs.getInt("goodCount"));
			goodWarehouseVOs.add(goodWarehouseVO);
		}
		return goodWarehouseVOs;
	}

}
