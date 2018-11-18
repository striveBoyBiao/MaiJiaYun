package mjy.caigou.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.caigou.dao.ReturnGoodsDao;
import mjy.caigou.po.ReturnGoodsPO;
import mjy.caigou.vo.ReturnGoodsVO;
import mjy.common.util.jdbc.BaseDao;

public class ReturnGoodsDaoImpl extends BaseDao<ReturnGoodsVO> implements ReturnGoodsDao {

	@Override
	public void addReturnGoods(ReturnGoodsVO returnGoodsVO) {
		String sql = "insert into caigou_returnGoods value(?,?,?,?)";
		List<Object> params = new ArrayList<>();
		params.add(returnGoodsVO.getReturnId());
		params.add(returnGoodsVO.getGoodId());
		params.add(returnGoodsVO.getQuantity());
		params.add(returnGoodsVO.getPrice());

		this.SaveOrUpdate(sql, params);
	}

	@Override
	public void updateReturnGoods(ReturnGoodsVO returnGoodsVO) {
		String sql = "update caigou_returngoods set quantity=?,price=? where returnId=? and goodId=?";
		List<Object> params = new ArrayList<>();
		params.add(returnGoodsVO.getQuantity());
		params.add(returnGoodsVO.getPrice());
		params.add(returnGoodsVO.getReturnId());
		params.add(returnGoodsVO.getGoodId());

		this.SaveOrUpdate(sql, params);
	}

	@Override
	public List<ReturnGoodsVO> queryReturnGoods(ReturnGoodsPO returnGoodsPO) {
		String sql = "select * from caigou_returngoods where 1=1";
		List<Object> params = new ArrayList<>();
		if (returnGoodsPO.getReturnId() != null) {
			sql += " and returnId=?";
			params.add(returnGoodsPO.getReturnId());
		}

		return this.queryForList(sql, params);
	}

	@Override
	public List<ReturnGoodsVO> mapRow(ResultSet rs) throws Exception {
		List<ReturnGoodsVO> returnGoodsVOs = new ArrayList<>();
		ReturnGoodsVO returnGoodsVO = null;
		while (rs.next()) {
			returnGoodsVO = new ReturnGoodsVO();
			returnGoodsVO.setReturnId(rs.getInt("returnId"));
			returnGoodsVO.setGoodId(rs.getInt("goodId"));
			returnGoodsVO.setQuantity(rs.getInt("quantity"));
			returnGoodsVO.setPrice(rs.getDouble("price"));

			returnGoodsVOs.add(returnGoodsVO);
		}

		return returnGoodsVOs;
	}

}
