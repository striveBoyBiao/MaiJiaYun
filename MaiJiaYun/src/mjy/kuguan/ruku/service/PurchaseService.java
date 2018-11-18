package mjy.kuguan.ruku.service;

import java.util.ArrayList;
import java.util.List;

import mjy.kuguan.diaobo.dao.DiaobodanDao;
import mjy.kuguan.diaobo.dao.impl.DiaobodanDaoImpl;
import mjy.kuguan.ruku.dao.CaigourukuDao;
import mjy.kuguan.ruku.dao.DiaoborukuDao;
import mjy.kuguan.ruku.dao.TuihuorukuDao;
import mjy.kuguan.ruku.dao.impl.CaigouTransaction;
import mjy.kuguan.ruku.dao.impl.CaigourukuDaoImpl;
import mjy.kuguan.ruku.dao.impl.DiaoborukuDaoImpl;
import mjy.kuguan.ruku.dao.impl.TuihuorukuDaoImpl;
import mjy.kuguan.ruku.po.CaigourukuPO;
import mjy.kuguan.ruku.util.PageInfo;




public class PurchaseService {
	//锟斤拷取list锟斤拷锟斤拷
	CaigourukuDao ckd = new CaigourukuDaoImpl();
	public List<CaigourukuPO> getPruchaseInfoVO(int id){
		List<CaigourukuPO> list = new ArrayList<>();
		
		
		list =  ckd.getSelectAll(id,1, 10000);
		/*CaigourukuPO cpo = new CaigourukuPO();
		cpo.setCaigouCode("11111111111111");
		cpo.setCaigouCaigoudanCode("aaaaa");
		cpo.setCaigouWarehouse("默锟较仓匡拷");
		cpo.setCaigouInCount(10);
		cpo.setCaigouInFinish(0);
		cpo.setCaigouAuthor("锟斤拷锟斤拷员");
		list.add(cpo);
		list.add(cpo);*/
		return list;
	}
	
	public int getTuihuoNo(int id){
		int i = 0;
		TuihuorukuDao td = new TuihuorukuDaoImpl();
		i = td.getAllCount(id);
		
		return i;
	}
	
	
	public int getDiaoboNo(int id){
		int i = 0;
		DiaoborukuDao dd = new DiaoborukuDaoImpl();
		i = dd.getAllCount(id);
		
		return i;
	}
	
	public PageInfo getAllPageInfo( int id,PageInfo pageinfo){
		
		PageInfo pi = new PageInfo();
		pi.pageSize = pageinfo.pageSize;
		pi.setList(ckd.getSelectAll(id,Integer.parseInt(pageinfo.getPageNo()),pageinfo.pageSize));
		pi.setRowCount(ckd.getAllCount(id)+"");
		int PageNum = ckd.getAllCount(id)/pageinfo.pageSize;
		if(ckd.getAllCount(id)%pageinfo.pageSize==0){
			pi.setPageCount((PageNum)+"");
		}else{
			pi.setPageCount((PageNum+1)+"");
		}
	//	System.out.println(pageinfo.getPageNo());
	//	System.out.println("getAll");
	//	System.out.println(pi.getList().size());
		pi.setPageNo(pageinfo.getPageNo());
		return pi;
	}
	
	
	//锟斤拷锟捷仓匡拷锟脚伙拷取锟斤拷锟斤拷
	
	
	public PageInfo getPageInfoBywarehouse(int id,PageInfo pageInfo,String house){
		PageInfo pi = new PageInfo();
		pi.pageSize = pageInfo.pageSize;
		pi.setList(ckd.getSelectByWarehouse(id,house,Integer.parseInt(pageInfo.getPageNo()),pageInfo.pageSize));
		pi.setRowCount(ckd.getSelectByWarehouse(id,house,1,10000).size()+"");
		int PageNum = ckd.getSelectByWarehouse(id,house,1,10000).size()/pi.pageSize;
		if(ckd.getSelectByWarehouse(id,house,1,10000).size()%pi.pageSize==0){
			pi.setPageCount((PageNum)+"");
		}else{
			pi.setPageCount((PageNum+1)+"");
		}
//		pi.setQueryParm(pageInfo.getRowCount());
//		System.out.println(house);
//		System.out.println(pageInfo.getPageNo());
		pi.setPageNo(pageInfo.getPageNo());
		return pi;
	}
	
	
	
