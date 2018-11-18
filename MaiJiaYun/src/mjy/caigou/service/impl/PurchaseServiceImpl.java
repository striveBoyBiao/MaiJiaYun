package mjy.caigou.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import mjy.caigou.dao.PurchaseDao;

import mjy.caigou.dao.impl.PurchaseDaoImpl;
import mjy.caigou.po.PageInfo;
import mjy.caigou.po.PurchaseGoodPO;
import mjy.caigou.po.PurchasePO;
import mjy.caigou.service.PurchaseGoodService;
import mjy.caigou.service.PurchaseService;
import mjy.caigou.service.SPService;
import mjy.caigou.vo.GoodsVO;
import mjy.caigou.vo.PurchaseGoodVO;
import mjy.caigou.vo.PurchaseVO;
import mjy.caigou.vo.StuEntity;
import mjy.common.util.jdbc.JdbcUtil;
import mjy.common.util.jdbc.TransactionManager;



public class PurchaseServiceImpl implements PurchaseService {

	PurchaseDao purchaseDao = new PurchaseDaoImpl();
	PurchaseGoodService purchaseGoodService=new PurchaseGoodServiceImpl();
	PurchaseGoodPO purchaseGoodPo=new PurchaseGoodPO();

	@Override
	public void insert(PurchaseVO purchaseVo) {
		purchaseDao.insert(purchaseVo);

	}

	@Override
	public void update(PurchaseVO purchaseVo) {
		purchaseDao.update(purchaseVo);

	}

	@Override
	public void delete(int goodId) {

		purchaseDao.delete(goodId);
	}

	@Override
	public void deleteByPurchaseCode(String purchaseCode) {
		purchaseDao.deleteByPurchaseCode(purchaseCode);
		

	}

	@Override
	public List<PurchaseVO> listBy(PurchasePO purchasePo) {

		return purchaseDao.listBy(purchasePo);
	}


	@Override
	public List<PurchaseVO> listBy1(PurchasePO purchasePo) {
		// TODO Auto-generated method stub
		return purchaseDao.listBy1(purchasePo);
	}

	@Override
	public List<PurchaseVO> listBy2(PurchasePO purchasePo) {
		// TODO Auto-generated method stub
		return purchaseDao.listBy2(purchasePo);
	}

	@Override
	public List<PurchaseVO> listBy3(PurchasePO purchasePo) {
		// TODO Auto-generated method stub
		return purchaseDao.listBy3(purchasePo);
	}


	@Override
	public String MaxPurchaseCode(PurchasePO purchasePo) {
		// TODO Auto-generated method stub
		return purchaseDao.MaxPurchaseCode(purchasePo);
	}

	

	@Override
	public PageInfo<PurchaseVO> listByPage(PurchasePO purchasePo, PageInfo<PurchaseVO> page) {
		// ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
		page.setQueryUrl(purchasePo.getQueryUrl());


		// ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ò³ï¿½ï¿½
		int totalRecords = 0;
		if (purchasePo.getState().equals("1")) {
			totalRecords = purchaseDao.getCount(purchasePo, "1");
		}
		
		if (purchasePo.getState().equals("2")) {
			totalRecords = purchaseDao.getCount(purchasePo, "2");
		}
		if (purchasePo.getState().equals("3")) {
			totalRecords = purchaseDao.getCount(purchasePo, "3");
		}
		
//		PageInfo pageInfo = new PageInfo();
		page.setTotalRecords(totalRecords);
		
	//	System.out.println("totalRecords=" + page.getTotalRecords());
	
		
		int pageCount = 0;
		Integer pageSize = page.pageSize;

		if (totalRecords % pageSize == 0) {
			pageCount = totalRecords / pageSize;
		} else {
			pageCount = totalRecords / pageSize + 1;
		}
		page.setPageCount(pageCount);

		//System.out.println("pageCount=" + pageCount);

		// ï¿½ï¿½È¡ï¿½ï¿½Ç°Ò³ï¿½ï¿½ï¿½ï¿½
		List<PurchaseVO> purchases = purchaseDao.listBy2(purchasePo);

		page.setPageData(purchases);
		return page;
	}

	@Override
	public int getCount(PurchasePO purchasePO) {
		return purchaseDao.getCount(purchasePO, null);
	}
	@Override
	public boolean purchaseInsert(PurchaseVO purchaseVo, List<PurchaseGoodVO> array){
		TransactionManager tm=null;
		try {

			tm=JdbcUtil.getTransactionManager();
			// ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ setAutoCommit=false;
			tm.startTransaction();
			
			purchaseDao.insert(purchaseVo);
			
			purchaseGoodService.insert(array);

			// ï¿½á½»ï¿½ï¿½ï¿½ï¿½ ï¿½Ø±ï¿½ï¿½ï¿½ï¿½ï¿½
			tm.commitAndClose();
			return true;
		} catch (Exception ex) {
			// ï¿½Ø¹ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½Ø±ï¿½ï¿½ï¿½ï¿½ï¿½
			tm.rollbackAndClose();
			ex.printStackTrace();
			return false;
		}
	}

	@Override
	public List<StuEntity> getAllByExcel(String file) throws IOException {
		// TODO Auto-generated method stub
		return purchaseDao.getAllByExcel(file);
	}

	@Override
	public PurchaseVO getPurchaseByPK(int purchaseId) {
		
		PurchaseVO PurchaseVo=new PurchaseVO();
		
//		//ÉèÖÃPurchasePO×Ö¶Î
//				PurchasePO purchasePo=new PurchasePO();
//				purchasePo.setUserId(bossId);
//				purchasePo.setPurchaseCode(purchaseCode);
//				purchasePo.setState("1");
//				//µ÷ÓÃPurchaseServiceÖÐlistBy1·½·¨²épurchaseId
//				
//				PurchaseService purchaseService=new PurchaseServiceImpl();
			PurchaseVo=purchaseDao.getPurchaseByPK(purchaseId);
				
		
			
			//µ÷ÓÃPurchaseGoodServiceµÃµ½goodId
			SPService sPService=null;
			List<Object> list1=new ArrayList<>();
//			purchaseGoodService=new PurchaseGoodServiceImpl();
			purchaseGoodPo.setPurchaseId(purchaseId);
			List<PurchaseGoodVO> purchaseGoodVo=purchaseGoodService.listBy(purchaseGoodPo);
//			for (PurchaseGoodVO purchaseGoodVO2 : purchaseGoodVo) {
//				goodId=purchaseGoodVO2.getGoodId();
//				//Í¨¹ýgoodIdµ½good±íÖÐ²éÕÒÉÌÆ·ÐÅÏ¢
//				sPService=new SPServiceImpl();
//				List<GoodsVO> goodsPo=sPService.listByGoodId(goodId);
//		
//				list1.add(goodsPo);
//			}
		
			
			PurchaseVo.setPurchaseGoodsVO(purchaseGoodVo);
			
		
		
		return PurchaseVo;
		
	}
	

}
