package mjy.caigou.dao;

import java.util.List;
import mjy.caigou.vo.WarehouseVO;
	

public interface WarehouseDao{




	
	
	public List<WarehouseVO> getWarehouseById(int userId);
	public List<WarehouseVO> getWarehouse();
	public String queryNameById(int warehouseId);
	public List<WarehouseVO> getWarehouseByUserId(Integer a);
}
