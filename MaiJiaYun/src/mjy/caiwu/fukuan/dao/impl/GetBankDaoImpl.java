package mjy.caiwu.fukuan.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.caiwu.fukuan.beans.FuKuanZhVo;
import mjy.caiwu.fukuan.dao.GetBankDao;

public class GetBankDaoImpl extends BaseDao<FuKuanZhVo> implements GetBankDao{

	@Override
	public List<FuKuanZhVo> mapRow(ResultSet rs) throws Exception {
		List<FuKuanZhVo> list=new ArrayList<>();
		FuKuanZhVo fuKuanZhVo = null;
		while (rs.next()){
			fuKuanZhVo=new FuKuanZhVo();
			fuKuanZhVo.setFkzhBankName(rs.getString("fkzhBankName"));
			fuKuanZhVo.setFkzhBankId(rs.getString("fkzhBankId"));
			fuKuanZhVo.setDafaultBankId(rs.getBoolean("dafaultBankId"));
			fuKuanZhVo.setFkzhDafaultId(rs.getString("fkzhDafaultId"));
			fuKuanZhVo.setFkzhRemark(rs.getString("fkzhRemark"));
			fuKuanZhVo.setFlshopId(rs.getInt("flshopId"));
			list.add(fuKuanZhVo);
		}
		return list;
	}
	/*
	 * 查询所有银行数据
	 * @see mjy.caiwu.fukuan.dao.GetBankDao#listByBank()
	 */
	@Override
	public List<FuKuanZhVo> listByBank(int boosId) {
		String sql="select * from caiwu_fukuanzh WHERE flshopId in((SELECT shopId FROM caigou_shop where (userId in(select userId from common_employee where employeeBossUserId=?)or ?))) and isExist=1";
		List<Object> params = new ArrayList<Object>();
		params.add(boosId);
		params.add(boosId);
		return this.queryForList(sql, params);
	}
	
	/*条件查询银行账户是否存在
	 * (non-Javadoc)
	 * @see mjy.caiwu.fukuan.dao.GetBankDao#idIsExit(java.lang.String, java.lang.String)
	 */
	@Override
	public boolean idIsExit(String id,String name) {
		String sql="select * from caiwu_fukuanzh where fkzhBankId=? and fkzhBankName=?";
		List<Object> params = new ArrayList<Object>();
		params.add(id);
		params.add(name);
		List<FuKuanZhVo> li=new ArrayList<>();
		li=this.queryForList(sql, params);
		if(li.size()>0){
			return true;
		}else{
			return false;
		}
		
	}
	@Override
	public List<FuKuanZhVo> getBankId(String fkNo) {
		String sql="SELECT * from caiwu_fukuanzh a"
				+" join caiwu_fukuan b on a.fkzhDafaultId=b.fkzhDafaultId"
				+ " where fkNo=?";
		List<Object> params=new ArrayList<>();
		params.add(fkNo);
		return this.queryForList(sql, params);
	}
	
	
	/**
	 * 根据默认id查找到银行的账户和开户机构
	 * @return
	 */
	@Override
	public List<FuKuanZhVo> getBankIdAndBankName(String dafaultBankId) {
		List<Object> params = new ArrayList<Object>();
		String sql="select * from caiwu_fukuanzh where fkzhDafaultId = ?";
		if(dafaultBankId != null && !dafaultBankId.equals("")){
			params.add(dafaultBankId);
		}	
		return this.queryForList(sql, params);
	}

}
