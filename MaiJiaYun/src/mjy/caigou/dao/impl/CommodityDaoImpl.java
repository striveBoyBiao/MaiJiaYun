package mjy.caigou.dao.impl;

import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

import mjy.caigou.dao.BaseDao;
import mjy.caigou.dao.CommodityDao;
import mjy.caigou.vo.GoodsVO;


public class CommodityDaoImpl extends BaseDao<GoodsVO> implements CommodityDao {

	/**
	 * 根据商品id更新虚拟库存量
	 */
	@Override
	public void updateStore(int goodid,int store) {
		String sql = "update caigou_goods set goodVirtualInventories=? where goodId=?";
		List<Object> params = new ArrayList<>();
		params.add(store);
		params.add(goodid);
		this.SaveOrUpdate(sql, params);
	}

	/**
	 *  查询所有商品信息
	 * @return
	 */
	@Override
	public List<GoodsVO> queryAllGoods(int userId) {
		String sql = "select * from caigou_goods where goodId in(select goodId from caigou_gooduserstatus where userId=?)";

		List<Object> params = new ArrayList<>();
		params.add(userId);
		return this.queryForList(sql, params);
	}

	@Override
	public List<GoodsVO> mapRow(ResultSet rs) throws Exception {
		List<GoodsVO> goodVOs=new ArrayList<GoodsVO>();
		GoodsVO goodVO=null;
		while(rs.next()){
			goodVO=new GoodsVO();
			goodVO.setGoodId(rs.getInt("goodId"));
			goodVO.setSku(rs.getString("sku"));
			goodVO.setGoodGroupId(rs.getInt("goodGroupId"));
			
			goodVO.setGoodName(rs.getString("goodName"));
			goodVO.setGoodPrice(rs.getDouble("goodPrice"));
			goodVO.setGoodWeight(rs.getDouble("goodWeight"));
			goodVO.setGoodRepertory(rs.getInt("goodRepertory"));
			
			goodVO.setGoodVirtualInventories(rs.getInt("goodVirtualInventories"));
			goodVO.setGoodInventoryCost(rs.getDouble("goodInventoryCost"));
			goodVO.setGoodPicture(rs.getString("goodPicture"));
			goodVOs.add(goodVO);
		}
		
		return goodVOs;
	}

}
