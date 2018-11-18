package mjy.caigou.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.caigou.dao.BaseDao;
import mjy.caigou.dao.GoodWarehouseDao;

import mjy.caigou.vo.GoodWarehouseVO;


public class GoodWarehouseDaoImpl extends BaseDao<GoodWarehouseVO> implements GoodWarehouseDao {
	
	
	
	@Override
	public List<GoodWarehouseVO> mapRow(ResultSet rs) throws Exception {
		List<GoodWarehouseVO> goodwarehouseVOs=new ArrayList<>();
		GoodWarehouseVO goodwarehouseVO=new GoodWarehouseVO();
		while(rs.next()){
			goodwarehouseVO=new GoodWarehouseVO();
			goodwarehouseVO.setGoodId(rs.getInt("goodId"));
			goodwarehouseVO.setWarehouseId(rs.getInt("warehouseId"));
			goodwarehouseVO.setGoodCount(rs.getInt("goodCount"));
			goodwarehouseVO.setWarehouseName(rs.getString("warehouseName"));
			goodwarehouseVOs.add(goodwarehouseVO);
		}
		return goodwarehouseVOs;
	}
	//得到GoodWarehouseVO的集合
	@Override
	public List<GoodWarehouseVO> getGoodWarehouseVOs(int goodId) {
		String sql="select * from caigou_goodwarehouse where goodId=?";
		List<Object> params = new ArrayList<>();
		params.add(goodId);
		
		return this.queryForList(sql, params);
	}
	//通过goodId删除goodWarehouse表中信息
	@Override
	public void deleteInfoById(int goodId) {
		String sql="delete from caigou_goodwarehouse where goodId=?";
		List<Object> params = new ArrayList<>();
		params.add(goodId);
		this.SaveOrUpdate(sql, params);
	}

	

}
