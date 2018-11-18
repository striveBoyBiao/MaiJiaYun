package mjy.caiwu.jichuziliao.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.caiwu.jichuziliao.beans.BaseDao;
import mjy.caiwu.jichuziliao.dao.FindShopDao;
import mjy.caiwu.jichuziliao.po.ShopPO;
import mjy.caiwu.jichuziliao.vo.FukuanzhVO;
import mjy.caiwu.jichuziliao.vo.ShopVO;
public class FindShopDaoImp extends BaseDao<ShopVO> implements FindShopDao{

	@Override
	public List<ShopVO> listBy(ShopPO shop) {
		List<Object> params = new ArrayList<Object>();
		// 根据查询参数写出要执行sql语句
		String sql = "select * from caigou_shop where 1=1;";
		if (shop!=null) {
			sql = "select * from caigou_shop where shopName = ?;";
			params.add(shop.getShopName());
		}
		

		return this.queryForList(sql, params);
	}

	@Override
	public List<ShopVO> mapRow(ResultSet rs) throws Exception {
		List<ShopVO> list = new ArrayList<>();
		ShopVO shop = null;
		while (rs.next()) {
			shop = new ShopVO();
			shop.setShopId(rs.getInt("shopId"));
			shop.setShopName(rs.getString("shopName"));
			list.add(shop);
		}
		return list;
	}

	@Override
	public void insertFK(FukuanzhVO fukuan) {
		String sql = "insert into caiwu_fukuanzh(fkzhBankId,flshopId,fkzhBankName,fkzhRemark) value(?,?,?,?)";

		List<Object> params = new ArrayList<Object>();
		params.add(fukuan.getFkzhBankId());
		params.add(fukuan.getFlshopId());
		params.add(fukuan.getFkzhBankName());
		params.add(fukuan.getFkzhRemark());
		this.SaveorUpdate(sql, params);
		
	}

	@Override
	public List<ShopVO> listBy1(String shopPO) {
		List<Object> param = new ArrayList<Object>();
		param.add(shopPO);
		// 根据查询参数写出要执行sql语句
		String sql = "select * from caigou_shop where flshopId=?";


		return this.queryForList(sql, param);
	}
}
