package mjy.caiwu.jichuziliao.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.caiwu.jichuziliao.beans.BaseDao;
import mjy.caiwu.jichuziliao.dao.FindIsDefaultDao;
import mjy.caiwu.jichuziliao.vo.IsDefaultVO;

public class FindIsDefaultDaoImpl extends BaseDao<IsDefaultVO> implements FindIsDefaultDao {

	@Override
	public List<IsDefaultVO> listDefault(String shopName) {
		String sql = "SELECT * from caiwu_fukuanzh JOIN caigou_shop on caigou_shop.shopName = ? and caiwu_fukuanzh.flshopId = caigou_shop.shopId";
		List<Object> params = new ArrayList<Object>();
		params.add(shopName);
		return this.queryForList(sql, params);
	}

	@Override
	public List<IsDefaultVO> mapRow(ResultSet rs) throws Exception {
		List<IsDefaultVO> list = new ArrayList<>();
		IsDefaultVO isDef = null;
		while (rs.next()) {
			isDef = new IsDefaultVO();
			isDef.setDafaultBankId(rs.getInt("dafaultBankId"));
			isDef.setFkzhDafaultId(rs.getInt("fkzhDafaultId"));
			list.add(isDef);
		}
		return list;
	}

	@Override
	public void deleteById(int param) {
		String sql = "UPDATE caiwu_fukuanzh set isExist = 0 WHERE fkzhDafaultId = ?";
		List<Object> params = new ArrayList<>();
		params.add(param);
		this.SaveorUpdate(sql, params);
		
	}

}
