package mjy.caigou.dao;

import java.util.List;

import mjy.caigou.po.ReturnPO;
import mjy.caigou.vo.ReturnVO;

public interface ReturnDao {

	// 新增采购退货单
	void addReturn(ReturnVO returnVO);

	// 修改采购退货单
	void updateReturn(ReturnVO returnVO);

	// 删除采购退货单
	void deleteReturn(int returnId);

	// 查询采购退货单
	List<ReturnVO> queryReturn(ReturnPO returnPO);

	// 获取总记录数
	int getTotalRecords(ReturnPO returnPO);

	// 获取当前最大returnId(最新增加的)
	int getMaxReturnId();
}
