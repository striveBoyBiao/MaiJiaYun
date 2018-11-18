package mjy.kuguan.cangkuxinxi.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.kuguan.cangkuxinxi.dao.BaseDAO;
import mjy.kuguan.cangkuxinxi.dao.ILocationDAO;
import mjy.kuguan.cangkuxinxi.vo.LocationInfoVO;

/*
 * ��λ
 */
public class LocationDAOImpl extends BaseDAO<LocationInfoVO> implements ILocationDAO {
	
	//��
	@Override
	public boolean saveLocationDao(LocationInfoVO location) {
		String sql = "INSERT INTO caigou_location(reservoirId,locationName) VALUES(?,?);";
		List<Object> arrays = new ArrayList<Object>();
		arrays.add(location.getReservoirId());
		arrays.add(location.getLocationName());
		int results = executeUpdate(sql, arrays);
		if (results > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	//ɾ
	@Override
	public boolean removeLocationInfo(int locationId) {
		String sql = "DELETE FROM caigou_location WHERE locationId=?;";
		List<Object> arrays = new ArrayList<Object>();
		arrays.add(locationId);
		int result = executeUpdate(sql, arrays);
		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	//��
	@Override
	public boolean updateLocationInfo(int locationId, String locationName) {
		String sql = "UPDATE caigou_location SET locationName=? WHERE locationId=?;";
		List<Object> arrays = new ArrayList<Object>();
		arrays.add(locationName);
		arrays.add(locationId);
		int results = executeUpdate(sql, arrays);
		if (results > 0) {
			return true;
		}
		return false;
	}

	//��
	@Override
	public List<LocationInfoVO> queryLocationInfo(int reservoirId) {
		String sql = "SELECT * FROM caigou_location WHERE reservoirId=?;";
		List<Object> params = new ArrayList<Object>();
		params.add(reservoirId);
		return queryForList(sql, params);
	}
	
	//�������ӳ��
	@Override
	public List<LocationInfoVO> mapRow(ResultSet rs) throws Exception {
		List<LocationInfoVO> arrays = new ArrayList<>();
		LocationInfoVO locationInfo = null;
		while (rs.next()) {
			locationInfo = new LocationInfoVO();
			locationInfo.setLocationId(rs.getInt("locationId"));
			locationInfo.setLocationName(rs.getString("locationName"));
			locationInfo.setReservoirId(rs.getInt("reservoirId"));
			arrays.add(locationInfo);
		}
		return arrays;
	}

}