	//锟斤拷锟斤拷锟杰憋拷注
	public void addMemo(int id,String caigouCode,String memo){
		
		ckd.setNote(id,caigouCode, memo);
		
		
	}
	
	//锟斤拷锟截采癸拷锟斤拷
	public boolean deletePruchase(int id,String note){
		
		
		
		
		
		//Integer.parseInt(note);
		//锟斤拷锟斤拷锟斤拷锟斤拷锟角革拷锟狡筹拷锟斤拷锟斤拷
		ckd.getDelete(id,note);
//		System.out.println("delete");
		//锟节采癸拷锟斤拷锟斤拷锟斤拷锟斤拷锟�
		return true;
	}
	
	public List<CaigourukuPO> getPruchaseBywarehouse(int id,String house){
		List<CaigourukuPO> list = new ArrayList<>();
		list = ckd.getSelectByWarehouse(id,house,1,10000);
		return list;
	}
	
	
	public PageInfo getPruchaseBywarehouseAndPage(int id,PageInfo pi,String ware){
		List<CaigourukuPO> list = new ArrayList<>();
		int sum = 0;
		if(ware!=null||!ware.equals("")){
			if(ckd.getSelectByWarehouse(id,ware,1,10000)==null){
				sum = 0;
			}else{
				sum = ckd.getSelectByWarehouse(id,ware,1,10000).size();
			}
			
		}
		if(ware.equals("")){
			if(ckd.getSelectAll(id,1, 1000000) == null){
				sum = 0;
			}else{
				sum = ckd.getSelectAll(id,1, 1000000).size();
			}
			
		}
		PageInfo pageInfo = new PageInfo();
		pageInfo.pageSize = pi.pageSize;
		int PageNum = sum/pi.pageSize;
		if(sum%pi.pageSize==0){
			pageInfo.setPageCount((PageNum)+"");
		}else{
			pageInfo.setPageCount((PageNum+1)+"");
		}
		if(ware!=null||!ware.equals("")){
			list = ckd.getSelectByWarehouse(id,ware,Integer.parseInt(pi.getPageNo()),pi.pageSize);
		}
	//	System.out.println(ware);
		if(ware.equals("")){
			list = ckd.getSelectAll(id,Integer.parseInt(pi.getPageNo()), pi.pageSize);
		}
		pageInfo.setPageNo(pi.getPageNo());
		pageInfo.setList(list);
		pageInfo.setRowCount(sum+"");
		pageInfo.setQueryParm(pi.getQueryParm());
		return pageInfo;
	}
	
	public PageInfo getSelectPruchase(int id,PageInfo pi,String info){
		List<CaigourukuPO> list = new ArrayList<>();
		int sum = 0;
		if(ckd.getSelectByAuthor(id,info,1,1000)!=null){
			sum = ckd.getSelectByAuthor(id,info,1,10000).size();
		}else{
			sum = ckd.getSelectByCode(id,info,1,101010).size();
			
		}
		PageInfo pageInfo = new PageInfo();
		pageInfo.pageSize = pi.pageSize;
		int PageNum = sum/pi.pageSize;
		if(sum%pi.pageSize==0){
			pageInfo.setPageCount((PageNum)+"");
		}else{
			pageInfo.setPageCount((PageNum+1)+"");
		}
		
		if(ckd.getSelectByAuthor(id,info,1,1000)!=null){
			list = ckd.getSelectByAuthor(id,info,Integer.parseInt(pi.getPageNo()),pi.pageSize);
		}else{
			list = ckd.getSelectByCode(id,info,Integer.parseInt(pi.getPageNo()),pi.pageSize);
			
		}
		
		pageInfo.setPageNo(pi.getPageNo());
		pageInfo.setList(list);
		pageInfo.setRowCount(sum+"");
		pageInfo.setQueryParm(pi.getQueryParm());
		return pageInfo;
	}
}
