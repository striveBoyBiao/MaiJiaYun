package mjy.caiwu.fukuan.service;

import java.util.List;

import mjy.caiwu.fukuan.beans.FuKuanVo;
import mjy.caiwu.fukuan.beans.PageInfo;
import mjy.caiwu.fukuan.beans.PayedPO;
import mjy.caiwu.fukuan.beans.ShouZhilxVo;
public interface PayedService {
	/*
	 * 已付款详情页面的查询
	 */
	public List<FuKuanVo> listBy(String fkNo);
	/*
	 * 获取所有的收支类型
	 */
	public List<ShouZhilxVo> ShowallData(ShouZhilxVo sv);
	/*
	 * 查询所有数据的条数
	 */
	public int getCount(PayedPO po);
	/*
	 * 查询页面的数据
	 */
	public PageInfo<FuKuanVo> listByPage(PayedPO payedPO, PageInfo<FuKuanVo> page);
}
