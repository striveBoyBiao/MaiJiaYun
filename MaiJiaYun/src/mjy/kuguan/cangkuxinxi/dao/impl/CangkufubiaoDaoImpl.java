package mjy.kuguan.cangkuxinxi.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.common.util.jdbc.BaseDao;
import mjy.kuguan.cangkuxinxi.dao.CangkufubiaoDao;
import mjy.kuguan.cangkuxinxi.dao.ReservoirAndLocationVO;
import mjy.kuguan.cangkuxinxi.po.ReservoirAndLocationPO;

public class CangkufubiaoDaoImpl extends BaseDao<ReservoirAndLocationVO> implements CangkufubiaoDao {

	@Override
	public void insertInfo(ReservoirAndLocationVO rlVO) {
		String sql = "insert into caigou_cangkufubiao value(?,?,?,?,?)";
		List<Object> list = new ArrayList<>();
		list.add(rlVO.getWareHouseId());
		list.add(rlVO.getReservoirId());
		list.add(rlVO.getReservoirName());
		list.add(rlVO.getLocationName());
		list.add(rlVO.getLocationId());
		this.SaveOrUpdate(sql, list);
	}

	@Override
	public List<ReservoirAndLocationVO> listBy(ReservoirAndLocationPO rlPO) {
		String sql = "select * from caigou_cangkufubiao where wareHouseId=?";
		List<Object> list = new ArrayList<>();
		list.add(rlPO.getWareHouseId());
		return this.queryForList(sql, list);
	}

	@Override
	public List<ReservoirAndLocationVO> mapRow(ResultSet rs) throws Exception {
		List<ReservoirAndLocationVO> list = new ArrayList<>();
		while(rs.next()){
			ReservoirAndLocationVO rlVO = new ReservoirAndLocationVO();
			rlVO.setWareHouseId(rs.getInt("wareHouseId"));
			rlVO.setReservoirId(rs.getInt("reservoirId"));
			rlVO.setReservoirName(rs.getString("reservoirName"));
			rlVO.setLocationId(rs.getInt("locationId"));
			rlVO.setLocationName(rs.getString("locationName"));
			list.add(rlVO);
		}
		return list;
	}

	@Override
	public void deleteInfo(ReservoirAndLocationPO rlPO) {
		String sql = "delete from caigou_cangkufubiao where wareHouseId=? and reservoirId=? and locationId=?";
		List<Object> list = new ArrayList<>();
		list.add(rlPO.getWareHouseId());
		list.add(rlPO.getReservoirId());
		list.add(rlPO.getLocationId());
		this.SaveOrUpdate(sql, list);
	}
}
