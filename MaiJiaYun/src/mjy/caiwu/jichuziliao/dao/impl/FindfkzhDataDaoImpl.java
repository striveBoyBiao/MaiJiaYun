package mjy.caiwu.jichuziliao.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.caiwu.jichuziliao.beans.BaseDao;
import mjy.caiwu.jichuziliao.beans.PageInfo;
import mjy.caiwu.jichuziliao.dao.FindfkzhDataDao;
import mjy.caiwu.jichuziliao.vo.fkzhDataVO;

public class FindfkzhDataDaoImpl extends BaseDao<fkzhDataVO> implements FindfkzhDataDao {

	@Override
	public List<fkzhDataVO> getfkzhDada(PageInfo pageInfo) {
		List<fkzhDataVO> list = new ArrayList<>();
		String sql = "select * from caigou_shop JOIN caiwu_fukuanzh on caigou_shop.shopId=caiwu_fukuanzh.flshopId and isExist = 1 ORDER BY fkzhDafaultId DESC ";
		sql = sql + "LIMIT "+pageInfo.getPageBegin()+","+PageInfo.pageSize;
		List<Object> params = new ArrayList<Object>();
		return this.queryForList(sql, params);
	}

	@Override
	public List<fkzhDataVO> mapRow(ResultSet rs) throws Exception {
		List<fkzhDataVO> list = new ArrayList<>();
		fkzhDataVO data = null;
		while (rs.next()) {
			data = new fkzhDataVO();
			data.setShopName(rs.getString("shopName"));
			data.setFkzhBankName(rs.getString("fkzhBankName"));
			data.setFkzhBankId(rs.getString("fkzhBankId"));
			data.setDafaultBankId((int)rs.getInt("dafaultBankId"));
			data.setFkzhDafaultId(rs.getInt("fkzhDafaultId"));
			data.setFkzhRemark(rs.getString("fkzhRemark"));
			data.setIsExist(rs.getInt("isExist"));
			list.add(data);
		}
		return list;
	}

	@Override
	public void ChangeId(int i,int dafaultId) {
		String sql = "UPDATE caiwu_fukuanzh set dafaultBankId = ? WHERE fkzhDafaultId = ? ;";
		List<Object> params = new ArrayList<>();
		params.add(i);
		params.add(dafaultId);
		this.SaveorUpdate(sql, params);
		
	}

	@Override
	public void editData(fkzhDataVO editData) {
		String sql = "UPDATE caiwu_fukuanzh SET fkzhBankId = ?,flshopId= ?,fkzhBankName= ?,fkzhRemark= ? WHERE fkzhDafaultId = ?";
		List<Object> params = new ArrayList<>();
		params.add(editData.getFkzhBankId());
		params.add(editData.getShopId());
		params.add(editData.getFkzhBankName());
		params.add(editData.getFkzhRemark());
		params.add(editData.getFkzhDafaultId());
		this.SaveorUpdate(sql, params);
		
	}

	@Override
	public int getPageCount() {
		String sql = "SELECT count(*) FROM caiwu_fukuanzh WHERE isExist = 1";
		List<Object> params = new ArrayList<>();
		return this.getCount(sql, params);
	}

}
