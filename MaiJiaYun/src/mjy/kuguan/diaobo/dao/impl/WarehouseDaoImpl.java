package mjy.kuguan.diaobo.dao.impl;


import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import mjy.kuguan.diaobo.dao.WarehouseDao;
import mjy.kuguan.diaobo.vo.WarehouseVO;



public class WarehouseDaoImpl  extends BaseDao<WarehouseVO> implements WarehouseDao{

	
	/**
	 * 通过仓库ID查询仓库
	 */
	@Override
	public List<WarehouseVO> getWareHouseById(int wareHouseId) {
		String sql="select * from caigou_warehouse where wareHouseId=?";
		List<Object> params=new ArrayList<>();
		params.add(wareHouseId);
		return this.queryForList(sql, params);
	}
	
	/**
	 * 通过用户ID查询仓库
	 */
	@Override
	public List<WarehouseVO> getWarehouseByUserId(Integer userId) {
		String sql="select * from caigou_warehouse where userId=?";
		List<Object> params=new ArrayList<>();
		params.add(userId);
		return this.queryForList(sql, params);
	}
	
	
	/**
	 * 查询所有仓库信息
	 */
	@Override
	public List<WarehouseVO> getWarehouse() {
		String sql="select * from caigou_warehouse";
		List<Object> params=new ArrayList<>();

		return this.queryForList(sql, params);
	}
	
	
	@Override
	public List<WarehouseVO> getWareHouseByName(String warehouseName) {
		String sql="select * from caigou_warehouse where warehouseName=?";
		List<Object> params=new ArrayList<>();
		params.add(warehouseName);
		return this.queryForList(sql, params);
		
	}
	
	@Test
	public void test1(){
//		List<WarehouseVO> house=getWarehouse();
//		for (WarehouseVO O : house) {
//			System.out.println(O+"\n");
//		}
		
//		List<WarehouseVO> house=getWarehouseByUserId(10001);
//		for (WarehouseVO O : house) {
//			System.out.println(O+"\n");
//		}
		List<WarehouseVO> house=getWareHouseByName("仓库1");
		for (WarehouseVO O : house) {
			System.out.println(O+"\n");
		}
		
	}
	
	@Override
	public String queryNameById(int warehouseId) {
		String sql="select * from caigou_warehouse where wareHouseId=? ";
		List<Object>  params=new ArrayList<>();
		params.add(warehouseId);
		List<WarehouseVO> warehouseVOs=this.queryForList(sql, params);
		
		return warehouseVOs.get(0).getWareHouseName();
	}
	
	

	
	
	
	@Override
	public List<WarehouseVO> mapRow(ResultSet rs) throws Exception {
		List<WarehouseVO> WarehouseVOs=new ArrayList<WarehouseVO>();
		WarehouseVO warehouseVO=null;
		while(rs.next()){
			warehouseVO=new WarehouseVO();
			warehouseVO.setWareHouseId(rs.getInt("wareHouseId"));
			warehouseVO.setWareHouseName(rs.getString("wareHouseName"));
			warehouseVO.setWareHouseStatus(rs.getString("wareHouseStatus"));
			warehouseVO.setWareHouseType(rs.getString("wareHouseType"));
			warehouseVO.setWareHouseInfo(rs.getString("wareHouseInfo"));
			warehouseVO.setWareHouseBoolean(rs.getInt("wareHouseBoolean"));
			warehouseVO.setUserId(rs.getInt("userId"));
			WarehouseVOs.add(warehouseVO);
		}
		return WarehouseVOs;
	}

}
