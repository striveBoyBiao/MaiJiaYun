package mjy.caigou.dao;

import java.util.List;

import mjy.caigou.vo.GoodWarehouseVO;

public interface GoodWarehouseDao {
	List<GoodWarehouseVO> getGoodWarehouseVOs(int goodId);
	public void deleteInfoById(int goodId);
	
	
}
