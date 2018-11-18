package mjy.caiwu.fukuan.dao.impl;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import mjy.caiwu.fukuan.beans.FuKuanPO;
import mjy.caiwu.fukuan.beans.FuKuanVo;
import mjy.caiwu.fukuan.beans.PageInfo;
import mjy.caiwu.fukuan.dao.ShouldpayDao;

public class ShouldpayDaoImpl extends BaseDao<FuKuanVo> implements ShouldpayDao{
	
	/**
	 * 获得应付款页面所有数据
	 */
	@Override
	public List<FuKuanVo> listByPage(FuKuanPO fkp,int fkState,PageInfo<FuKuanVo> page,int bossID) {
		String sql="select * "
				+"from caiwu_fukuan a "
				+"join caiwu_shouzhilx b on a.fkShouzhilxId=b.shouzhilxId "
				+"join common_user c on c.userId=a.fkCreaterId "
				+"where a.fkState=? and  (c.userId in ( "
				+"SELECT e.userId "
				+"from common_employee e "
				+"where e.employeeBossUserId=?) or c.userId=? ) ";
		
		List<Object> params=new ArrayList<>();
		params.add(fkState);
		params.add(bossID);
		params.add(bossID);
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
		if(fkp!=null){
			sql+=" ORDER BY fkCreaterTime desc limit "+fkp.getRowstart()+","+page.getPageSize();
		}
		return this.queryForList(sql, params);
	}

	/**
	 * 应付款--操作付款
	 */
	@Override
	public void Pay(FuKuanVo spv) {
		/*
		 * 更改付款操作时间
		 */
		String sql1="update caiwu_fukuan set fkOperatorTime=? where fkNo=?";
		List<Object> params1=new ArrayList<>();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date());
		params1.add(date);
		params1.add(spv.getFkNo());
		this.SaveOrUpdate(sql1, params1);
		/*
		 * 付款之后将状态改为3（已付款）
		 */
		String sql="update caiwu_fukuan set fkState=3 where fkNO=?";
		List<Object> params=new ArrayList<Object>();
		params.add(spv.getFkNo());
		this.SaveOrUpdate(sql, params);
	
	}

	/**
	 * 应付款--操作坏账
	 */
	@Override
	public void Bad_Pay(FuKuanVo spv) {
		
		/*
		 * 更改付款操作时间
		 */
		String sql1="update caiwu_fukuan set fkOperatorTime=? where fkNo=?";
		List<Object> params1=new ArrayList<>();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date());
		params1.add(date);
		params1.add(spv.getFkNo());
		this.SaveOrUpdate(sql1, params1);
		
		/*
		 * 付款之后将状态改为4（坏账）
		 */
		String sql="update caiwu_fukuan set fkState=4 where fkNo=?";
		List<Object> params=new ArrayList<Object>();
		params.add(spv.getFkNo());
		
		this.SaveOrUpdate(sql, params);
	}
	
	/**
	 * 应付款--获得详情页面
	 */
	@Override
	public List<FuKuanVo> getDetailDate(String fkNo) {
		
		String sql="select * from caiwu_fukuan a"
				+" join caiwu_shouzhilx b on a.fkShouzhilxId=b.shouzhilxId"
				+" join common_user c on a.fkCreaterId=c.userId"
				+" where a.fkNo=?";
		List<Object> params=new ArrayList<>();
		params.add(fkNo);
		return this.queryForList(sql, params);
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
			fkv.setOther1(rs.getString("shouzhilxType"));
			fkv.setFkNo(rs.getString("fkNo"));
			fkv.setFkRemark(rs.getString("fkRemark"));
			fkv.setOther2(rs.getString("userNickname"));
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			fkv.setFkCreaterTime(sdf.format(rs.getTimestamp("fkCreaterTime")));
			fkv.setFkState(rs.getInt("fkState"));
			
			list.add(fkv);
		}
		return list;
	}

	/**
	 * 应付款--插入付款额
	 */
	@Override
	public void insertPayMoney(FuKuanVo fkv) {
		String sql="update caiwu_fukuan set fkPayMoney=? where fkNo=?";
		List<Object> params=new ArrayList<>();
		params.add(fkv.getFkPayMoney());
		params.add(fkv.getFkNo());
		this.SaveOrUpdate(sql, params);
	}

	/**
	 * 应付款--更改付款银行账号
	 */
	@Override
	public void updateBankAccount(FuKuanVo fkv) {
		String sql="update caiwu_fukuan set fkzhDafaultId=? where fkNo=?";
		List<Object> params=new ArrayList<>();
		params.add(fkv.getFkzhDafaultId());
		params.add(fkv.getFkNo());
		this.SaveOrUpdate(sql, params);
	}

	/**
	 * 更改采购单的付款状态为“已付款”
	 */
	@Override
	public void updateCaigouState(String paymentState,String fkNo,int userId) {
		String sql="update caigou_purchase set paymentState=? where purchaseCode=? and userId=?";
		List<Object> params=new ArrayList<>();
		params.add(paymentState);
		params.add(fkNo);
		params.add(userId);
		this.SaveOrUpdate(sql, params);
	}

	/**
	 * 插入从退款退货过来的数据
	 */
	@Override
	public void insertFromBackGood(FuKuanVo fkv) {
		String sql="insert into caiwu_fukuan(fkSkName,fkSkNickName,fkShouldpayMoney,fkShouzhilxId,fkNo,fkRemark,fkCreaterId,fkCreaterTime,fkState) values(?,?,?,?,?,?,?,?,?)";
		List<Object> params=new ArrayList<>();
		params.add(fkv.getFkSkName());
		params.add(fkv.getFkSkNickName());
		params.add(fkv.getFkShouldpayMoney());
		params.add(fkv.getFkShouzhilxId());
		params.add(fkv.getFkNo());
		params.add(fkv.getFkRemark());
		params.add(fkv.getFkCreaterId());
		params.add(fkv.getFkCreaterTime());
		params.add(fkv.getFkState());
		this.SaveOrUpdate(sql, params);
		
	}

}
