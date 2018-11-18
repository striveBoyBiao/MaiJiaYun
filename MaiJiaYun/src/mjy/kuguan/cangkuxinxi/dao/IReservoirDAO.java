package mjy.kuguan.cangkuxinxi.dao;

import java.util.List;

import mjy.kuguan.cangkuxinxi.vo.ReservoirInfoVO;

/*
 * 库区
 */
public interface IReservoirDAO {
	
	//增加库区信息
	boolean saveReservoirInfo(ReservoirInfoVO reservoir);
	
	//删除仓库信息
	boolean removeReservoirInfo(int reservoirId);
	
	//修改仓库信息
	boolean updateReservoirInfo(int reservoirId,String reservoirName);
	
	//查询库区信息
	public List<ReservoirInfoVO> queryReservoirInfo(int warehouseId);
	
}
