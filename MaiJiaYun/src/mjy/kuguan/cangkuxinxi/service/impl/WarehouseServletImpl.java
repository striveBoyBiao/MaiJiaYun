package mjy.kuguan.cangkuxinxi.service.impl;

import java.util.List;

import mjy.kuguan.cangkuxinxi.dao.IWarehouseDAO;
import mjy.kuguan.cangkuxinxi.dao.impl.WarehouseDAOImpl;
import mjy.kuguan.cangkuxinxi.service.IWarehouseServlet;
import mjy.kuguan.cangkuxinxi.vo.WarehouseInfoVO;

public class WarehouseServletImpl implements IWarehouseServlet {
	IWarehouseDAO warehouse = new WarehouseDAOImpl();
	
	@Override
	public boolean saveWarehouseInfo(WarehouseInfoVO warehouseInfoVO) {
		return warehouse.saveWarehouseInfo(warehouseInfoVO);
	}
	
	@Override
	public boolean removeWarehouseInfo(int warehouseId) {
		return warehouse.removeWarehouseInfo(warehouseId);
	}
	
	@Override
	public boolean updateWarehouseInfo(int warehouseId, String warehouseName) {
		return warehouse.updateWarehouseInfo(warehouseId, warehouseName);
	}
	
	@Override
	public List<WarehouseInfoVO> queryWarehouseInfo() {
		return warehouse.queryWarehouseInfo();
	}

}
