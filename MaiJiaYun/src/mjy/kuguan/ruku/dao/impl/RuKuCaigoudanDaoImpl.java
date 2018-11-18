package mjy.kuguan.ruku.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.caigou.vo.PurchaseGoodVO;
import mjy.common.util.jdbc.BaseDao;
import mjy.kuguan.ruku.dao.RuKuCaigoudanDao;

public class RuKuCaigoudanDaoImpl extends BaseDao<PurchaseGoodVO> implements RuKuCaigoudanDao{
	
	@Override
	public List<PurchaseGoodVO> getPurchaseGoodsInfo(int bossId, String purchaseCode) {
		// TODO Auto-generated method stub
		String sql = "select * from caigou_purchasegood where purchaseId = ?";
		List<Object> list = new ArrayList<Object>();
		list.add(purchaseCode);
		return this.queryForList(sql, list);
	}

	@Override
	public List<PurchaseGoodVO> mapRow(ResultSet rs) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
