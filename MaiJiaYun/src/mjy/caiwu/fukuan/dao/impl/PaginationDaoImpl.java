package mjy.caiwu.fukuan.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.caiwu.fukuan.beans.FuKuanPO;
import mjy.caiwu.fukuan.beans.FuKuanVo;
import mjy.caiwu.fukuan.dao.PaginationDao;

public class PaginationDaoImpl extends BaseDao<FuKuanVo> implements PaginationDao{

	@Override
	public int getCount(FuKuanPO fkp, int fkState,int bossId) {
		String sql="select * "
				+"from caiwu_fukuan a "
				+"where a.fkState=? and  (a.fkCreaterId in ( "
				+"SELECT e.userId "
				+"from common_employee e "
				+"where e.employeeBossUserId=?) or a.fkCreaterId=? )";
	
		List<Object> params=new ArrayList<>();
		params.add(fkState);
		params.add(bossId);
		params.add(bossId);
		if(fkp!=null&&fkp.getShouzhiTypeId()!=null&&!fkp.getShouzhiTypeId().equals("")){
			sql=sql+" and a.fkShouzhilxId=?";
			params.add(Integer.parseInt(fkp.getShouzhiTypeId()));
		}
		if (fkp != null && fkp.getKeyword() != null&& !fkp.getKeyword().equals("")) {
			sql = sql + " and (fkSkName like ? or fkSkNickName like ? or fkNo like ?)";
			params.add("%"+fkp.getKeyword()+"%");
			params.add("%"+fkp.getKeyword()+"%");
			params.add("%"+fkp.getKeyword()+"%");
		}
		return this.queryForList(sql, params).size();
	}
	

	@Override
	public List<FuKuanVo> mapRow(ResultSet rs) throws Exception {
		List<FuKuanVo> list=new ArrayList<>();
		FuKuanVo fkv=null;
		
		while(rs.next()){
			fkv=new FuKuanVo();
			fkv.setFkSkName(rs.getString("fkSkName"));
			fkv.setFkSkNickName(rs.getString("fkSkNickName"));
			fkv.setFkShouldpayMoney(rs.getDouble("fkShouldPayMoney"));
			fkv.setFkShouzhilxId(rs.getInt("fkShouzhilxId"));
			fkv.setFkNo(rs.getString("fkNo"));
			fkv.setFkRemark(rs.getString("fkRemark"));
			fkv.setFkState(rs.getInt("fkState"));
			
			list.add(fkv);
		}
		return list;
	}

}
