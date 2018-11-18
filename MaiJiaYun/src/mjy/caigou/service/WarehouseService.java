package mjy.caigou.service;

import java.util.List;

import mjy.caigou.vo.WarehouseVO;

public interface WarehouseService {

	public List<WarehouseVO> getWarehouse();
	public List<WarehouseVO> getWarehouseByUserId(Integer a);
	public String queryNameById(int warehouseId);
}
