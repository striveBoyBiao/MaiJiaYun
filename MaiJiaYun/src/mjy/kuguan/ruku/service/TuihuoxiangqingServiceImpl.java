package mjy.kuguan.ruku.service;

import java.util.ArrayList;
import java.util.List;

import mjy.kuguan.ruku.dao.TuihuorukuDao;
import mjy.kuguan.ruku.dao.TuihuoxiangqingDao;
import mjy.kuguan.ruku.dao.impl.TuihuoTransaction;
import mjy.kuguan.ruku.dao.impl.TuihuorukuDaoImpl;
import mjy.kuguan.ruku.dao.impl.TuihuoxiangqingDaoImpl;
import mjy.kuguan.ruku.po.TuihuorukuPO;
import mjy.kuguan.ruku.po.TuihuoxiangqingPO;



public class TuihuoxiangqingServiceImpl {
	TuihuoxiangqingDao td = new TuihuoxiangqingDaoImpl();
	/**
	 * ���ݵ��Ż�ȡ����
	 * @return
	 */
	public List<TuihuoxiangqingPO> getXiangqing(int id,String Note){
	//	System.out.println(Note);
		List<TuihuoxiangqingPO> list = new ArrayList<>();
		list = td.getSelectByCode(id,Note);
	
		return list;
	}
	public int getXiangqingByNote(String note){
		return 0;
	}
	
	public void removeByPruchaseNote(int id,String note,int wanchengChecker){
		TuihuoTransaction tt =  new TuihuoTransaction();
		TuihuorukuDao  tr = new TuihuorukuDaoImpl();
		List<TuihuorukuPO>list= tr.getSelectByCode(id,note, 1, 100000);
		tt.tuihuoruku(id,list.get(0), wanchengChecker);
		
		
	}
	
	public void setInOkLostBroken(int id,List<TuihuoxiangqingPO>list,String memo){
		for (TuihuoxiangqingPO tuihuoxiangqingPO : list) {
			td.setInNumber(id,tuihuoxiangqingPO.getTuihuoxiangqingCode(), tuihuoxiangqingPO.getTuihuoxiangqingSku(), tuihuoxiangqingPO.getTuihuoxiangqingInOk(), tuihuoxiangqingPO.getTuihuoxiangqingInBroken(), tuihuoxiangqingPO.getTuihuoxiangqingInLost());
			td.setNote(id,tuihuoxiangqingPO.getTuihuoxiangqingCode(), tuihuoxiangqingPO.getTuihuoxiangqingSku(), tuihuoxiangqingPO.getTuihuoxiangqingNote());
		}
		TuihuorukuDao  tr = new TuihuorukuDaoImpl();
		tr.setNote(id,list.get(0).getTuihuoxiangqingCode(), memo);
	}
	
	
}
