package mjy.caigou.dao;

import java.util.List;

import mjy.caigou.po.ReturnGoodsPO;
import mjy.caigou.vo.ReturnGoodsVO;

public interface ReturnGoodsDao {
	// 新增采购退货商品
	void addReturnGoods(ReturnGoodsVO returnGoodsVO);

	// 修改采购退货商品
	void updateReturnGoods(ReturnGoodsVO returnGoodsVO);

	// 查询采购退货商品
	List<ReturnGoodsVO> queryReturnGoods(ReturnGoodsPO returnGoodsPO);
}
