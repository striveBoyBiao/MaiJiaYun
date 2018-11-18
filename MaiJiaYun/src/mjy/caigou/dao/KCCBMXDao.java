package mjy.caigou.dao;

import java.util.List;

import mjy.caigou.vo.KCCBMXVO;

public interface KCCBMXDao {

	//查询库存明细
	public List<KCCBMXVO> querykccbmx(int goodId,int warehouseId );
}
