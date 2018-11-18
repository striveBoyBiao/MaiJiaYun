package mjy.caigou.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import mjy.caigou.dao.BaseDao;
import mjy.caigou.dao.WarehouseDao;
import mjy.caigou.vo.WarehouseVO;
import mjy.common.util.jdbc.JdbcUtil;

/**
 * 仓库的Dao层
 * @author 第九小组组员 张俊
 *
 */

public class WarehouseDaoImpl  extends BaseDao<WarehouseVO> implements WarehouseDao{

	
	/**
	 * 得到当前用户所有的仓库
	 * @author 第九小组组员张俊
	 */
	@Override
	public List<WarehouseVO> getWarehouseById(int userId) {
		String sql="select * from caigou_warehouse where userId=?";
		List<Object> params=new ArrayList<>();
		params.add(userId);
		return this.queryForList(sql, params);
	}
	
	
	/**
	 * 从数据库中得到所有的仓库
	 */
	@Override
	public List<WarehouseVO> getWarehouse() {
		String sql="select * from caigou_warehouse";
		List<Object> params=new ArrayList<>();

		return this.queryForList(sql, params);
	}
	/**
	 * 通过仓库id得到仓库名称
	 */
	@Override
	public String queryNameById(int warehouseId) {
		String sql="select * from caigou_warehouse where wareHouseId=? ";
		List<Object>  params=new ArrayList<>();
		params.add(warehouseId);
		List<WarehouseVO> warehouseVOs=this.queryForList(sql, params);
		
		return warehouseVOs.get(0).getWareHouseName();
	}
	@Test
	public void test(){
		System.out.println(queryNameById(4));
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
			WarehouseVOs.add(warehouseVO);
		}
		return WarehouseVOs;
	}
	@Override
	public List<WarehouseVO> getWarehouseByUserId(Integer a) {
		String sql="select * from caigou_warehouse where userId=?";
		List<Object> params=new ArrayList<>();
		params.add(a);
		return this.queryForList(sql, params);
	}

	

}
