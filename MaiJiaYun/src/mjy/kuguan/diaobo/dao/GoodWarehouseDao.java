package mjy.kuguan.diaobo.dao;

import java.util.List;

import mjy.kuguan.diaobo.vo.GoodWarehouseVO;

public interface GoodWarehouseDao {
	
	//根据仓库Id查询仓库商品信息
	public List<GoodWarehouseVO> getGoodwarehouse(Integer warehouseId);
}
