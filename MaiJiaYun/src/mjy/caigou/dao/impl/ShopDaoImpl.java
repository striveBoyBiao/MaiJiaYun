package mjy.caigou.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.caigou.dao.BaseDao;
import mjy.caigou.dao.ShopDao;
import mjy.caigou.vo.GoodsVO;
import mjy.caigou.vo.ShopGoodsVO;
import mjy.caigou.vo.ShopVO;

public class ShopDaoImpl extends BaseDao<ShopVO> implements ShopDao{
	
	/**
	 * 从数据库中得到店铺的所有信息
	 * 
	 */
	@Override
	public List<ShopVO> getShop(int userId) {
		
		String sql="select * from caigou_shop where userId=?";
		List<Object> params = new ArrayList<Object>();
		params.add(userId);
		return this.queryForList(sql,params);
	}
	
	@Override
	public String getShopNamesById(int shopId) {
		String sql="select * from caigou_shop where shopId=?";
		List<Object> params=new ArrayList<>();
		params.add(shopId);
		List<ShopVO> shopvos=this.queryForList(sql, params);
		return shopvos.get(0).getShopName();
		
	}
	

	@Override
	public List<ShopVO> mapRow(ResultSet rs) throws Exception {
		List<ShopVO> shopes=new ArrayList<ShopVO>();
		ShopVO shop=null;
		while(rs.next()){
			shop=new ShopVO();
			shop.setShopId(rs.getInt("shopId"));
			shop.setShopName(rs.getString("shopName"));
			shop.setUserId(rs.getInt("userId"));
			shop.setShopUseVirtual(rs.getString("shopUseVirtual"));
			shopes.add(shop);
		}
		return shopes;
	}		
}
