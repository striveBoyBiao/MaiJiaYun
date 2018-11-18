package mjy.caigou.dao;

import java.util.List;

import mjy.caigou.po.PurchaseGoodPO;
import mjy.caigou.vo.GoodsVO;
import mjy.caigou.vo.PurchaseGoodVO;
import mjy.caigou.vo.PurchaseVO;



public interface PurchaseGoodDao {

	public void insert(List<PurchaseGoodVO> array);
	public void insert1(PurchaseGoodVO purchase);
	
	public void update(PurchaseGoodVO purchaseGoodVo);
	public void delete(int purchaseGoodId);
//	public void deleteByPurchaseCode(String purchaseCode);
	public List<PurchaseGoodVO> listBy(PurchaseGoodPO purchaseGoodPo) ;
	public List<GoodsVO> getGoodByPurchaseId(int purchaseId) ;
}
