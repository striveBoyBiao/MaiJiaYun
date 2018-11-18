package mjy.caiwu.fukuan.service.impl;

import java.util.List;

import mjy.caiwu.fukuan.beans.FuKuanPO;
import mjy.caiwu.fukuan.beans.FuKuanVo;
import mjy.caiwu.fukuan.beans.PageInfo;
import mjy.caiwu.fukuan.dao.PaginationDao;
import mjy.caiwu.fukuan.dao.ShouldpayDao;
import mjy.caiwu.fukuan.dao.impl.PaginationDaoImpl;
import mjy.caiwu.fukuan.dao.impl.ShouldpayDaoImpl;
import mjy.caiwu.fukuan.service.ShouldpayService;

public class ShouldpayServiceImpl implements ShouldpayService{

	private ShouldpayDao sd=new ShouldpayDaoImpl();
	private PaginationDao pd=new PaginationDaoImpl();

	@Override
	public void Pay(FuKuanVo spv) {
		sd.Pay(spv);
		
	}

	@Override
	public void Bad_Pay(FuKuanVo spv) {
		sd.Bad_Pay(spv);
		
	}

	@Override
	public List<FuKuanVo> getDetailDate(String fkNo) {

		return sd.getDetailDate(fkNo);
	}

	@Override
	public void insertPayMoney(FuKuanVo fkv) {
		sd.insertPayMoney(fkv);
		
	}

	@Override
	public void updateBankAccount(FuKuanVo fkv) {
		sd.updateBankAccount(fkv);
		
	}

	@Override
	public List<FuKuanVo> listByPage(FuKuanPO fkp, int fkState,PageInfo<FuKuanVo> page,int bossId) {
		
		return sd.listByPage(fkp, fkState,page,bossId);
	}

	@Override
	public int getCount(FuKuanPO fkp, int fkState,int bossId) {
		
		return pd.getCount(fkp, fkState,bossId);
	}

	@Override
	public PageInfo<FuKuanVo> showPagination(FuKuanPO fkp,PageInfo<FuKuanVo> page,int fkState,int bossId) {
		
		//设置请求参数
		page.setQueryParam(fkp.getQueryurl());
		
		//计算页面条数
		int rowCount=pd.getCount(fkp, fkState,bossId);
		int pageCount=0;
		int pageSize=page.getPageSize();
		
		if(rowCount%pageSize==0){
			pageCount=rowCount/pageSize;
		}else{
			pageCount=rowCount/pageSize+1;
		}
		
		page.setPageCount(pageCount);
		List<FuKuanVo> fukuanVO=sd.listByPage(fkp, fkState,page,bossId);
		page.setPageDate(fukuanVO);
		
		return page;
	}

	@Override
	public void updateCaigouState(String paymentState, String fkNo,int userId) {
		sd.updateCaigouState(paymentState, fkNo,userId);
		
	}

	@Override
	public void insertFromBackGood(FuKuanVo fkv) {
		sd.insertFromBackGood(fkv);
		
	}

}
