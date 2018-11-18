package mjy.caigou.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.caigou.dao.BaseDao;
import mjy.caigou.dao.CommodityLqDao;
import mjy.caigou.po.GoodsPO;
import mjy.caigou.vo.GoodsVO;


public class CommodityLqDaoImpl extends BaseDao<GoodsVO> implements CommodityLqDao {

	/**
	 * ��������ѯ
	 */
	@Override
	public List<GoodsVO> listBy(GoodsPO goodsPO) {
		// ���sql���ִ�еĲ���
		List<Object> params = new ArrayList<Object>();

		// ���ݲ�ѯ����д��Ҫִ��sql���
		String sql = "select * from caigou_goods where 1=1 ";

		if (goodsPO != null && goodsPO.getSku() != null && !goodsPO.getSku().equals("")) {
			sql = sql + " and sku like ?";
			params.add("%" + goodsPO.getSku() + "%");
		}
		if (goodsPO != null && goodsPO.getGoodName() != null && !goodsPO.getGoodName().equals("")) {
			sql = sql + " or goodName like ?";
			params.add("%" + goodsPO.getGoodName() + "%");
		}
		
		return this.queryForList(sql, params);
	}

	@Override
	public List<GoodsVO> mapRow(ResultSet rs) throws Exception {
		List<GoodsVO> goods = new ArrayList<GoodsVO>();
		GoodsVO good = null;

		while (rs.next()) {
			good = new GoodsVO();
			good.setSku(rs.getString("sku"));
			good.setGoodName(rs.getString("goodName"));
			good.setGoodPrice(rs.getDouble("goodPrice"));
			good.setGoodRepertory(rs.getInt("goodRepertory"));
			good.setGoodVirtualInventories(rs.getInt("goodVirtualInventories"));
			goods.add(good);
		}

		return goods;
	}

}
