package mjy.kuguan.cangkuxinxi.dao;

import java.util.List;

import mjy.kuguan.cangkuxinxi.po.ReservoirAndLocationPO;

public interface CangkufubiaoDao {
	void insertInfo(ReservoirAndLocationVO rlVO);
	void deleteInfo(ReservoirAndLocationPO rlPO);
	List<ReservoirAndLocationVO> listBy(ReservoirAndLocationPO rlPO);
}
