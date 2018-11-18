package mjy.kuguan.ruku.service;

import java.util.ArrayList;
import java.util.List;

import mjy.kuguan.ruku.dao.impl.DiaoborukuDaoImpl;
import mjy.kuguan.ruku.factory.DaoImplFactory;
import mjy.kuguan.ruku.po.DiaoborukuPO;

public class DiaoborukuService {
	
	private DiaoborukuDaoImpl diaoborukuDaoImpl = DaoImplFactory.getDiaoborukuDaoImpl();
	
	public List<DiaoborukuPO> selectAll(int bossId, int pageNumber, int pageSize){
		return diaoborukuDaoImpl.getSelectAll(bossId, pageNumber, pageSize);
	}
	
	public List<DiaoborukuPO> selectByCode(int bossId, int pageNumber, int pageSize, String diaoboCode){
		return diaoborukuDaoImpl.getSelectByCode(bossId, diaoboCode, pageNumber, pageSize);
	}
	
	public List<DiaoborukuPO> selectByDiaobodanCode(int bossId, int pageNumber, int pageSize, String diaoboDiaobodanCode){
		return diaoborukuDaoImpl.getSelectByDiaobodanCode(bossId, diaoboDiaobodanCode, pageNumber, pageSize);
	}
	
	public List<DiaoborukuPO> selectByAuthor(int bossId, int pageNumber, int pageSize, String diaoboAuthor){
		return diaoborukuDaoImpl.getSelectByAuthor(bossId, diaoboAuthor, pageNumber, pageSize);
	}
	
	public List<DiaoborukuPO> selectByWarehouse(int bossId, int pageNumber, int pageSize, String diaoboWarehouse){
		return diaoborukuDaoImpl.getSelectByWarehouse(bossId, diaoboWarehouse, pageNumber, pageSize);
	}
	
	public int allCount(int bossId){
		return diaoborukuDaoImpl.getAllCount(bossId);
	}
	
	public int countByCode(int bossId, String diaoboCode){
		return diaoborukuDaoImpl.getCountByCode(bossId, diaoboCode);
	}
	
	public int countByDiaobodanCode(int bossId, String diaoboDiaobodanCode){
		return diaoborukuDaoImpl.getCountByDiaobodanCode(bossId, diaoboDiaobodanCode);
	}
	
	public int countByAuthor(int bossId, String diaoboAuthor){
		return diaoborukuDaoImpl.getCountByAuthor(bossId, diaoboAuthor);
	}
	
	public int countByWarehouse(int bossId, String diaoboWarehouse){
		return diaoborukuDaoImpl.getCountByWarehouse(bossId, diaoboWarehouse);
	}
	
	public List<String> allWarehouse(int bossId){
		return diaoborukuDaoImpl.getAllWarehouse(bossId);
	}
	
	public void setInFinish(int bossId, String diaoboCode, int diaoboInFinish){
		diaoborukuDaoImpl.setInFinish(bossId, diaoboCode, diaoboInFinish);
	}
	
	public void setNote(int bossId, String diaoboCode, String diaoboNote){
		diaoborukuDaoImpl.setNote(bossId, diaoboCode, diaoboNote);
	}
	
	public String getNote(int bossId, String diaoboCode){
		List<DiaoborukuPO> list = diaoborukuDaoImpl.getSelectByCode(bossId, diaoboCode, 1, 1);
		return list.get(0).getDiaoboNote();
	}
	
	public List<Integer> getOtherPageDataCount(int bossId){
		List<Integer> list = new ArrayList<Integer>();
		
		list.add(DaoImplFactory.getCaigourukuDaoImpl().getAllCount(bossId));
		list.add(DaoImplFactory.getTuihuorukuDaoImpl().getAllCount(bossId));
		list.add(diaoborukuDaoImpl.getAllCount(bossId));
		
		return list;
	}
}
