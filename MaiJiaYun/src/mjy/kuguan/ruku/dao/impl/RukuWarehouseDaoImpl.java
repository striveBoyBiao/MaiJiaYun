package mjy.kuguan.ruku.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mjy.caigou.po.WarehousePO;
import mjy.common.util.jdbc.BaseDao;
import mjy.kuguan.ruku.dao.RukuWarehouseDao;

public class RukuWarehouseDaoImpl extends BaseDao<WarehousePO> implements RukuWarehouseDao{

	@Override
	public List<Integer> getSelectIdByName(String warehouseName) {
		// TODO Auto-generated method stub
		String sql = "select * from caigou_warehouse where wareHouseName = ?";
		List<Object> list = new ArrayList<Object>();
		list.add(warehouseName);
		List<WarehousePO> poList = new ArrayList<WarehousePO>();
		poList = this.queryForList(sql, list);
		
		List<Integer> resultList = new ArrayList<Integer>();
		
		for (WarehousePO po : poList) {
			resultList.add(po.getWareHouseId());
		}
		
		return resultList;
	}

	@Override
	public List<WarehousePO> mapRow(ResultSet rs){
		// TODO Auto-generated method stub
		List<WarehousePO> list = new ArrayList<WarehousePO>();
		WarehousePO po = null;
		try {
			while(rs.next()){
				po = new WarehousePO();
				po.setWareHouseId(rs.getInt("wareHouseId"));
				list.add(po);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
