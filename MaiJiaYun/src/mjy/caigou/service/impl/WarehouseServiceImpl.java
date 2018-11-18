package mjy.caigou.service.impl;

import java.util.List;

import mjy.caigou.dao.WarehouseDao;
import mjy.caigou.dao.impl.WarehouseDaoImpl;
import mjy.caigou.service.WarehouseService;
import mjy.caigou.vo.WarehouseVO;

public class WarehouseServiceImpl implements WarehouseService {

	WarehouseDao wd=new WarehouseDaoImpl();
	@Override
	public List<WarehouseVO> getWarehouse() {
		// TODO Auto-generated method stub
		return wd.getWarehouse();
	}
	@Override
	public List<WarehouseVO> getWarehouseByUserId(Integer a) {
		
		return wd.getWarehouseByUserId(a);
	}
	@Override
	public String queryNameById(int warehouseId) {
		// TODO Auto-generated method stub
		return wd.queryNameById(warehouseId);
	}

}
