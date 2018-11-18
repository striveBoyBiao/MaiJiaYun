package mjy.caiwu.fukuan.service.impl;
import java.util.List;

import mjy.caiwu.fukuan.beans.FuKuanVo;
import mjy.caiwu.fukuan.beans.WcPageInfo;
import mjy.caiwu.fukuan.dao.Wait_checkDao;
import mjy.caiwu.fukuan.service.Wait_checkService;
/**
 *待财务审核
 * @author student
 *
 */
public class Wait_checkServiceImpl implements Wait_checkService{
	//通过注入获取
	private Wait_checkDao wcDao;
	
	public void setWcDao(Wait_checkDao wcDao) {
		this.wcDao = wcDao;
	}

	/**
	 * 从付款中查询数据
	 *
	 */
	@Override
	public WcPageInfo<FuKuanVo> queryFk(WcPageInfo<FuKuanVo> page,int bossId) {
		List<Integer> allId=wcDao.selectEmployeeBossID(bossId);
		WcPageInfo<FuKuanVo> pageInfo=listByPage(page,allId);
		List<FuKuanVo> fuKuan=wcDao.queryFk(allId);
		pageInfo.setPageDate(fuKuan);
		if(pageInfo.getPageDate().size()>0){
			pageInfo.getPageDate().get(0).setOther4(wcDao.queryCount(allId));
			pageInfo.getPageDate().get(0).setOther6(wcDao.queryCount(allId));
		}else{
			pageInfo.setQueryCount(wcDao.queryCount(allId));
		}
		return pageInfo;
	}

	/**
	 * 从采购中查询数据
	 *
	 */
	@Override
	public List<FuKuanVo> queryCg(String purchaseCode) {
		
		return wcDao.queryCg(purchaseCode);
	}

	/**
	 * 将数据插入到付款单中
	 */
	@Override
	public void insert(List<FuKuanVo> waitCheck) {
		
		wcDao.insert(waitCheck);
	}

	/**
	 * 查询有多少条数据
	 */
	@Override
	public int queryCount(List<Integer> allId) {
		
		return wcDao.queryCount(allId);
	}

	/**
	 * 修改付款单的状态为2
	 */
	@Override
	public void update(String id) {
		wcDao.update(id);
		
	}

	/**
	 *模糊查询数据
	 */
	@Override
	public WcPageInfo<FuKuanVo> querySelect(String str,WcPageInfo<FuKuanVo> page,int bossId) {
		List<Integer> allId=wcDao.selectEmployeeBossID(bossId);
		WcPageInfo<FuKuanVo> pageInfo=listByPage(page,str,allId);
		List<FuKuanVo> list=wcDao.querySelect(str,allId);
		pageInfo.setPageDate(list);
		if(pageInfo.getPageDate().size()>0){
			pageInfo.getPageDate().get(0).setOther4(wcDao.queryCount(allId));
			pageInfo.getPageDate().get(0).setOther6(wcDao.queryCount(str,allId));
		}else{
			pageInfo.setQueryCount(wcDao.queryCount(allId));
		}
		return pageInfo;
	}

	/**
	 * 获取银行卡ID
	 */
	@Override
	public List<Integer> queryfkzhBankId(int bossId) {
		
		return wcDao.queryfkzhBankId(bossId);
	}

	/**
	 *删除数据
	 */
	@Override
	public void delete(String id) {
		wcDao.delete(id);
		
	}

	/**
	 *修改采购单的状态为1
	 */
	@Override
	public void updataCaoGou(String id){
		wcDao.updataCaoGou(id);
		
	}
	
	/**
	 *修改采购单的状态为3
	 */
	@Override
	public void updataCgState(String id) {
		
		wcDao.updataCgState(id);
	}

	
	/**
	 * 分页设置
	 */
	@Override
	public WcPageInfo<FuKuanVo> listByPage(WcPageInfo<FuKuanVo> page,List<Integer> allId) {
		int rowCount = wcDao.queryCount(allId);
		int pageCount = 0;
		int pageSize = page.getPageSize();
		if (rowCount % pageSize == 0) {
			pageCount = rowCount / pageSize;
		} else {
			pageCount = rowCount / pageSize + 1;
		}
		page.setPageCount(pageCount);

		return page;
	}

	/**
	 * 模糊查询有多少条数据
	 */
	@Override
	public int queryCount(String str,List<Integer> allId) {
		
		return wcDao.queryCount(str,allId);
	}

	/**
	 *模糊分页设置
	 */
	@Override
	public WcPageInfo<FuKuanVo> listByPage(WcPageInfo<FuKuanVo> page, String str,List<Integer> allId) {
		int rowCount=wcDao.queryCount(str,allId);
		int pageCount=0;
		int pageSize=page.getPageSize();
		if(rowCount%pageSize==0){
			pageCount=rowCount/pageSize;
		}else{
			pageCount=rowCount/pageSize+1;
		}
		page.setPageCount(pageCount);
		
		return page ;
	}

	/**
	 * 修改创建时间
	 */
	@Override
	public void updateTime(String str) {
		wcDao.updateTime(str);
		
	}
	
	
	
	

}
