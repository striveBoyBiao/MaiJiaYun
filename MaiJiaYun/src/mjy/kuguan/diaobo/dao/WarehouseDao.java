package mjy.kuguan.diaobo.dao;

import java.util.List;

import mjy.kuguan.diaobo.vo.WarehouseVO;

	

public interface WarehouseDao{

	public List<WarehouseVO> getWareHouseById(int wareHouseId);
	
	public List<WarehouseVO> getWareHouseByName(String warehouseName);
	
	public List<WarehouseVO> getWarehouseByUserId(Integer userId);
		
	public List<WarehouseVO> getWarehouse();
	
	public String queryNameById(int warehouseId);
}
