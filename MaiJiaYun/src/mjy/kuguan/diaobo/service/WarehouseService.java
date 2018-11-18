package mjy.kuguan.diaobo.service;

import java.util.List;

import mjy.kuguan.diaobo.po.GoodsPO;
import mjy.kuguan.diaobo.vo.WarehouseVO;




public interface WarehouseService {
	
	//根据uerID查询所有仓库名称
	public List<WarehouseVO> getWarehouseName(Integer userId);
	
	//根据仓库名称查询该仓库下的商品
	public List<GoodsPO> getGoods(String warehouseName);
	
}
