package mjy.kuguan.ruku.service;

import java.util.ArrayList;
import java.util.List;

import mjy.caigou.dao.GoodsDao;
import mjy.caigou.dao.PurchaseDao;
import mjy.caigou.dao.impl.GoodsDaoImpl;
import mjy.caigou.dao.impl.PurchaseDaoImpl;
import mjy.caigou.po.PurchasePO;
import mjy.caigou.vo.PurchaseGoodVO;
import mjy.caigou.vo.PurchaseVO;
import mjy.kuguan.ruku.dao.CaigourukuDao;
import mjy.kuguan.ruku.dao.CaigouxiangqingDao;
import mjy.kuguan.ruku.dao.RuKuCaigoudanDao;
import mjy.kuguan.ruku.dao.impl.RuKuCaigoudanDaoImpl;
import mjy.kuguan.ruku.factory.DaoImplFactory;
import mjy.kuguan.ruku.factory.PersistentObjectFactory;
import mjy.kuguan.ruku.po.CaigourukuPO;
import mjy.kuguan.ruku.po.CaigouxiangqingPO;

public class CaigourukudanUpdateService {

	CaigourukuDao caigourukuDao = DaoImplFactory.getCaigourukuDaoImpl();
	CaigouxiangqingDao caigouxiangqingDao = DaoImplFactory.getCaigouxiangqingDaoImpl();
	PurchaseDao purchaseDao = new PurchaseDaoImpl();
	RuKuCaigoudanDao rukuCaigoudanDao = new RuKuCaigoudanDaoImpl();
	GoodsDao goodsDao = new GoodsDaoImpl();
	
	//判断采购入库单是否新增
	public List<PurchaseVO> isUpdate(int bossId){

		//获取正在入库单数
		int rukuInCount = caigourukuDao.getAllCount(bossId);
		//获取采购审核已完成，已付款单数
		PurchasePO po = new PurchasePO();
		po.setUserId(bossId);
		po.setState("3");
		po.setStorageState("未入库");
		List<PurchaseVO> list = purchaseDao.listBy3(po);
		
		if(list.size() > rukuInCount){
			return list;
		}
		
		return null;
	}
	
	//新增采购入库单
	public void updateCaigourukudan(int bossId, int authorUserId){
		
		//新增采购入库单
		List<PurchaseVO> caigouList;
		if((caigouList = isUpdate(bossId)) != null){

			//获取正在入库单单号
			List<CaigourukuPO> rukuList = DaoImplFactory.getCaigourukuDaoImpl().getSelectAll(bossId, 1, DaoImplFactory.getCaigourukuDaoImpl().getAllCount(bossId));
			List<String> rukudanList = new ArrayList<String>();
			
			for (CaigourukuPO po : rukuList) {
				rukudanList.add(po.getCaigouCode());
			}

			CaigourukuPO caigourukuPO = null;
			CaigouxiangqingPO caigouxiangqingPO = null;
			for (PurchaseVO vo : caigouList) {
				//如果单号已存在，跳过
				if(rukudanList.contains(vo.getPurchaseCode())){
					continue;
				}
				
				caigourukuPO = PersistentObjectFactory.getCaigourukuPO();
				caigourukuPO.setCaigouCode("RK" + vo.getPurchaseCode());
				caigourukuPO.setCaigouCaigoudanCode(vo.getPurchaseCode());
				caigourukuPO.setCaigouWarehouse(vo.getWareHouseId() + "");
				caigourukuPO.setCaigouInCount(vo.getPurchaseNumber());
				caigourukuPO.setCaigouInFinish(0);
				caigourukuPO.setCaigouSetTime(vo.getCreatTime().toString());
				caigourukuPO.setCaigouAuthor(authorUserId + "");
				
				//将数据插入采购入库表
				caigourukuDao.getInsert(bossId, caigourukuPO);
				
				//将该单详情插入采购入库详情表
				List<PurchaseGoodVO> goodsList = rukuCaigoudanDao.getPurchaseGoodsInfo(bossId, vo.getPurchaseCode());
				if(goodsList == null){
					continue;
				}
				for (PurchaseGoodVO goodsVO : goodsList) {
					
					caigouxiangqingPO = PersistentObjectFactory.getCaigouxiangqingPO();
					caigouxiangqingPO.setCaigouxiangqingId(Thread.currentThread().hashCode() + "-" + System.currentTimeMillis());
					caigouxiangqingPO.setCaigouxiangqingCode("RK" + vo.getPurchaseCode());
					caigouxiangqingPO.setCaigouxiangqingSku(goodsDao.queryGoodInfoById(goodsVO.getGoodId()).getSku());
					caigouxiangqingPO.setCaigouxiangqingName(goodsDao.queryGoodInfoById(goodsVO.getGoodId()).getGoodName());
					caigouxiangqingPO.setCaigouxiangqingAttribute("[属性作废]");
					caigouxiangqingPO.setCaigouxiangqingInNeed(Integer.parseInt(goodsVO.getPurchaseNum()));
					
					caigouxiangqingDao.getInsert(bossId, caigouxiangqingPO);
				}
			}
		}
	}
//	public static void main(String[] args) {
//		new CaigourukudanUpdateService().updateCaigourukudan(10001,10001);
//	}
}
