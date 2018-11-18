package mjy.caiwu.fukuan.service.impl;

import java.util.List;

import mjy.caiwu.fukuan.beans.FuKuanPO;
import mjy.caiwu.fukuan.beans.FuKuanVo;
import mjy.caiwu.fukuan.beans.PageInfo;
import mjy.caiwu.fukuan.beans.PayedPO;
import mjy.caiwu.fukuan.beans.ShouZhilxVo;
import mjy.caiwu.fukuan.dao.PayedDao;
import mjy.caiwu.fukuan.dao.impl.PayedDaoImpl;
import mjy.caiwu.fukuan.service.PayedService;

public class PayedServiceImpl implements PayedService {
	/*
	 * 引用PayedDao对象
	 */
	private PayedDao pd = new PayedDaoImpl();

	@Override
	public List<FuKuanVo> listBy(String fkNo) {
		return pd.listBy(fkNo);
	}

	@Override
	public List<ShouZhilxVo> ShowallData(ShouZhilxVo sv) {
		return pd.ShowallData(sv);
	}

	@Override
	public int getCount(PayedPO po) {

		return pd.getCount(po);
	}

	/*
	 * 分页查询
	 *
	 */
	@Override
	public PageInfo<FuKuanVo> listByPage(PayedPO payedPO, PageInfo<FuKuanVo> page) {
		// 得到总的行的记录条数
		int rowCount = pd.getCount(payedPO);
		// 计算总的页数
		int pageCount = 0;
		int pageSize = page.getPageSize();
		if (rowCount % pageSize == 0) {
			pageCount = rowCount / pageSize;
		} else {
			pageCount = rowCount / pageSize + 1;
		}
		page.setRowCount(rowCount);
		page.setPageCount(pageCount);
		// 获取当前页的数据
		List<FuKuanVo> fv = pd.listByData(payedPO);
		page.setPageDate(fv);
		return page;
	}
}
