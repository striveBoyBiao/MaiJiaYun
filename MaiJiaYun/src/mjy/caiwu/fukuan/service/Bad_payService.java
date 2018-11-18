package mjy.caiwu.fukuan.service;

import java.util.List;
import mjy.caiwu.fukuan.beans.FuKuanPO;
import mjy.caiwu.fukuan.beans.FuKuanVo;
import mjy.caiwu.fukuan.beans.PageInfo;

public interface Bad_payService {
	
	/**
	 * 通过fkNo（相关单据）来茶轴详情界面的数据
	 * @param fkNo
	 * @return
	 */
	public List<FuKuanVo> listbyDetail(String fkNo);

	/**
	 * 	财务-坏账界面的收支类型、搜索查询、和分页的数据查询
	 * @param bad_pay
	 * @return
	 */
	public List<FuKuanVo> listBySearch(FuKuanPO fukuanPo, PageInfo<FuKuanVo> page,Integer bossId);

	/**
	 *财务-坏账界面的收支类型、搜索查询、和分页的数据查询和分页的信息全部保存在PageInfo中
	 * @param fukuanPo
	 * @param page
	 * @return
	 */
	public PageInfo<FuKuanVo> showPagination(FuKuanPO fukuanPo, PageInfo<FuKuanVo> page,Integer bossId);

	/**
	 * 获取所有的符合条件的数据
	 * @param fukuanPo
	 * @param fkState
	 * @return
	 */
	public int getCount(FuKuanPO fukuanPo, int fkState,Integer bossId);

}
