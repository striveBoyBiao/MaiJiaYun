package mjy.kuguan.ruku.service;

import java.util.ArrayList;
import java.util.List;

import mjy.kuguan.ruku.dao.CaigourukuDao;
import mjy.kuguan.ruku.dao.DiaoborukuDao;
import mjy.kuguan.ruku.dao.TuihuorukuDao;
import mjy.kuguan.ruku.dao.impl.CaigourukuDaoImpl;
import mjy.kuguan.ruku.dao.impl.DiaoborukuDaoImpl;
import mjy.kuguan.ruku.dao.impl.TuihuoTransaction;
import mjy.kuguan.ruku.dao.impl.TuihuorukuDaoImpl;
import mjy.kuguan.ruku.po.TuihuorukuPO;
import mjy.kuguan.ruku.util.PageInfoBean;


/**
 * 获取全部的退后List集合
 * @author student
 *
 */
public class TuihuoServiceImpl {
	TuihuorukuDao tr = new TuihuorukuDaoImpl();
	
	
	
	
	public PageInfoBean<TuihuorukuPO> getAllPageInfo(int id,PageInfoBean pb){
		PageInfoBean<TuihuorukuPO>  pageInfoBean = new PageInfoBean();
		
		pageInfoBean.setRowCount(tr.getAllCount(id)+"");
		pageInfoBean.setList(tr.getSelectAll(id,Integer.parseInt(pb.getPageNo()), pb.pageSize));
		int num = tr.getAllCount(id);
		if(num%pb.pageSize==0){
			pageInfoBean.setPageCount(num/pb.pageSize+"");
		}else{
			pageInfoBean.setPageCount(num/pb.pageSize+1+"");
		}
		pageInfoBean.setQueryParm(pb.getQueryParm());
		pageInfoBean.setPageNo(pb.getPageNo());
		return pageInfoBean;
	}
	
	public List<String> getAllWareHouse(int id){
		List<String> list = tr.getAllWarehouse(id);
		return list;
		
		
	}
	
	public int getCaigouNo(int id){
		int i = 0;
		CaigourukuDao cd = new CaigourukuDaoImpl();
		i = cd.getAllCount(id);
		return i;
	}
	public int getDiaoboNo(int id){
		int i = 0;
		DiaoborukuDao dd = new DiaoborukuDaoImpl();
		i = dd.getAllCount(id);
		return i;
	}
	
	public PageInfoBean<TuihuorukuPO> getSelectTuihuo(int id,PageInfoBean<TuihuorukuPO> pb,String Info){
		PageInfoBean<TuihuorukuPO>  pageInfoBean = new PageInfoBean();
		if(tr.getSelectByCode(id,Info,Integer.parseInt(pb.getPageNo()), pb.pageSize)!=null&&tr.getSelectByCode(id,Info,Integer.parseInt(pb.getPageNo()), pb.pageSize).size()!=0){
			pageInfoBean.setList(tr.getSelectByCode(id,Info,Integer.parseInt(pb.getPageNo()), pb.pageSize));
			int num =tr.getSelectByCode(id,Info,1,100000).size();
			pageInfoBean.setRowCount(tr.getSelectByCode(id,Info,1,100000).size()+"");
			if(num%pb.pageSize==0){
				pageInfoBean.setPageCount(num/pb.pageSize+"");
			}else{
				pageInfoBean.setPageCount(num/pb.pageSize+1+"");
			}
		}else{
			pageInfoBean.setList(tr.getSelectByAuthor(id,Info,Integer.parseInt(pb.getPageNo()), pb.pageSize));
			int num =tr.getSelectByAuthor(id,Info,1,100000).size();
			pageInfoBean.setRowCount(tr.getSelectByAuthor(id,Info,1,100000).size()+"");
			if(num%pb.pageSize==0){
				pageInfoBean.setPageCount(num/pb.pageSize+"");
			}else{
				pageInfoBean.setPageCount(num/pb.pageSize+1+"");
			}
			
			
		}
		
		pageInfoBean.setQueryParm(pb.getQueryParm());
		pageInfoBean.setPageNo(pb.getPageNo());
		
		return pageInfoBean;
	}
	
	public PageInfoBean<TuihuorukuPO> getSelectTuihuoByhouse(int id,PageInfoBean<TuihuorukuPO> pb,String ware){
		PageInfoBean<TuihuorukuPO>  pageInfoBean = new PageInfoBean();
		int num = 0;
		pageInfoBean.setList(tr.getSelectByWarehouse(id,ware,Integer.parseInt(pb.getPageNo()), pb.pageSize));
		if(tr.getSelectByWarehouse(id,ware,1,100000)==null){
			num = 0;
		}else{
			num =tr.getSelectByWarehouse(id,ware,1,100000).size();
		}
		
		pageInfoBean.setRowCount(num+"");
		if(num%pb.pageSize==0){
			pageInfoBean.setPageCount(num/pb.pageSize+"");
		}else{
			pageInfoBean.setPageCount(num/pb.pageSize+1+"");
		}
		pageInfoBean.setQueryParm(pb.getQueryParm());
		pageInfoBean.setPageNo(pb.getPageNo());
		
		return pageInfoBean;
	}
	
	
	
}
