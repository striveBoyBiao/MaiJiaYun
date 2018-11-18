package mjy.order.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mjy.order.bean.po.DetailGoodPO;
import mjy.order.bean.vo.DetailGood;
import mjy.order.dao.DetailGoodDao;
import mjy.order.dao.RowMap;

public class DetailGoodDaoImpl extends BaseDao<DetailGood> implements DetailGoodDao {

	@Override
	public List<DetailGood> detailGoodQuery(DetailGoodPO detailGoodPO) {
		String detailSql ="SELECT g.goodWeight,d.orderCode,g.goodId,goodPicture,sku,goodName,"
				+ "d.goodPrice,detailGoodNum,detailGoodPrivilege,detailGoodDiscount,detailTotal FROM"
				+ " caigou_goods g JOIN order_detail d ON g.goodId=d.goodId WHERE 1=1";
		StringBuffer goodSql = new StringBuffer(detailSql);

		List<Object> parames = new ArrayList<Object>();
		if (detailGoodPO != null) {
			if (detailGoodPO.getOrderCode()!=null) {
				goodSql.append(" and d.orderCode = ?");
				parames.add(detailGoodPO.getOrderCode());
			}
			if (detailGoodPO.getGoodId() != null) {
				goodSql.append(" and g.goodId = ?");
				parames.add(detailGoodPO.getGoodId());
			}
			if (detailGoodPO.getSku() != null && !detailGoodPO.getSku().equals("")) {
				goodSql.append(" and  g.sku = ?");
				parames.add(detailGoodPO.getSku());
			}
			if (detailGoodPO.getGoodName() != null && !detailGoodPO.getGoodName().equals("")) {
				goodSql.append(" and g.goodName LIKE ?");
				parames.add("%" + detailGoodPO.getGoodName() + "%");
			}
			if (detailGoodPO.getDetailGoodNum()!=null) {
				goodSql.append(" and d.detailGoodNum = ?");
				parames.add(detailGoodPO.getDetailGoodNum());
			}
		}
		String sql = goodSql.toString();
		//System.out.println(sql);
		return this.query(sql, parames, new RowMapAdaptive<DetailGood>() {

			@Override
			public List<DetailGood> mapRows(ResultSet res) {
				List<DetailGood> list = null;
				try {
					list = new ArrayList<DetailGood>();
					DetailGood goods = null;
					while (res.next()) {
						goods = new DetailGood();
						goods.setOrderCode(res.getString("orderCode"));
						goods.setGoodId(res.getInt("goodId"));
						goods.setSku(res.getString("sku"));// sku
						goods.setGoodName(res.getString("goodName"));// 商品名字
						goods.setGoodPrice(res.getDouble("goodPrice"));// 商品价格
						goods.setDetailGoodNum(res.getInt("detailGoodNum"));// 商品数量
						// 商品优惠
						goods.setDetailGoodPrivilege(res.getDouble("detailGoodPrivilege"));
						// 应付
						goods.setDetailTotal(res.getDouble("detailTotal"));
						// 图片
						goods.setGoodPicture(res.getString("goodPicture"));
						goods.setGoodWeight(res.getDouble("goodWeight"));
						list.add(goods);
					}

				} catch (SQLException e) {
					e.printStackTrace();
				}
				return list;
			}
		});
	}

	public static void main(String[] args) {
		DetailGoodDaoImpl goodDaoImpl = new DetailGoodDaoImpl();
		DetailGoodPO goodPO = new DetailGoodPO();
//		goodPO.setGoodId(100003);
//		goodPO.setSku("100003-1");
//		goodPO.setGoodName("大衣");
		goodPO.setOrderCode("111111");
		System.out.println(goodPO.toString());
		List<DetailGood> list = goodDaoImpl.detailGoodQuery(goodPO);
		System.out.println(list.size());
		for (DetailGood good : list) {
			System.out.println(good.toString());
		}
	}

}
