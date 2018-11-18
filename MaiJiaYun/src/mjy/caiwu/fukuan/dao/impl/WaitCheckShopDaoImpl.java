package mjy.caiwu.fukuan.dao.impl;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import mjy.caiwu.fukuan.beans.WaitCheckShopPO;
import mjy.caiwu.fukuan.dao.WaitCheckShopDao;
/**
 * 商品
 * @author student
 *
 */
public class WaitCheckShopDaoImpl extends BaseDao<WaitCheckShopPO> implements WaitCheckShopDao {

	/**
	 * 查询所有
	 */
	@Override
	public List<WaitCheckShopPO> query(String code) {
		List<Object> list=new ArrayList<>();
		String sql="select goodPicture,sku,goodName,goodAttribute,purchaseNum,quantity,purchasePrice,cpg.purchaseSum,remark_1 from caigou_purchase cp join caigou_purchasegood cpg on cp.purchaseId=cpg.purchaseId join caigou_goods  cg on cpg.goodId=cg.goodId where purchaseCode=? order by creatTime desc";
		list.add(code);
		return queryForList(sql, list);
	}
	


	@Override
	public List<WaitCheckShopPO> mapRow(ResultSet rs) throws Exception {
		List<WaitCheckShopPO> list=new ArrayList<>();
		WaitCheckShopPO waitCheckShopPO=null;
		while(rs.next()){
			waitCheckShopPO=new WaitCheckShopPO();
			waitCheckShopPO.setGoodPicture(rs.getString("goodPicture"));
			waitCheckShopPO.setSku(rs.getString("sku"));
			waitCheckShopPO.setGoodName(rs.getString("goodName"));
			waitCheckShopPO.setGoodAttribute(rs.getString("goodAttribute"));
			waitCheckShopPO.setPurchaseNum(rs.getInt("purchaseNum"));
			waitCheckShopPO.setQuantity(rs.getInt("quantity"));
			waitCheckShopPO.setPurchasePrice(rs.getDouble("purchasePrice"));
			waitCheckShopPO.setPurchaseSum(rs.getDouble("purchaseSum"));
			waitCheckShopPO.setRemark_1(rs.getString("remark_1"));
			list.add(waitCheckShopPO);
		}
		return list;
	}

}
