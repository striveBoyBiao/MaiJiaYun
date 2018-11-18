package mjy.caigou.service;

import java.io.IOException;
import java.util.List;


import mjy.caigou.po.GoodsPO;
import mjy.caigou.po.PageInfo;
import mjy.caigou.po.PurchasePO;
import mjy.caigou.po.SupplierPO;

import mjy.caigou.vo.GoodsVO;
import mjy.caigou.vo.PurchaseGoodVO;
import mjy.caigou.vo.PurchaseVO;
import mjy.caigou.vo.StuEntity;
import mjy.caigou.vo.SupplierVO;
import mjy.caigou.vo.WarehouseVO;



public interface PurchaseService {
	
	PageInfo<PurchaseVO> listByPage(PurchasePO purchasePO, PageInfo<PurchaseVO> page);
	
	int getCount(PurchasePO purchasePO);
	
	public void insert(PurchaseVO purchase);
	public void update(PurchaseVO purchase);
	public PurchaseVO getPurchaseByPK(int purchaseId);
	public void delete(int goodId);
	public void deleteByPurchaseCode(String purchaseCode);
	public List<PurchaseVO> listBy(PurchasePO purchasePo) ;
	public List<PurchaseVO> listBy1(PurchasePO purchasePo) ;
	public List<PurchaseVO> listBy2(PurchasePO purchasePo) ;
	public List<PurchaseVO> listBy3(PurchasePO purchasePo) ;
	public String MaxPurchaseCode(PurchasePO purchasePo);
	public boolean purchaseInsert(PurchaseVO purchaseVo, List<PurchaseGoodVO> array);
	public  List<StuEntity> getAllByExcel(String file)throws IOException;
//	public List<GoodsVO> listByGoods(GoodsPO GoodsPo) ;
//	public List<WarehouseVO> listByWarehouse(WarehouseVO WarehouseVo);
//	public List<SupplierVO> listBySupplier(SupplierPO PupplierVo) ;
}