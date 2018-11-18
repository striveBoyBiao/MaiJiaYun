package mjy.kuguan.cangkuxinxi.dao;

import java.util.List;

import mjy.kuguan.cangkuxinxi.vo.LocationInfoVO;

/*
 * 库位
 */
public interface ILocationDAO {
	
	//添加库位信息
	public boolean saveLocationDao(LocationInfoVO location);
	
	//删除仓库信息
	boolean removeLocationInfo(int locationId);
	
	//修改仓库信息
	boolean updateLocationInfo(int locationId,String locationName);
	
	//查询库位信息
	public List<LocationInfoVO> queryLocationInfo(int reservoirId);
	
}
