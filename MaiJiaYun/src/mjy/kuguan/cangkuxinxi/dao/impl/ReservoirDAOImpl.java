package mjy.kuguan.cangkuxinxi.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.kuguan.cangkuxinxi.dao.BaseDAO;
import mjy.kuguan.cangkuxinxi.dao.IReservoirDAO;
import mjy.kuguan.cangkuxinxi.vo.ReservoirInfoVO;

/*
 * ����
 */
public class ReservoirDAOImpl extends BaseDAO<ReservoirInfoVO> implements IReservoirDAO {

	//��
	@Override
	public boolean saveReservoirInfo(ReservoirInfoVO reservoir) {
		String sql = "INSERT INTO caigou_reservoir(wareHouseId,reservoirName) VALUES(?,?); ";
		List<Object> arrays = new ArrayList<Object>();
		arrays.add(reservoir.getWarehouseId());
		arrays.add(reservoir.getReservoirName());
		int result = executeUpdate(sql, arrays);
		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	//ɾ
	@Override
	public boolean removeReservoirInfo(int reservoirId) {
		String sql = "DELETE FROM caigou_reservoir WHERE reservoirId=?;";
		List<Object> arrays = new ArrayList<Object>();
		arrays.add(reservoirId);
		int result = executeUpdate(sql, arrays);
		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	//��
	@Override
	public boolean updateReservoirInfo(int reservoirId, String reservoirName) {
		String sql = "UPDATE caigou_reservoir SET reservoirName=? WHERE reservoirId=?;";
		List<Object> arrays = new ArrayList<Object>();
		arrays.add(reservoirName);
		arrays.add(reservoirId);
		int results = executeUpdate(sql, arrays);
		if (results > 0) {
			return true;
		}
		return false;
	}
	
	//��
	@Override
	public List<ReservoirInfoVO> queryReservoirInfo(int warehouseId) {
		String sql = "SELECT reservoirId,wareHouseId,reservoirName FROM caigou_reservoir WHERE wareHouseId=?;";
		List<Object> params = new ArrayList<Object>();
		params.add(warehouseId);
		return queryForList(sql, params);
	}
	
	//�������ӳ��
	@Override
	public List<ReservoirInfoVO> mapRow(ResultSet rs) throws Exception {
		List<ReservoirInfoVO> arrays = new ArrayList<ReservoirInfoVO>();
		ReservoirInfoVO reservoirInfo = null;
		while (rs.next()) {
			reservoirInfo = new ReservoirInfoVO();
			reservoirInfo.setReservoirId(rs.getInt("reservoirId"));
			reservoirInfo.setWarehouseId(rs.getInt("wareHouseId"));
			reservoirInfo.setReservoirName(rs.getString("reservoirName"));
			arrays.add(reservoirInfo);
		}
		return arrays;
	}

}
