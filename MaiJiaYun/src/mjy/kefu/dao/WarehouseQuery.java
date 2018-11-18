package mjy.kefu.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.common.util.jdbc.BaseDao;
import mjy.kefu.beans.WarehouseBeanPO;
import mjy.kefu.beans.WarehouseBeanVO;

public class WarehouseQuery extends BaseDao<WarehouseBeanPO>{
	
	public List<WarehouseBeanPO> wareHouseQuery(WarehouseBeanVO warehouseBeanVO){
		String sql="select * from caigou_warehouse where 1=1";
		List<Object> params=new ArrayList<Object>();
		if(!warehouseBeanVO.getUserId().equals(null)){
			sql=sql+" and userId=?";
			params.add(warehouseBeanVO.getUserId());
		}
		return queryForList(sql, params);
	}
	
	@Override
	public List<WarehouseBeanPO> mapRow(ResultSet rs) throws Exception {
		List<WarehouseBeanPO> list = new ArrayList<WarehouseBeanPO>();
		WarehouseBeanPO wareHouse = null;
		while (rs.next()) {
			wareHouse = new WarehouseBeanPO();
			wareHouse.setWareHouseId(rs.getString("wareHouseId"));
			wareHouse.setWareHouseName(rs.getString("wareHouseName"));
			wareHouse.setWareHouseStatus(rs.getString("wareHouseStatus"));
			wareHouse.setWareHouseType(rs.getString("wareHouseType"));
			wareHouse.setWareHouseInfo(rs.getString("wareHouseInfo"));
			list.add(wareHouse);
		}
		return list;
	}
}
