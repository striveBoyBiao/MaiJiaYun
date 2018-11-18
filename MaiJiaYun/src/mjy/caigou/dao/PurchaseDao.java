package mjy.caigou.dao;

import java.io.IOException;
import java.util.List;

import mjy.caigou.po.DetailsPO;
import mjy.caigou.po.GoodsPO;
import mjy.caigou.po.PurchasePO;
import mjy.caigou.po.SupplierPO;
import mjy.caigou.vo.GoodsVO;
import mjy.caigou.vo.PurchaseVO;
import mjy.caigou.vo.StuEntity;
import mjy.caigou.vo.SupplierVO;
import mjy.caigou.vo.WarehouseVO;



public interface PurchaseDao {
	
	public int getCount(PurchasePO purchasePo,String str);		
	public void insert(PurchaseVO purchaseVo);
	public void update(PurchaseVO purchaseVo);
	public PurchaseVO getPurchaseByPK(int purchaseId);
	
	public void delete(int goodId);
	
	public void deleteByPurchaseCode(String purchaseCode);
	public List<PurchaseVO> listBy(PurchasePO purchasePO) ;
	public List<PurchaseVO> listBy1(PurchasePO purchasePO) ;
	public List<PurchaseVO> listBy2(PurchasePO purchasePO) ;
	public List<PurchaseVO> listBy3(PurchasePO purchasePO) ;
	public String MaxPurchaseCode(PurchasePO purchasePo);
	public  List<StuEntity> getAllByExcel(String file)throws IOException;
	public List<DetailsPO> listByXQ(DetailsPO deta, String str);
//	public List<GoodsVO> listByGoods(GoodsPO GoodsPo) ;
//	public List<WarehouseVO> listByWarehouse(WarehouseVO WarehouseVo) ;
//	public List<SupplierVO> listBySupplier(SupplierPO PupplierVo) ;
	
//	String MaxPurchaseCode(PurchasePO purchasePo);
}
