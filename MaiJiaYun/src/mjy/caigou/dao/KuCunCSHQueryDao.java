package mjy.caigou.dao;

import java.util.List;

import mjy.caigou.po.KuCunCSHGoods2PO;
import mjy.caigou.po.KuCunCSHGoodsPO;


public interface KuCunCSHQueryDao {
	public List<KuCunCSHGoodsPO> MultiQuery(String buttonValue,String searchValue,String stockStatus,int userId);
	public List<KuCunCSHGoods2PO> getGoodIdById(int warehouseId);
	public int getWarehouseId(String buttonValue,int userId);
	public List<Integer> queryGoodId(int warehouseId);
	public void insertGoodCount(int goodId,int warehouseId,int goodCount,String buttonValue);
	public void updateGoodCount(int goodId,int warehouseId,int goodCount);
}
