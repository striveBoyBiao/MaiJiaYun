package mjy.caiwu.fukuan.dao.impl;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import mjy.caiwu.fukuan.beans.WaitCheckCgPO;
import mjy.caiwu.fukuan.dao.WaitCheckCgDao;
/**
 * 采购
 * @author student
 *
 */
public class WaitCheckCgDaoImpl extends BaseDao<WaitCheckCgPO> implements WaitCheckCgDao {

	/**
	 *查询所有
	 */
	@Override
	public List<WaitCheckCgPO> query(String code) {
		List<Object> list=new ArrayList<>();
		String sql="select supplierCName,wareHouseName,purchaseNumber,purchaseSum,remark from caigou_purchase cp join caigou_supplier cs on cp.supplierId=cs.supplierId join caigou_warehouse cw on cp.wareHouseId=cw.wareHouseId where purchaseCode=?";
		list.add(code);
		return queryForList(sql, list);
	}


	@Override
	public List<WaitCheckCgPO> mapRow(ResultSet rs) throws Exception {
		List<WaitCheckCgPO> list=new ArrayList<>();
		WaitCheckCgPO waitCheckCgPO=null;
		while(rs.next()){
			waitCheckCgPO=new WaitCheckCgPO();
			waitCheckCgPO.setSupplierCName(rs.getString("supplierCName"));
			waitCheckCgPO.setWareHouseName(rs.getString("wareHouseName"));
			waitCheckCgPO.setPurchaseNumber(rs.getInt("purchaseNumber"));
			waitCheckCgPO.setPurchaseSum(rs.getInt("purchaseSum"));
			waitCheckCgPO.setRemark(rs.getString("remark"));
			list.add(waitCheckCgPO);
		}
		
		
		return list;
	}

}
