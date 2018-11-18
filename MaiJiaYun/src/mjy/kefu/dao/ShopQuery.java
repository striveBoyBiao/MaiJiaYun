package mjy.kefu.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.common.util.jdbc.BaseDao;
import mjy.kefu.beans.ShopBeanPO;
import mjy.kefu.beans.ShopBeanVO;

public class ShopQuery extends BaseDao<ShopBeanPO>{
	public List<ShopBeanPO> shopQuery(ShopBeanVO shopBeanVO){
		String sql="select * from caigou_shop where 1=1";
		List<Object> params=new ArrayList<Object>();
		if(!shopBeanVO.getUserId().equals(null)){
			sql=sql+" and userId=?";
			params.add(shopBeanVO.getUserId());
		}
		return queryForList(sql, params);
	}
	
	
	
	@Override
	public List<ShopBeanPO> mapRow(ResultSet rs) throws Exception {
		List<ShopBeanPO> list = new ArrayList<ShopBeanPO>();
		ShopBeanPO shop = null;
		while (rs.next()) {
			shop = new ShopBeanPO();
			shop.setShopId(rs.getString("shopId"));
			shop.setShopName(rs.getString("shopName"));
			shop.setUserId(rs.getString("userId"));
			shop.setShopUseVirtual(rs.getString("shopUseVirtual"));
			list.add(shop);
		}
		return list;
	}
}
