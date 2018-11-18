package mjy.caiwu.jichuziliao.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.Param;

import mjy.caiwu.jichuziliao.dao.BaseDao;
import mjy.caiwu.jichuziliao.dao.FuKuanAccountDao;
import mjy.caiwu.jichuziliao.po.FuKuanAccountPO;
import mjy.caiwu.jichuziliao.vo.FuKuanAccountVO;

public class FuKuanAccountDaoImpl extends BaseDao<FuKuanAccountVO> implements FuKuanAccountDao {

	@Override
	public void addFuKuanAccount(FuKuanAccountVO fkVO) {

		String sql="insert into caiwu_fukuanzh(fkzhBankId,flshopId,fkzhBankName,fkzhRemark) value(?,?,?,?)";
		
		List<Object> params=new ArrayList<Object>();
		params.add(fkVO.getFkzhBankId());
		params.add(fkVO.getFlshopId());
		params.add(fkVO.getFkzhBankName());
		params.add(fkVO.getFkzhRemark());
		
		this.SaveOrUpdate(sql, params);
	}

	@Override
	public void deleteFuKuanAccount(String fkzhBankId,int flshopId) {
		String sql="delete * from caiwu_fukuanzh where fkzhBankName=? && flshopId=?";
		List<Object> params=new ArrayList<Object>();
		params.add(fkzhBankId);
		params.add(flshopId);
		
		this.SaveOrUpdate(sql, params);
	}

	@Override
	public void updateFuKuanAccount() {
		String sql="update caiwu_fukuanzh set fkzhBankId=?,";

	}

	@Override
	public List<FuKuanAccountVO> listBy() {
		List<Object> params = new ArrayList<Object>();
		String sql="select * from caiwu_fukuanzh a left join caigou_shop b on a.flshopId=b.shopId;";
		
		return this.queryForList(sql, params);
	}

	@Override
	public List<FuKuanAccountVO> mapRow(ResultSet set) throws SQLException {
		List<FuKuanAccountVO> fkVOs=new ArrayList<FuKuanAccountVO>();
		FuKuanAccountVO fkVO=null;
		while(set.next()){
			fkVO=new FuKuanAccountVO();
			fkVO.setFkzhBankId(set.getString("fkzhBankId"));
			fkVO.setFkzhBankName(set.getString("fkzhBankName"));
			fkVO.setFlshopId(set.getInt("shopId"));
			fkVO.setFlshopName(set.getString("shopName"));
			fkVO.setFkzhDafaultId(set.getInt("fkzhDafaultId"));
			fkVO.setFkzhRemark(set.getString("fkzhRemark"));
			fkVO.setDafaultBankId(set.getBoolean("dafaultBankId"));
			fkVOs.add(fkVO);
		}
		return fkVOs;
	}
}
