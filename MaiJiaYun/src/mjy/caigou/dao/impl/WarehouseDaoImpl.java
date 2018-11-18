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
 * �ֿ��Dao��
 * @author �ھ�С����Ա �ſ�
 *
 */

public class WarehouseDaoImpl  extends BaseDao<WarehouseVO> implements WarehouseDao{

	
	/**
	 * �õ���ǰ�û����еĲֿ�
	 * @author �ھ�С����Ա�ſ�
	 */
	@Override
	public List<WarehouseVO> getWarehouseById(int userId) {
		String sql="select * from caigou_warehouse where userId=?";
		List<Object> params=new ArrayList<>();
		params.add(userId);
		return this.queryForList(sql, params);
	}
	
	
	/**
	 * �����ݿ��еõ����еĲֿ�
	 */
	@Override
	public List<WarehouseVO> getWarehouse() {
		String sql="select * from caigou_warehouse";
		List<Object> params=new ArrayList<>();

		return this.queryForList(sql, params);
	}
	/**
	 * ͨ���ֿ�id�õ��ֿ�����
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
