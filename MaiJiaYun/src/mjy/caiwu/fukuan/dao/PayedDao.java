package mjy.caiwu.fukuan.dao;

import java.util.List;

import mjy.caiwu.fukuan.beans.FuKuanPO;
import mjy.caiwu.fukuan.beans.FuKuanVo;
import mjy.caiwu.fukuan.beans.FuKuanZhVo;
import mjy.caiwu.fukuan.beans.PayedPO;
import mjy.caiwu.fukuan.beans.ShouZhilxVo;

public interface PayedDao {
	/*
	 * 已付款详情页面的查询
	 */
	public List<FuKuanVo> listBy(String fkNo);
	/*
	 * 获取所有的收支类型
	 */
	public List<ShouZhilxVo> ShowallData(ShouZhilxVo sv);
	/*
	 * 查询总的记录的条数
	 */
	public int getCount(PayedPO po);
	/*
	 * 查询所有数据
	 */
	public List<FuKuanVo> listByData(PayedPO po);
}
