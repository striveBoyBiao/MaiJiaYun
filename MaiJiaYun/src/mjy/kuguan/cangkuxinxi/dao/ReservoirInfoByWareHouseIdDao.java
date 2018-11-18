package mjy.kuguan.cangkuxinxi.dao;

import java.util.List;

import mjy.kuguan.cangkuxinxi.po.LocationInfoPO;
import mjy.kuguan.cangkuxinxi.po.ReservoirAndLocationPO;
import mjy.kuguan.cangkuxinxi.po.ReservoirInfoPO;
import mjy.kuguan.cangkuxinxi.vo.ReservoirInfoByWareHouseIdVO;

public interface ReservoirInfoByWareHouseIdDao {
	void deleteReservoirInfo(LocationInfoPO locationPO);
	List<ReservoirInfoByWareHouseIdVO> listReservoirAndLocation(ReservoirAndLocationPO rlPO);
	List<ReservoirInfoByWareHouseIdVO> listByReservoirId(ReservoirInfoPO reservoirPO);
	List<ReservoirInfoByWareHouseIdVO> listByWareHouseId(ReservoirInfoPO reservoirPO);
}
