package mjy.kuguan.cangkuxinxi.service.impl;

import java.util.List;

import mjy.kuguan.cangkuxinxi.dao.IReservoirDAO;
import mjy.kuguan.cangkuxinxi.dao.impl.ReservoirDAOImpl;
import mjy.kuguan.cangkuxinxi.service.IReservoirServlet;
import mjy.kuguan.cangkuxinxi.vo.ReservoirInfoVO;

public class ReservoirServletImpl implements IReservoirServlet {
	IReservoirDAO reservoir = new ReservoirDAOImpl();
	
	@Override
	public boolean saveReservoirInfo(ReservoirInfoVO reservoirInfoVO) {
		return reservoir.saveReservoirInfo(reservoirInfoVO);
	}
	
	@Override
	public boolean removeReservoirInfo(int reservoirId) {
		return reservoir.removeReservoirInfo(reservoirId);
	}

	@Override
	public boolean updateReservoirInfo(int reservoirId, String reservoirName) {
		return reservoir.updateReservoirInfo(reservoirId, reservoirName);
	}
	
	@Override
	public List<ReservoirInfoVO> queryReservoirInfo(int warehouseId) {
		return reservoir.queryReservoirInfo(warehouseId);
	}
	
}
