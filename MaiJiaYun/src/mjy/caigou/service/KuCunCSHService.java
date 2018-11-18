package mjy.caigou.service;

import java.util.List;

import mjy.caigou.po.KuCunCSHGoodsPO;
import mjy.caigou.vo.GoodsVO;



public interface KuCunCSHService {
	
	public List<String> getWarehouseNames(int userId);
	public List<GoodsVO> getAllGoods(int userId);
	
	public List<KuCunCSHGoodsPO> MultiQuery(String buttonValue, String searchValue, String stockStatus, int userId);
	public void warehouseInit(String buttonValue,String goodsStr,int userId);
	
}
