package mjy.kefu.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.common.util.jdbc.BaseDao;
import mjy.kefu.beans.ProductBeanPO;
import mjy.kefu.beans.ProductBeanVO;

public class ProductQuery extends BaseDao<ProductBeanPO> {

	public List<ProductBeanPO> productQuery(ProductBeanVO productBeanVO){
		String sql="select * from caigou_goodwarehouse a join caigou_goods b on a.goodId=b.goodId join caigou_warehouse c on c.wareHouseId=a.warehouseId where c.userId=? and c.wareHouseId=?";
		List<Object> params=new ArrayList<Object>();
		params.add(productBeanVO.getUserId());
		params.add(productBeanVO.getWareHouseId());
		if(productBeanVO.getSearchText()!=null){
			sql=sql+" and ( b.goodName like ? or b.sku like ?)";
			params.add("%"+productBeanVO.getSearchText()+"%");
			params.add("%"+productBeanVO.getSearchText()+"%");
		}
		return queryForList(sql, params); 
	}

	@Override
	public List<ProductBeanPO> mapRow(ResultSet rs) throws Exception {
		List<ProductBeanPO> list = new ArrayList<ProductBeanPO>();
		ProductBeanPO product = null;
		while (rs.next()) {
			product = new ProductBeanPO();
			product.setGoodId(rs.getString("goodId"));
			product.setSku(rs.getString("sku"));
			product.setGoodGroupId(rs.getString("goodGroupId"));
			product.setGoodName(rs.getString("goodName"));
			product.setGoodPrice(rs.getString("goodPrice"));
			product.setGoodWeight(rs.getString("goodWeight"));
			product.setGoodRepertory(rs.getString("goodRepertory"));
			product.setGoodVirtualInventorids(rs.getString("goodVirtualInventories"));
			product.setGoodInventoryCost(rs.getString("goodInventoryCost"));
			product.setGoodPicture(rs.getString("goodPicture"));
			product.setGoodWarehouseId(rs.getString("warehouseId"));
			list.add(product);
		}
		return list;
	}
}
