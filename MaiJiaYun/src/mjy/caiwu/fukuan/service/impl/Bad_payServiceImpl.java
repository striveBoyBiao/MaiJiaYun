package mjy.caiwu.fukuan.service.impl;

import java.util.List;
import mjy.caiwu.fukuan.beans.FuKuanPO;
import mjy.caiwu.fukuan.beans.FuKuanVo;
import mjy.caiwu.fukuan.beans.PageInfo;
import mjy.caiwu.fukuan.dao.Bad_payDao;
import mjy.caiwu.fukuan.dao.PaginationDao;
import mjy.caiwu.fukuan.dao.impl.Bad_payDaoImpl;
import mjy.caiwu.fukuan.dao.impl.PaginationDaoImpl;
import mjy.caiwu.fukuan.service.Bad_payService;

public class Bad_payServiceImpl implements Bad_payService {
	private Bad_payDao bad_paydao = new Bad_payDaoImpl();
	private PaginationDao pagDao = new PaginationDaoImpl();
	/**
	 * 通过fkNo（相关单据）来茶轴详情界面的数据
	 * @param fkNo
	 * @return
	 */
	@Override
	public List<FuKuanVo> listbyDetail(String fkNo) {
		return bad_paydao.listbyDetail(fkNo);
	}

	/**
	 * 	财务-坏账界面的收支类型、搜索查询、和分页的数据查询
	 * @param bad_pay
	 * @return
	 */
	@Override
	public List<FuKuanVo> listBySearch(FuKuanPO fukuanPo, PageInfo<FuKuanVo> page,Integer bossId) {
		return bad_paydao.listBySearch(fukuanPo, page, bossId);
	}

	/**
	 *财务-坏账界面的收支类型、搜索查询、和分页的数据查询和分页的信息全部保存在PageInfo中
	 * @param fukuanPo
	 * @param page
	 * @return
	 */
	@Override
	public PageInfo<FuKuanVo> showPagination(FuKuanPO fukuanPo, PageInfo<FuKuanVo> page,Integer bossId) {
		fukuanPo.setRowstart(page.getPageBegin());

		page.setQueryParam(fukuanPo.getQueryurl());
		

		int rowCount = pagDao.getCount(fukuanPo, 4,bossId);
		page.setRowCount(rowCount);
		int pageCount = 0;
		int pageSize = page.getPageSize();
		if (rowCount % pageSize == 0) {
			pageCount = rowCount / pageSize;
		} else {
			pageCount = rowCount / pageSize + 1;
		}
		page.setPageCount(pageCount);
		
		List<FuKuanVo> fukuanVO = this.listBySearch(fukuanPo,page,bossId);
		page.setPageDate(fukuanVO);	
		
		return page;
	}
	
	/**
	 * 获取所有的符合条件的数据
	 * @param fukuanPo
	 * @param fkState
	 * @return
	 */
	@Override
	public int getCount(FuKuanPO fukuanPo, int fkState,Integer bossId) {
		return pagDao.getCount(fukuanPo,fkState,bossId);
	}
}
