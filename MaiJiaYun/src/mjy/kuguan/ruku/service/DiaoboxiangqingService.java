package mjy.kuguan.ruku.service;

import java.util.List;

import mjy.kuguan.ruku.dao.DiaoborukuDao;
import mjy.kuguan.ruku.dao.DiaoboxiangqingDao;
import mjy.kuguan.ruku.factory.DaoImplFactory;
import mjy.kuguan.ruku.po.DiaoborukuPO;
import mjy.kuguan.ruku.po.DiaoboxiangqingPO;

public class DiaoboxiangqingService {
	private DiaoboxiangqingDao diaoboxiangqingDao = DaoImplFactory.getDiaoboxiangqingDaoImpl();
	private DiaoborukuDao diaoborukuDao = DaoImplFactory.getDiaoborukuDaoImpl();
	
	public List<DiaoboxiangqingPO> getAll(int bossId, String diaoboxiangqingCode){
		return diaoboxiangqingDao.getSelectByCode(bossId, diaoboxiangqingCode);
	}
	
	public void setInCount(int bossId, String diaoboxiangqingCode, String diaoboxiangqingSku, int diaoboxiangqingInFinish){
		diaoboxiangqingDao.setInFinish(bossId, diaoboxiangqingCode, diaoboxiangqingSku, diaoboxiangqingInFinish);
	}
	
	public void setInGoodsNote(int bossId, String diaoboxiangqingCode, String diaoboxiangqingSku, String diaoboxiangqingNote){
		diaoboxiangqingDao.setNote(bossId, diaoboxiangqingCode, diaoboxiangqingSku, diaoboxiangqingNote);
	}
	
	public void setInCount(int bossId, String diaoboxiangqingCode){
		int inCount = 0;
		List<DiaoboxiangqingPO> list = diaoboxiangqingDao.getSelectByCode(bossId, diaoboxiangqingCode);
		
		for (DiaoboxiangqingPO po : list) {
			inCount += po.getDiaoboxiangqingInFinish();
		}
		
		diaoborukuDao.setInFinish(bossId, diaoboxiangqingCode, inCount);
	}
	
	/**
	 * 确认入库完成
	 * @param bossId
	 * @param diaoboxiangqingCode
	 * @param checker
	 */
	public void inWarehouse(int bossId, String diaoboxiangqingCode, int checker){
		//获取需要完成入库的数据
		DiaoborukuPO diaoborukuPO = diaoborukuDao.getSelectByCode(bossId, diaoboxiangqingCode, 1, 1).get(0);
		DaoImplFactory.getDiaoboTransaction().diaoboruku(bossId, diaoborukuPO, checker);
	}
}
