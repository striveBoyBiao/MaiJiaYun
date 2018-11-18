package mjy.order.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mjy.order.bean.po.ShopPO;
import mjy.order.bean.vo.Shop;
import mjy.order.dao.RowMap;
import mjy.order.dao.ShopDao;

public class ShopDaoImpl extends BaseDao<Shop> implements ShopDao {

	@Override
	public List<Shop> shopQuery(ShopPO shopPO) {
		StringBuffer shopSql = new StringBuffer("SELECT * FROM caigou_shop WHERE 1 = 1");
		List<Object> parames = new ArrayList<Object>();
		
		if (shopPO!=null) {
			if (shopPO.getShopId()!=null) {
				shopSql.append(" and shopId = ?");
				parames.add(shopPO.getShopId());
			}
			if (shopPO.getShopName()!=null&&!shopPO.getShopName().equals("")) {
				shopSql.append(" and shopName like ?");
				parames.add("%"+shopPO.getShopName()+"%");
			}
		}
		String sql = shopSql.toString();
		return this.query(sql, parames, new RowMapAdaptive<Shop>() {
			
			@Override
			public List<Shop> mapRows(ResultSet res) {
				List<Shop> shops = null;
				try {
					shops = new ArrayList<Shop>();
					Shop shop = null;
					while(res.next()) {
						shop = new Shop();
						shop.setShopId(res.getInt("shopId"));
						shop.setShopName(res.getString("shopName"));
						shops.add(shop);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				return shops;
			}
		});
	}

}
