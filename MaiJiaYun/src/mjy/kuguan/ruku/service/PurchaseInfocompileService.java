package mjy.kuguan.ruku.service;

import java.util.ArrayList;
import java.util.List;

import javax.sound.midi.MidiDevice.Info;
import javax.swing.plaf.synth.SynthSpinnerUI;

import mjy.kuguan.ruku.caigou.vo.CaigouXiangQingVO;
import mjy.kuguan.ruku.dao.CaigourukuDao;
import mjy.kuguan.ruku.dao.CaigouxiangqingDao;
import mjy.kuguan.ruku.dao.impl.CaigouTransaction;
import mjy.kuguan.ruku.dao.impl.CaigourukuDaoImpl;
import mjy.kuguan.ruku.dao.impl.CaigouxiangqingDaoImpl;
import mjy.kuguan.ruku.po.CaigourukuPO;
import mjy.kuguan.ruku.po.CaigouxiangqingPO;





public class PurchaseInfocompileService {
	CaigouxiangqingDao cd = new CaigouxiangqingDaoImpl();
	//���ݲɹ�����Ż�ȡ����
	public List<CaigouxiangqingPO> getPurchaseInfocompile(int id,String PurchaseNote){
		List<CaigouxiangqingPO> list = new ArrayList<>();
		list = cd.getSelectByCode(id,PurchaseNote);
		/*CaigouxiangqingPO cpo = new CaigouxiangqingPO();
		cpo.setCaigouxiangqingName("����");
		cpo.setCaigouxiangqingAttribute("����");
		cpo.setCaigouxiangqingSku("AAAAAAAAAA");
		cpo.setCaigouxiangqingInNeed(10);
		cpo.setCaigouxiangqingInFinish(5);
		list.add(cpo);
		list.add(cpo);*/
		
		
		return list;
		
	}
	
	//���ݴ�������VO�ж����޸Ļ���ɾ������    ������ģ��ȷ�����Ĳ���
	public void addInfoCompile(int id,String note,List<CaigouXiangQingVO> list,int wanchengChecker){
		List<CaigouxiangqingPO> Infolist = cd.getSelectByCode(id,note);
		CaigourukuDao cg = new CaigourukuDaoImpl();
		List<CaigourukuPO> listCrk = cg.getSelectByCode(id,note,1,1000000);
		int finishNum = listCrk.get(0).getCaigouInFinish();
		int num = 0;
		int allCount = 0;
		for (CaigouXiangQingVO caigouXiangQingVO : list) {
			//���ݵ��Ż�ȡ����������Ϣ��Infolist����
			int no = caigouXiangQingVO.getNumber();
			int need = Infolist.get(no).getCaigouxiangqingInNeed();
			int finfish = Infolist.get(no).getCaigouxiangqingInFinish();
			int count = caigouXiangQingVO.getNum();
			if((need-finfish)==caigouXiangQingVO.getNum()){
				num++;
			}
	//		System.out.println(note);
	//		System.out.println(Infolist.get(no).getCaigouxiangqingSku());
	//		System.out.println(count+finfish);
			//����list  ����list�е�numberΪ�±�õ�Infolist�е�û�������������ȷ�����޸Ļ���ɾ��    �����뱸ע
			cd.setInFinish(id,note, Infolist.get(no).getCaigouxiangqingSku(), (count+finfish));
	//		System.out.println(caigouXiangQingVO.getMemo());
			cd.setNote(id,note, Infolist.get(no).getCaigouxiangqingSku(), caigouXiangQingVO.getMemo());
			allCount += (count);
		}
	//	System.out.println(allCount);
	//	System.out.println(allCount+finishNum);
		new CaigourukuDaoImpl().setInFinish(id,note, allCount+finishNum);
		if(allCount+finishNum == listCrk.get(0).getCaigouInCount()){
			CaigourukuPO caigourukuPO = new CaigourukuDaoImpl().getSelectByCode(id, note, 1, 10).get(0);
			new CaigouTransaction().caigouruku(id, caigourukuPO, wanchengChecker);
		//	new CaigourukuDaoImpl().getDelete(id,note);
		}
	}
	
	public int getCountInfo(int id,String note){
		CaigouxiangqingDao cd = new CaigouxiangqingDaoImpl();
		if(cd.getSelectByCode(id,note)==null){
			return 0;
		}
		return cd.getSelectByCode(id,note).size();
	}
	
}
