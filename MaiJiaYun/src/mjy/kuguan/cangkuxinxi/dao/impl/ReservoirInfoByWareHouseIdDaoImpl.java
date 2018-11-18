package mjy.kuguan.cangkuxinxi.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.kuguan.cangkuxinxi.dao.BaseDAO;
import mjy.kuguan.cangkuxinxi.dao.ReservoirInfoByWareHouseIdDao;
import mjy.kuguan.cangkuxinxi.po.LocationInfoPO;
import mjy.kuguan.cangkuxinxi.po.ReservoirAndLocationPO;
import mjy.kuguan.cangkuxinxi.po.ReservoirInfoPO;
import mjy.kuguan.cangkuxinxi.vo.ReservoirInfoByWareHouseIdVO;

public class ReservoirInfoByWareHouseIdDaoImpl extends BaseDAO<ReservoirInfoByWareHouseIdVO>
		implements ReservoirInfoByWareHouseIdDao {

	@Override
	public List<ReservoirInfoByWareHouseIdVO> mapRow(ResultSet rs) throws Exception {
		List<ReservoirInfoByWareHouseIdVO> list = new ArrayList<>();
		while (rs.next()) {
			ReservoirInfoByWareHouseIdVO rVO = new ReservoirInfoByWareHouseIdVO();
			rVO.setReservoirId(rs.getInt("reservoirId"));
			rVO.setReservoirName(rs.getString("reservoirName"));
			rVO.setLocationId(rs.getInt("locationId"));
			rVO.setLocationName(rs.getString("locationName"));
			list.add(rVO);
		}
		return list;
	}

	@Override
	public List<ReservoirInfoByWareHouseIdVO> listByWareHouseId(ReservoirInfoPO reservoirPO) {
		String sql = "select rr.reservoirId,reservoirName,locationId,locationName from caigou_reservoir rr join caigou_location lt on rr.reservoirId=lt.reservoirId where wareHouseId=?";
		List<Object> list = new ArrayList<>();
		list.add(reservoirPO.getWarehouseId());
		return this.queryForList(sql, list);
	}

	@Override
	public List<ReservoirInfoByWareHouseIdVO> listReservoirAndLocation(ReservoirAndLocationPO rlPO) {
		String sql = "select rr.reservoirId,reservoirName,locationId,locationName from caigou_reservoir rr join caigou_location lt on rr.reservoirId=lt.reservoirId where wareHouseId=? and rr.reservoirId=? and locationId=?";
		List<Object> list = new ArrayList<>();
		list.add(rlPO.getWareHouseId());
		list.add(rlPO.getReservoirId());
		list.add(rlPO.getLocationId());
		return this.queryForList(sql, list);
	}
	
	@Override
	public void deleteReservoirInfo(LocationInfoPO locationPO) {
		String sql = "delete from caigou_location where locationId=?";
		List<Object> list = new ArrayList<>();
		list.add(locationPO.getLocationId());
		this.executeUpdate(sql, list);
	}

	@Override
	public List<ReservoirInfoByWareHouseIdVO> listByReservoirId(ReservoirInfoPO reservoirPO) {
		String sql = "select * from caigou_goodwarehouse gw join caigou_reservoir rr on gw.wareHouseId=rr.wareHouseId join caigou_location lt on lt.reservoirId=rr.reservoirId  where gw.wareHouseId=? and lt.reservoirId=?";
		List<Object> list = new ArrayList<>();
		list.add(reservoirPO.getWarehouseId());
		list.add(reservoirPO.getReservoirId());
		return this.queryForList(sql, list);
	}

}
