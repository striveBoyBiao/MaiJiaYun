package mjy.caiwu.fukuan.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import mjy.caiwu.fukuan.beans.FuKuanPO;
import mjy.caiwu.fukuan.beans.FuKuanVo;
import mjy.caiwu.fukuan.beans.PageInfo;
import mjy.caiwu.fukuan.dao.Bad_payDao;

public class Bad_payDaoImpl extends BaseDao<FuKuanVo> implements Bad_payDao {
	
	/**
	 * 通过fkNo（相关单据）来茶轴详情界面的数据
	 * @param fkNo
	 * @return
	 */
	@Override
	public List<FuKuanVo> listbyDetail(String fkNo) {
		List<Object> params = new ArrayList<Object>();
		String sql = "select * "
				+ "from caiwu_fukuan a "
				+ "join caiwu_shouzhilx b on a.fkShouzhilxId = b.shouzhilxId "
				+ "join common_user c on a.fkCreaterId = c.userId "
//				+ "join caiwu_fukuanzh d on d.fkzhDafaultId = a.fkzhDafaultId "
				+ "where fkState = 4";
		if(fkNo!=null && !fkNo.equals("")){
			sql = sql +" and fkNo = ? ";
			params.add(fkNo);
		}
		return this.queryForList(sql, params);
	}
	

	/**
	 * 	财务-坏账界面的收支类型、搜索查询、和分页的数据查询
	 * @param bad_pay
	 * @return
	 */
	@Override
	public List<FuKuanVo> listBySearch(FuKuanPO fukuanPo,PageInfo<FuKuanVo> page,Integer bossId) {
		List<Object> params = new ArrayList<Object>();
		String sql = "select * "
				+ "from caiwu_fukuan a "
				+ "join caiwu_shouzhilx b on a.fkShouzhilxId = b.shouzhilxId "
				+ "join common_user c on a.fkCreaterId = c.userId "
				+ "where fkState = 4";	
		if(fukuanPo!=null && fukuanPo.getShouzhiTypeId()!=null&&!fukuanPo.getShouzhiTypeId().equals("")){
			sql=sql+" and a.fkShouzhilxId=?";
			params.add(Integer.parseInt(fukuanPo.getShouzhiTypeId()));
		}
		if (fukuanPo != null && fukuanPo.getKeyword() != null&& !fukuanPo.getKeyword().equals("")) {
			sql = sql + " and (fkSkName like ? or fkSkNickName like ? or fkNo like ?)";
			params.add("%"+fukuanPo.getKeyword()+"%");
			params.add("%"+fukuanPo.getKeyword()+"%");
			params.add("%"+fukuanPo.getKeyword()+"%");
		}	
		if(bossId!=0 && bossId!=null){
			sql = sql +" and ( fkCreaterId in (select userId from common_employee where employeeBossUserId = ?) or fkCreaterId = "+bossId+")";
			params.add("%"+bossId+"%");
		}
		
		sql = sql +" order by fkOperatorTime desc";
		
		if(fukuanPo!=null){
			sql+=" limit "+fukuanPo.getRowstart()+","+page.getPageSize();
		}
		
		return this.queryForList(sql, params);
	}
	

/**
 * 将通过的sql语句查询的出来的数据元压入到FuKuanVo类中
 */
	@Override
	public List<FuKuanVo> mapRow(ResultSet rs) throws Exception {
		List<FuKuanVo> lists = new ArrayList<>();
		FuKuanVo bad_pay = null;
		while (rs.next()) {
			bad_pay = new FuKuanVo();
			bad_pay.setFkNo(rs.getString("fkNo"));
			bad_pay.setFkSkName(rs.getString("fkSkName"));
			bad_pay.setFkSkNickName(rs.getString("fkSkNickName"));
			bad_pay.setFkNumber(rs.getInt("fkNumber"));
			bad_pay.setFkShouldpayMoney(rs.getDouble("fkShouldpayMoney"));
			bad_pay.setFkPayMoney(rs.getDouble("fkPayMoney"));
			bad_pay.setFkShouzhilxId(rs.getInt("fkShouzhilxId"));
			bad_pay.setFkRemark(rs.getString("fkRemark"));
			bad_pay.setOther1(rs.getString("userNickname"));
			bad_pay.setFkCreaterTime(rs.getString("fkCreaterTime"));
			bad_pay.setFkOperatorTime(rs.getString("fkOperatorTime"));
			bad_pay.setFkzhDafaultId(rs.getString("fkzhDafaultId"));
			bad_pay.setOther2(rs.getString("shouzhilxType"));
			lists.add(bad_pay);
		}
		return lists;
	}

}
