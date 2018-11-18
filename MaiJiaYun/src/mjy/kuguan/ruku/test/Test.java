package mjy.kuguan.ruku.test;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import mjy.caigou.dao.impl.WarehouseDaoImpl;
import mjy.kuguan.ruku.dao.impl.CaigouTransaction;
import mjy.kuguan.ruku.dao.impl.CaigourukuDaoImpl;
import mjy.kuguan.ruku.dao.impl.CaigouxiangqingDaoImpl;
import mjy.kuguan.ruku.dao.impl.DiaoboxiangqingDaoImpl;
import mjy.kuguan.ruku.dao.impl.TuihuoTransaction;
import mjy.kuguan.ruku.factory.DaoImplFactory;
import mjy.kuguan.ruku.factory.PersistentObjectFactory;
import mjy.kuguan.ruku.po.CaigourukuPO;
import mjy.kuguan.ruku.po.CaigouxiangqingPO;
import mjy.kuguan.ruku.po.DiaoborukuPO;
import mjy.kuguan.ruku.po.DiaoboxiangqingPO;
import mjy.kuguan.ruku.po.TuihuorukuPO;
import mjy.kuguan.ruku.po.TuihuoxiangqingPO;
import mjy.kuguan.ruku.po.WanchengPO;

public class Test {
	public static void main(String[] args) {
//		CaigourukuPO po = null;
//		
//		for (int i = 1; i < 10; i++) {
//			po = PersistentObjectFactory.getCaigourukuPO();
//			po.setCaigouAuthor("10001");
//			po.setCaigouCaigoudanCode("CG20161206003"+i);
//			po.setCaigouCode("RKCG20161206003"+i);
//			po.setCaigouInCount(100);
//			po.setCaigouInFinish(0);
//			po.setCaigouNote("这是备注");
//			po.setCaigouSetTime("2016-12-2 9:55:00");
//			po.setCaigouWarehouse((int)((i+1)/2) + "");
//			new CaigourukuDaoImpl().getInsert(10001, po);
//		}
//		
		
//	DaoImplFactory.getCaigourukuDaoImpl().getDelete(10001, "RKCG201612060029");
		
		
		
		
		
		
//		CaigourukuPO po = null;
		
//		for (int i = 1; i < 10; i++) {
//			po = PersistentObjectFactory.getCaigourukuPO();
//			po.setCaigouAuthor("Blue");
//			po.setCaigouCaigoudanCode("CG20161202000"+i);
//			po.setCaigouCode("RKCG20161202000"+i);
//			po.setCaigouInCount(100);
//			po.setCaigouInFinish(0);
//			po.setCaigouNote("这是备注");
//			po.setCaigouSetTime("2016-12-2 9:55:00");
//			po.setCaigouWarehouse("默认仓库");
//			new CaigourukuDaoImpl().getInsert(po);
//		}
//		for (int i = 10; i < 20; i++) {
//			po = PersistentObjectFactory.getCaigourukuPO();
//			po.setCaigouAuthor("Blue");
//			po.setCaigouCaigoudanCode("CG2016120200"+i);
//			po.setCaigouCode("RKCG2016120200"+i);
//			po.setCaigouInCount(100);
//			po.setCaigouInFinish(0);
//			po.setCaigouNote("这是备注");
//			po.setCaigouSetTime("2016-12-2 9:55:00");
//			po.setCaigouWarehouse("仓库"+(new Random().nextInt(3) + 1));
//			new CaigourukuDaoImpl().getInsert(po);
//		}
		

		

//		List<CaigourukuPO> list =  DaoImplFactory.getCaigourukuDaoImpl().getSelectAll(5,2);
//		for (CaigourukuPO po : list) {
//			System.out.println(po.getCaigouCode());
//		}
//
//		System.out.println(new WarehouseDaoImpl().queryNameById(1));
		
//		List<CaigourukuPO> list =  DaoImplFactory.getCaigourukuDaoImpl().getSelectByCode(10001,"02",1,100);
//		for (CaigourukuPO po : list) {
//			System.out.println(po.getCaigouCode());
//			System.out.println(po.getCaigouWarehouse());
//		}
//		


//		System.out.println(new CaigourukuDaoImpl().getAllCount(10001));
		
		

		
		
//		List<String> list = new CaigourukuDaoImpl().getAllWarehouse(10001);
//		
//		for (String string : list) {
//			System.out.println(string);
//		}
		
//		new CaigourukuDaoImpl().setInFinish(10001, "RKCG201612060001", 10);
//		new CaigourukuDaoImpl().setNote(10001, "RKCG201612060001", "一颗塞梯的");
//		System.out.println(new CaigourukuDaoImpl().getWarehouseByCode(10001, "RKCG201612060003"));
		
//		for (CaigourukuPO po : new CaigourukuDaoImpl().getSelectAll(10001, 2, 10)) {
//			System.out.println(po.getCaigouCode());
//		}
		
//		CaigouxiangqingPO po = null; 
//		CaigouxiangqingDaoImpl caigou = new CaigouxiangqingDaoImpl();
//		for (int i = 0; i < 10; i++) {
//			po = PersistentObjectFactory.getCaigouxiangqingPO();
//			po.setCaigouxiangqingAttribute("商品属性（作废）");
//			po.setCaigouxiangqingCode("RKCG20161206000" + i);
//			po.setCaigouxiangqingInFinish(0);
//			po.setCaigouxiangqingInNeed(10);
//			po.setCaigouxiangqingName("100003");
//			po.setCaigouxiangqingNote("2333");
//			po.setCaigouxiangqingSku("100003-1");
//			po.setCaigouxiangqingWarehouse(((int)((i+1)/2))+"");
//			caigou.getInsert(10001,po);
//		}
//		CaigouxiangqingPO po = PersistentObjectFactory.getCaigouxiangqingPO();
//		po = PersistentObjectFactory.getCaigouxiangqingPO();
//		po.setCaigouxiangqingAttribute("商品属性（作废）");
//		po.setCaigouxiangqingCode("CG201612020001");
//		po.setCaigouxiangqingId("CGXQID"+System.currentTimeMillis());
//		po.setCaigouxiangqingInFinish(0);
//		po.setCaigouxiangqingInNeed(10);
//		po.setCaigouxiangqingName("大衣");
//		po.setCaigouxiangqingNote("2333");
//		po.setCaigouxiangqingSku("100003-1");
//		po.setCaigouxiangqingWarehouse("默认仓库");
//		CaigouxiangqingDaoImpl caigou = new CaigouxiangqingDaoImpl();
//		caigou.getInsert(po);
		
//		CaigouxiangqingPO po = new CaigouxiangqingPO();
//		List<CaigouxiangqingPO> list = new CaigouxiangqingDaoImpl().getSelectByCode(10001,"RKCG201612060001");
//		for (CaigouxiangqingPO c : list) {
//			System.out.println(c.getCaigouxiangqingName());
//		}
	
//		int i = new CaigouxiangqingDaoImpl().getInAllow(10001, "RKCG201612060001", "100001-1");
//		System.out.println(i);
		
//		new CaigouxiangqingDaoImpl().setInFinish(10001, "RKCG201612060001", "100001-1", 3);
//		new CaigouxiangqingDaoImpl().setNote(10001, "RKCG201612060001", "100002-1", "两颗塞梯的");
//		new CaigouxiangqingDaoImpl().getDelete(10001, "RKCG201612060009");
		
//		for (int i = 0; i < 10; i++) {
//			WanchengPO po = PersistentObjectFactory.getWanchengPO();
//			po.setWanchengCode("RK20161206000"+i);
//			po.setWanchengXiangguanCode("20161206000"+i);
//			po.setWanchengType("销售退货入库");
//			po.setWanchengInCount(50);
//			po.setWanchengSetTime("2016-12-7 20:35:30");
//			po.setWanchengAuthor("10001");
//			po.setWanchengChecker("10001");
//			po.setWanchengCheckTime("2016-12-7 21:36:00");
//			po.setWanchengNote("23333");
//			DaoImplFactory.getWanchengrukuDaoImpl().getInsert(10001,po);
//		}
		
		
//		System.out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		

//		CaigourukuPO po = DaoImplFactory.getCaigourukuDaoImpl().getSelectByCode(10001, "RKCG201612060019", 1, 1).get(0);
////		
//		CaigouTransaction cgt = new CaigouTransaction();
//		cgt.caigouruku(10001, po, 10002);
//
//		TuihuorukuPO po;
//		for (int i = 0; i < 10; i++) {
//			po = PersistentObjectFactory.getTuihuorukuPO();
//			po.setTuihuoCode("RK2016120600000000002" + i);
//			po.setTuihuoTuihuodanCode("RK2016120600000000002" + i);
//			po.setTuihuoWarehouse((new Random().nextInt(5)+1)+"");
//			po.setTuihuoInCount(100);
//			po.setTuihuoInFinish(0);
//			po.setTuihuoSetTime("2016-12-6 15:12:43");
//			po.setTuihuoAuthor("10001");
//			po.setTuihuoNote("this is note");
//			DaoImplFactory.getTuihuorukuDaoImpl().getInsert(10001,po);
//		}


//		List<TuihuorukuPO> list = DaoImplFactory.getTuihuorukuDaoImpl().getSelectAll(10001,1,100);
//		for (TuihuorukuPO t : list) {
//			System.out.println(t.getTuihuoCode());
//		}

//		System.out.println(DaoImplFactory.getTuihuorukuDaoImpl().getWarehouseByCode(10001, "RK20161206000000000011"));
		
//		int i =DaoImplFactory.getTuihuorukuDaoImpl().getAllCount(10001);
//		System.out.println(i);

//		List<String> list = DaoImplFactory.getTuihuorukuDaoImpl().getAllWarehouse(10001);
//		for (String s : list) {
//			System.out.println(s);
//		}
		
		
//		DaoImplFactory.getTuihuorukuDaoImpl().setInFinish(10001,"RK20161206000000000001", 23);
//		DaoImplFactory.getTuihuorukuDaoImpl().setNote(10001,"RK20161206000000000001", "yikedaitide");

//		TuihuoxiangqingPO po =null;
//		for (int i = 0; i < 10; i++) {
//
//			po = PersistentObjectFactory.getTuihuoxiangqingPO();
//			po.setTuihuoxiangqingCode("RK2016120600000000000" + i);
//			po.setTuihuoxiangqingSku("100002-1");
//			po.setTuihuoxiangqingName("100002");
//			po.setTuihuoxiangqingAttribute("无属性");
//			po.setTuihuoxiangqingWarehouse("" + (int)((i+2)/2));
//			po.setTuihuoxiangqingInNeed(50);
//			po.setTuihuoxiangqingInOk(0);
//			po.setTuihuoxiangqingInBroken(0);
//			po.setTuihuoxiangqingInLost(0);
//			po.setTuihuoxiangqingNote("2333");
//			
//			DaoImplFactory.getTuihuoxiangqingDaoImpl().getInsert(10001,po);	
//		}
//		TuihuoxiangqingPO po =null;
//			po = PersistentObjectFactory.getTuihuoxiangqingPO();
//			po.setTuihuoxiangqingId("THXQID" + System.currentTimeMillis());
//			po.setTuihuoxiangqingCode("RK20161202123456789000");
//			po.setTuihuoxiangqingSku("100003-1");
//			po.setTuihuoxiangqingName("大衣");
//			po.setTuihuoxiangqingAttribute("无属性");
//			po.setTuihuoxiangqingWarehouse("默认仓库");
//			po.setTuihuoxiangqingInNeed(50);
//			po.setTuihuoxiangqingInOk(0);
//			po.setTuihuoxiangqingInBroken(0);
//			po.setTuihuoxiangqingInLost(0);
//			po.setTuihuoxiangqingNote(">_<");
//			
//			DaoImplFactory.getTuihuoxiangqingDaoImpl().getInsert(po);	
		
		
//		System.out.println(DaoImplFactory.getTuihuoxiangqingDaoImpl().getInNeed(10001, "RK20161206000000000000", "100001-1"));
//		DaoImplFactory.getTuihuoxiangqingDaoImpl().setInNumber(10001, "RK20161206000000000000", "100001-1", 20, 15, 15);
		
//		DaoImplFactory.getTuihuoxiangqingDaoImpl().setNote(10001, "RK20161206000000000000", "100001-1", "这是大衣");

//		TuihuorukuPO po = DaoImplFactory.getTuihuorukuDaoImpl().getSelectByCode(10001,"RK20161206000000000001", 1, 1).get(0);
//		System.out.println(po.getTuihuoCode());
		
//		TuihuorukuPO po = DaoImplFactory.getTuihuorukuDaoImpl().getSelectByCode(10001, "RK20161206000000000029", 1, 1).get(0);
//		TuihuoTransaction tht = new TuihuoTransaction();
//		tht.tuihuoruku(10001, po, 10001);
		
//		for (int i = 0; i < 10; i++) {
//			DiaoborukuPO po = PersistentObjectFactory.getDiaoborukuPO();
//			po.setDiaoboCode("RKDB201612060007" + i);
//			po.setDiaoboDiaobodanCode("DB201612060007" + i);
//			po.setDiaoboWarehouse(""+(new Random().nextInt(5)+1));
//			po.setDiaoboInCount(50);
//			po.setDiaoboInFinish(0);
//			po.setDiaoboSetTime("2016-12-8 20:27:23");
//			po.setDiaoboAuthor("10001");
//			po.setDiaoboNote("");
//			DaoImplFactory.getDiaoborukuDaoImpl().getInsert(10001, po);
//		}


//		List<DiaoborukuPO> list = new ArrayList<>();
//		list = DaoImplFactory.getDiaoborukuDaoImpl().getSelectAll(2, 2);
//		for (DiaoborukuPO po : list) {
//			System.out.println(po.getDiaoboCode());
//		}
		
//		List<DiaoborukuPO> list = new ArrayList<>();
//		list = DaoImplFactory.getDiaoborukuDaoImpl().getSelectAll(10001, 1, 5);
//		for (DiaoborukuPO po : list) {
//			System.out.println(po.getDiaoboCode());
//			System.out.println(po.getDiaoboWarehouse());
//		}
		
//		System.out.println(DaoImplFactory.getDiaoborukuDaoImpl().getAllCount(10001));
		
//		List<String> list = DaoImplFactory.getDiaoborukuDaoImpl().getAllWarehouse(10001);
//		for (String string : list) {
//			System.out.println(string);
//		}
		
//		DaoImplFactory.getDiaoborukuDaoImpl().setInFinish(10001,"RKDB2016120600001", 11);
//		DaoImplFactory.getDiaoborukuDaoImpl().setNote(10001,"RKDB2016120600001", "ttttt");
		
//		DiaoboxiangqingDaoImpl db = DaoImplFactory.getDiaoboxiangqingDaoImpl();
//		for (int i = 0; i < 10; i++) {
//			DiaoboxiangqingPO po = PersistentObjectFactory.getDiaoboxiangqingPO();
//
//			po.setDiaoboxiangqingCode("RKDB201612060000" + i);
//			po.setDiaoboxiangqingSku("100002-1");
//			po.setDiaoboxiangqingName("100002");
//			po.setDiaoboxiangqingAttribute("none");
//			po.setDiaoboxiangqingWarehouse(""+(new Random().nextInt(5)+1));
//			po.setDiaoboxiangqingInNeed(10);
//			po.setDiaoboxiangqingInFinish(0);
//			po.setDiaoboxiangqingNote("233");
//			
//			db.getInsert(10001,po);
//		}

//		DiaoboxiangqingDaoImpl db = DaoImplFactory.getDiaoboxiangqingDaoImpl();
//			DiaoboxiangqingPO po = PersistentObjectFactory.getDiaoboxiangqingPO();
//			po.setDiaoboxiangqingId("DBXQID" + System.currentTimeMillis());
//			po.setDiaoboxiangqingCode("RKDB1480415000000");
//			po.setDiaoboxiangqingSku("100003-1");
//			po.setDiaoboxiangqingName("大衣");
//			po.setDiaoboxiangqingAttribute("none");
//			po.setDiaoboxiangqingWarehouse("默认仓库");
//			po.setDiaoboxiangqingInNeed(10);
//			po.setDiaoboxiangqingInFinish(0);
//			po.setDiaoboxiangqingNote("233");
//			
//			db.getInsert(po);
		
//		db.getInsert(po);
		
//		DiaoboxiangqingDaoImpl db = DaoImplFactory.getDiaoboxiangqingDaoImpl();
//		List<DiaoboxiangqingPO> list = db.getSelectByCode(10001,"RKDB2016120600001");
//		System.out.println(list);
//		for (DiaoboxiangqingPO dpo : list) {
//			System.out.println(dpo.getDiaoboxiangqingWarehouse());
//		}
		
//		db.setInFinish(10001,"RKDB2016120600001", "100001-1", 2);
//		db.setNote(10001,"RKDB2016120600001", "100001-1", "yikesiaidifisdifisdfisdifisdf");
		
//		DiaoborukuPO po = DaoImplFactory.getDiaoborukuDaoImpl().getSelectByCode(10001,"RKDB2016120600029", 1, 1).get(0);
//		DaoImplFactory.getDiaoboTransaction().diaoboruku(10001, po, 10002);
	}

}
