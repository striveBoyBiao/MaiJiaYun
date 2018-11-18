package mjy.kuguan.chukudan.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import mjy.kuguan.chukudan.dao.IChuKuDanDao;
import mjy.kuguan.chukudan.dao.impl.ChuKuDanImpl;
import mjy.kuguan.chukudan.po.ChuKuDanPO;
import mjy.kuguan.chukudan.po.Pager;
import mjy.kuguan.chukudan.service.IChuKuDanService;



public class ChuKuDanServiceImpl implements IChuKuDanService {
	private IChuKuDanDao chukudandao = new ChuKuDanImpl();
	
	@Test
	public void testss(){

	}
	
	
	
	@Override
	public Pager<ChuKuDanPO> getAllcgu(int pageNum, int pageSize, String chukuNum,String cangku) {
		if(chukudandao.getcgCount(chukuNum,cangku)==0){
			return null;
		}else{
			Pager<ChuKuDanPO> caigou=new Pager<>();
			caigou.setPageNum(pageNum);
			caigou.setPageSize(pageSize);
			caigou.setTotal(chukudandao.getcgCount(null,null));
			caigou.setMaxNum(chukudandao.getcgCount(chukuNum,cangku));
			caigou.setTotal1(chukudandao.gettbCount(null,null));
			caigou.setData(chukudandao.getAllcgu(pageNum, pageSize, chukuNum,cangku));
			caigou.setCangkus(chukudandao.getCangku());
			return caigou;
		}
	}

	@Override
	public Pager<ChuKuDanPO> getAlltb(int pageNum, int pageSize, String chukuNum,String cangku) {
		if(chukudandao.gettbCount(chukuNum,cangku)==0){
			return null;
		}else{
			Pager<ChuKuDanPO> diaobo=new Pager<>();
			diaobo.setPageNum(pageNum);
			diaobo.setPageSize(pageSize);
			diaobo.setMaxNum(chukudandao.gettbCount(chukuNum,cangku));
			diaobo.setTotal(chukudandao.gettbCount(null,null));
			diaobo.setTotal1(chukudandao.getcgCount(null,null));
			diaobo.setData(chukudandao.getAlltb(pageNum, pageSize, chukuNum,cangku));
			diaobo.setCangkus(chukudandao.getCangku());
			return diaobo;
		}
	}


	@Override
	public Pager<ChuKuDanPO> getAllywc(int pageNum, int pageSize, String chukuNum,String cangku) {
//		System.out.println("dsadadsads");
		if(chukudandao.getywcCount(chukuNum,cangku)==0){
//			System.out.println("null");
			return null;
		}else{
//			System.out.println("bushi");
			Pager<ChuKuDanPO> yiwancheng=new Pager<>();
			yiwancheng.setPageNum(pageNum);
			yiwancheng.setPageSize(pageSize);
			yiwancheng.setMaxNum(chukudandao.getywcCount(chukuNum,cangku));
			yiwancheng.setTotal(chukudandao.getywcCount(null,null));
			yiwancheng.setTotal1(chukudandao.getcgCount(null,null));
			yiwancheng.setTotal2(chukudandao.gettbCount(null,null));
			yiwancheng.setData(chukudandao.getAllywc(pageNum, pageSize, chukuNum,cangku));
			yiwancheng.setCangkus(chukudandao.getCangku());
			return yiwancheng;
		}
	}



	
}
