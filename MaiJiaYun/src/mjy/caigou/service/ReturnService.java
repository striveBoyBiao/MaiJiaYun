package mjy.caigou.service;

import java.util.List;

import mjy.caigou.po.ReturnPO;
import mjy.caigou.vo.ReturnGoodsVO;
import mjy.caigou.vo.ReturnVO;
import mjy.caigou.beans.gys.PageInfo;

public interface ReturnService {

	// 新增采购退货单，和相对的采购退货商品
	void addReturn(ReturnVO returnVO, List<ReturnGoodsVO> returnGoodsVOs);

	// 更新采购退货单，和相对的采购退货商品
	void updateReturn(ReturnVO returnVO, List<ReturnGoodsVO> returnGoodsVOs);

	// 删除采购退货单
	void deleteReturn(int returnId);

	// 查询采购退货单
	List<ReturnVO> queryReturn(ReturnPO returnPO);

	// 查询页面信息
	PageInfo<ReturnVO> getPageInfo(ReturnPO returnPO, PageInfo<ReturnVO> pageInfo);

	// 审核通过，修改相关表
	void changeReturnStatu(ReturnVO returnVO);

}
