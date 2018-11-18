package mjy.kuguan.cangkuxinxi.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.kuguan.cangkuxinxi.dao.BaseDAO;
import mjy.kuguan.cangkuxinxi.dao.IWarehouseDAO;
import mjy.kuguan.cangkuxinxi.vo.WarehouseInfoVO;

/*
 * �ֿ�
 */
public class WarehouseDAOImpl extends BaseDAO<WarehouseInfoVO> implements IWarehouseDAO {

	//��
	@Override
	public boolean saveWarehouseInfo(WarehouseInfoVO warehouseInfoVO) {
		String sql = "INSERT INTO caigou_warehouse(wareHouseName,wareHouseType,userId) VALUES(?,?,?);";
		List<Object> arrays = new ArrayList<Object>();
		arrays.add(warehouseInfoVO.getWarehouseName());
		arrays.add(warehouseInfoVO.getWarehouseType());
		arrays.add("10001");
		int result = executeUpdate(sql, arrays);
		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}

	//ɾ
	@Override
	public boolean removeWarehouseInfo(int warehouseId) {
		String sql = "DELETE FROM caigou_warehouse WHERE wareHouseId=?;";
		List<Object> arrays = new ArrayList<Object>();
		arrays.add(warehouseId);
		int result = executeUpdate(sql, arrays);
		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}

	//��
	@Override
	public boolean updateWarehouseInfo(int warehouseId, String warehouseName) {
		String sql = "UPDATE caigou_warehouse SET wareHouseName=? WHERE warehouseId=?;";
		List<Object> arrays = new ArrayList<Object>();
		arrays.add(warehouseName);
		arrays.add(warehouseId);
		int results = executeUpdate(sql, arrays);
		if (results > 0) {
			return true;
		}
		return false;
	}

	//��
	@Override
	public List<WarehouseInfoVO> queryWarehouseInfo() {
		String sql = "SELECT a.wareHouseId AS warehouseId, a.wareHouseName AS wareHouseName,"
				+ " a.wareHouseType AS wareHouseType,sum(b.goodCount) AS goodsNumber " + "FROM caigou_warehouse a "
				+ "left JOIN caigou_goodwarehouse b ON a.wareHouseId=b.warehouseId " + "GROUP BY a.wareHouseId;";
		List<Object> params = new ArrayList<Object>();
		return queryForList(sql, params);
	}

	//�������ӳ��
	@Override
	public List<WarehouseInfoVO> mapRow(ResultSet rs) throws Exception {
		List<WarehouseInfoVO> list = new ArrayList<WarehouseInfoVO>();
		WarehouseInfoVO warehouseInfo = null;
		while (rs.next()) {
			warehouseInfo = new WarehouseInfoVO();
			warehouseInfo.setWarehouseId(rs.getInt("warehouseId"));
			warehouseInfo.setWarehouseName(rs.getString("warehouseName"));
			warehouseInfo.setGoodCount(rs.getInt("goodsNumber"));
			warehouseInfo.setWarehouseType(rs.getString("wareHouseType"));
			list.add(warehouseInfo);
		}
		return list;
	}

}
