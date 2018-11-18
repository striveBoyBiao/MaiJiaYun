package mjy.caiwu.fukuan.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.ss.formula.functions.T;

import mjy.caiwu.fukuan.beans.FuKuanPO;
import mjy.caiwu.fukuan.beans.FuKuanVo;
import mjy.caiwu.fukuan.beans.FuKuanZhVo;
import mjy.caiwu.fukuan.beans.PageInfo;
import mjy.caiwu.fukuan.beans.PayedPO;
import mjy.caiwu.fukuan.beans.ShouZhilxVo;
import mjy.caiwu.fukuan.dao.PayedDao;
import mjy.common.util.jdbc.JdbcUtil;

public class PayedDaoImpl extends BaseDao<FuKuanVo> implements PayedDao {

	/*
	 * 已付款详情页面的查询
	 */

	@Override
	public List<FuKuanVo> listBy(String fkNo) {
		List<Object> params = new ArrayList<>();
		String sql = "select * " + "from caiwu_fukuan a " + "join caiwu_shouzhilx b,common_user c "
				+ "where a.fkShouzhilxId = b.shouzhilxId and c.userId=a.fkCreaterId and a.fkState =3 and a.fkNo = ?";
		params.add(fkNo);
		return this.queryForList(sql, params);
	}

	/*
	 * 获取所有的收支类型
	 */
	@Override
	public List<ShouZhilxVo> ShowallData(ShouZhilxVo sv) {
		List<Object> params = new ArrayList<>();
		String sql = "select shouzhilxId,shouzhilxType from caiwu_shouzhilx";
		return this.getSz(sql, params);
	}
	/*
	 * 获取查询收支类型时候的字段
	 */
	public List<ShouZhilxVo> getSz(String sql, List<Object> params) {
		Connection connection = null;
		PreparedStatement stat = null;
		ResultSet rs = null;

		List<ShouZhilxVo> objs = new ArrayList<ShouZhilxVo>();
		try {
			connection = JdbcUtil.getConnection();
			stat = connection.prepareStatement(sql);
			int parameterIndex = 1;
			for (int i = 0; i < params.size(); i++) {
				stat.setObject(parameterIndex, params.get(i));
				parameterIndex++;
			}
			rs = stat.executeQuery();

			while (rs.next()) {
				ShouZhilxVo sv = new ShouZhilxVo();
				sv.setShouzhilxId(rs.getInt("shouzhilxId"));
				sv.setShouzhilxType(rs.getString("shouzhilxType"));
				objs.add(sv);
			}
		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			JdbcUtil.free(connection);
		}
		return objs;
	}

	/*
	 * 查询总的记录的条数
	 */

	@Override
	public int getCount(PayedPO po) {
		List<Object> params = new ArrayList<>();
		String sql = "select count(*) from caiwu_fukuan where fkState=3 ";
		
		if(po!=null && po.getBossid()!=null &&!po.getBossid().equals("")){
			sql = sql + "and (fkCreaterId IN(select userId from common_employee where employeeBossUserId=?) OR fkCreaterId = ?)";
			params.add(po.getBossid());
			params.add(po.getBossid());
		}
		
		if (po != null && po.getFkShouzhilxId() != null && !po.getFkShouzhilxId().equals("")) {
			sql = sql + "and fkShouzhilxId=?";
			params.add(po.getFkShouzhilxId());
		}
		if (po != null && po.getKey() != null && !po.getKey().equals("")) {
			sql = sql + "and (fkNo like ? or fkSkName like ? or fkSkNickName like ?)";
			params.add("%" + po.getKey() + "%");
			params.add("%" + po.getKey() + "%");
			params.add("%" + po.getKey() + "%");
		}
		
		return this.getCount(sql, params);
	}

	/*
	 * 查询记录的条数时获取的字段
	 */
	public int getCount(String sql, List<Object> params) {
		Connection connection = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		int count = -1;
		List<T> objs = new ArrayList<T>();
		try {
			connection = JdbcUtil.getConnection();
			stat = connection.prepareStatement(sql);
			int parameterIndex = 1;
			for (Object param : params) {
				stat.setObject(parameterIndex, param);
				parameterIndex++;
			}
			rs = stat.executeQuery();
			// 循环的遍历查询得到的行，并把对应行的第一列赋值给count
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.free(connection);
		}
		return count;
	}

	/*
	 * 获取当前页的数据
	 * 
	 * @see mjy.caiwu.fukuan.dao.PayedDao#listBy(mjy.caiwu.fukuan.beans.PayedPO)
	 */
	@Override
	public List<FuKuanVo> listByData(PayedPO po) {
		List<Object> params = new ArrayList<Object>();
		String sql = "select * " + "from caiwu_fukuan a " + "join caiwu_shouzhilx b,common_user c "
				+ "where a.fkShouzhilxId = b.shouzhilxId and c.userId=a.fkCreaterId and a.fkState =3 ";
		if(po!=null && po.getBossid()!=null&& !po.getBossid().equals("")){
			sql = sql + "and (fkCreaterId IN(select userId from common_employee where employeeBossUserId=?) OR fkCreaterId = ?)";
			params.add(po.getBossid());
			params.add(po.getBossid());
		}
		if (po != null && po.getFkShouzhilxId() != null && !po.getFkShouzhilxId().equals("")) {
			sql = sql + "and a.fkShouzhilxId=?";
			params.add(po.getFkShouzhilxId());
		}
		if (po != null && po.getKey() != null && !po.getKey().equals("")) {
			sql = sql + "and (a.fkNo like ? or a.fkSkName like ? or a.fkSkNickName like ?)";
			params.add("%" + po.getKey() + "%");
			params.add("%" + po.getKey() + "%");
			params.add("%" + po.getKey() + "%");
		}
		sql = sql + " ORDER BY a.fkOperatorTime DESC LIMIT " + po.getRowStart() + "," + PageInfo.pageSize;
		return this.queryForList(sql, params);
	}

	@Override
	public List<FuKuanVo> mapRow(ResultSet rs) throws Exception {
		List<FuKuanVo> payedvos = new ArrayList<FuKuanVo>();
		FuKuanVo payedvo = null;
		while (rs.next()) {
			payedvo = new FuKuanVo();
			payedvo.setFkSkName(rs.getString("fkSkName"));
			payedvo.setFkSkNickName(rs.getString("fkSkNickName"));
			payedvo.setFkShouldpayMoney(rs.getDouble("fkShouldpaymoney"));
			payedvo.setFkShouzhilxId(rs.getInt("fkShouzhilxId"));
			payedvo.setFkNo(rs.getString("fkNO"));
			payedvo.setFkRemark(rs.getString("fkRemark"));
			payedvo.setOther3(rs.getString("userNickname"));
			payedvo.setFkCreaterTime(rs.getString("fkCreaterTime"));
			payedvo.setFkOperatorTime(rs.getString("fkOperatorTime"));
			payedvo.setFkzhDafaultId(rs.getString("fkzhDafaultId"));
			payedvo.setFkPayMoney(rs.getDouble("fkPayMoney"));
		/*	payedvo.setOther1(rs.getString("fkzhBankName"));*/
			payedvo.setOther2(rs.getString("shouzhilxType"));
			payedvos.add(payedvo);
		}
		return payedvos;
	}
}
