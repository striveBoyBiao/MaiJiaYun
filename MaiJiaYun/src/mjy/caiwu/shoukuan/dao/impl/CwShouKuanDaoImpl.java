package mjy.caiwu.shoukuan.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import mjy.caiwu.shoukuan.beans.CwPageInfo;
import mjy.caiwu.shoukuan.beans.CwShouKuanPO;
import mjy.caiwu.shoukuan.beans.CwShouKuanVO;
import mjy.caiwu.shoukuan.dao.CwShouKuanDao;
/**
 * 收款
 */
public class CwShouKuanDaoImpl extends BaseDao<CwShouKuanVO> implements CwShouKuanDao {
	/**
	 * 分页及搜索框查询方法
	 */
	@Override
	public List<CwShouKuanVO> listBy(CwShouKuanPO cwShouKuanPO, CwPageInfo<CwShouKuanVO> page) {
		// 存放sql语句执行的参数
		List<Object> params = new ArrayList<Object>();
		String sql = "SELECT skId,skPayerName,skPayerNickname,skPayables,skReceivable,"
				+ "shouzhilxType,skReceiptsCode,skBeiZhu,userNickname,skCreateDate,"
				+ "skOperatorId,skOperationDate,skState,sk.fkzhDafaultId"
				+ " FROM caiwu_shoukuan sk" + " JOIN common_user yh ON sk.skCreatorId=yh.userId"
				+ " JOIN caiwu_shouzhilx sz ON sk.shouzhilxId = sz.shouzhilxId WHERE  1=1";
		if (cwShouKuanPO != null && cwShouKuanPO.getShouzhilxId() != null) {
			sql = sql + " AND sk.shouzhilxId=? ";
			params.add(cwShouKuanPO.getShouzhilxId());
		}
		if(cwShouKuanPO!=null && cwShouKuanPO.getUserId()!=null){
			sql = sql +" AND ( sk.skCreatorId in ( select userId from common_employee where employeeBossUserId = ? ) or sk.skCreatorId  = ? )";
			params.add(cwShouKuanPO.getUserId());
			params.add(cwShouKuanPO.getUserId());
		}
			
		if (cwShouKuanPO != null && cwShouKuanPO.getParam() != null) {
			sql = sql + " AND (skPayerName like ?  or skPayerNickname like ?  or skReceiptsCode like ? ) ";
			params.add("%" + cwShouKuanPO.getParam() + "%");
			params.add("%" + cwShouKuanPO.getParam() + "%");
			params.add("%" + cwShouKuanPO.getParam() + "%");
		}
		if (cwShouKuanPO != null && cwShouKuanPO.getSkState() == 0) {
			sql = sql + " and skState=? order by skCreateDate desc";
			params.add(cwShouKuanPO.getSkState());
		} else if (cwShouKuanPO != null && cwShouKuanPO.getSkState() == 1 || cwShouKuanPO.getSkState() == 2) {
			sql = sql + " AND skState=? order by skOperationDate desc";
			params.add(cwShouKuanPO.getSkState());
		}
		if (cwShouKuanPO != null && cwShouKuanPO.getRowStart() != null && page.getPageSize() != 0) {
			sql = sql + " LIMIT " + cwShouKuanPO.getRowStart() + "," + page.getPageSize();
		}
		return this.queryForList(sql, params);
	}
	/**
	 * 获得数据个数
	 */
	public int getCount(CwShouKuanPO cwShouKuanPO) {
		// 存放sql语句执行的参数
		List<Object> params = new ArrayList<Object>();
		String sql = "SELECT COUNT(*) FROM caiwu_shoukuan WHERE 1=1";
		if (cwShouKuanPO != null && cwShouKuanPO.getSkState() != null) {
			sql = sql + " AND skState=? ";
			params.add(cwShouKuanPO.getSkState());
		}
		if(cwShouKuanPO!=null && cwShouKuanPO.getUserId()!=null){
			sql = sql +" AND ( skCreatorId in ( select userId from common_employee where employeeBossUserId = ? ) or skCreatorId  = ? )";
			params.add(cwShouKuanPO.getUserId());
			params.add(cwShouKuanPO.getUserId());
		}
		if (cwShouKuanPO != null && cwShouKuanPO.getShouzhilxId() != null) {
			sql = sql + " AND shouzhilxId=?";
			params.add(cwShouKuanPO.getShouzhilxId());
		}
		if (cwShouKuanPO != null && cwShouKuanPO.getParam() != null) {
			sql = sql + " AND (skPayerName like ?  or skPayerNickname like ?  or skReceiptsCode like ? )  ";
			params.add("%" + cwShouKuanPO.getParam() + "%");
			params.add("%" + cwShouKuanPO.getParam() + "%");
			params.add("%" + cwShouKuanPO.getParam() + "%");
		}
		return super.getCount(sql, params);
	}
	/**
	 * 添加收款单
	 */
	@Override
	public void insert(CwShouKuanVO cwShouKuanVO) {
		String sql = "insert into caiwu_shoukuan (skPayerName,skPayerNickname,skReceiptsCode,skPayables,skReceivable,skCreatorId,skCreateDate,skBeiZhu,skOperatorId,skOperationDate,skState,shouzhilxId,fkzhDafaultId) value(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		List<Object> params = new ArrayList<Object>();
		params.add(cwShouKuanVO.getSkPayerName());
		params.add(cwShouKuanVO.getSkPayerNickname());
		params.add(cwShouKuanVO.getSkReceiptsCode());
		params.add(cwShouKuanVO.getSkPayables());
		params.add(cwShouKuanVO.getSkReceivable());
		params.add(cwShouKuanVO.getSkCreator());
		params.add(cwShouKuanVO.getSkCreateDate());
		params.add(cwShouKuanVO.getSkBeiZhu());
		params.add(cwShouKuanVO.getSkOperator());
		params.add(cwShouKuanVO.getSkOperationDate());
		params.add(cwShouKuanVO.getSkState());
		params.add(cwShouKuanVO.getShouzhilxId());
		params.add(cwShouKuanVO.getFkzhBankId());
		this.SaveorUpdate(sql, params);
	}

	/**
	 * 根据收款单
	 */
	@Override
	public void update(CwShouKuanVO cwShouKuanVO) {
		List<Object> params = new ArrayList<Object>();
		String sql = "";
		if (cwShouKuanVO != null && cwShouKuanVO.getSkReceivable() != null && cwShouKuanVO.getSkBeiZhu() != null
				&& cwShouKuanVO.getFkzhBankId() != null) {
			params.add(cwShouKuanVO.getSkReceivable());
			params.add(cwShouKuanVO.getSkBeiZhu());
			params.add(cwShouKuanVO.getFkzhBankId());
			params.add(cwShouKuanVO.getSkId());
			sql = sql + "update caiwu_shoukuan set skReceivable = ? , skBeiZhu = ? ,fkzhDafaultId = ? where skId = ? ";
			this.SaveorUpdate(sql, params);
		}
		if (cwShouKuanVO != null && cwShouKuanVO.getSkState() != null) {
			params.add(cwShouKuanVO.getSkState());
			params.add(cwShouKuanVO.getSkOperatorId());
			params.add(cwShouKuanVO.getSkOperationDate());
			params.add(cwShouKuanVO.getSkId());
			sql = "update caiwu_shoukuan set skState= ?,skOperatorId=?,skOperationDate=? where skId = ? ";
			this.SaveorUpdate(sql, params);
		}

	}

	@Override
	public List<CwShouKuanVO> mapRow(ResultSet rs) throws Exception {
		List<CwShouKuanVO> cwShouKuans = new ArrayList<>();
		CwShouKuanVO cwShouKuan = null;
		while (rs.next()) {
			cwShouKuan = new CwShouKuanVO();
			cwShouKuan.setSkId(rs.getInt("skID"));
			cwShouKuan.setSkPayerName(rs.getString("skPayerName"));
			cwShouKuan.setSkPayerNickname(rs.getString("skPayerNickname"));
			cwShouKuan.setSkCreator(rs.getString("userNickname"));
			cwShouKuan.setSkOperatorId(rs.getString("skOperatorId"));
			cwShouKuan.setSkBeiZhu(rs.getString("skBeiZhu"));
			cwShouKuan.setSkReceiptsCode(rs.getString("skReceiptsCode"));
			cwShouKuan.setSkPayables(rs.getDouble("skPayables"));
			cwShouKuan.setSkReceivable(rs.getDouble("skReceivable"));
			String a = rs.getString("skCreateDate");
			String b = rs.getString("skOperationDate");
			if (a != null) {
				cwShouKuan.setSkCreateDate(a.substring(0, a.lastIndexOf(".")));
			}
			if (b != null) {
				cwShouKuan.setSkOperationDate(b.substring(0, b.lastIndexOf(".")));
			}
			cwShouKuan.setShouzhilxType(rs.getString("shouzhilxType"));
			cwShouKuan.setFkzhBankId(rs.getString("fkzhDafaultId"));
			cwShouKuan.setSkState(rs.getInt("skState"));
			cwShouKuans.add(cwShouKuan);
		}
		return cwShouKuans;
	}

	/**
	 * // 根据id获取该条数据
	 */
	@Override
	public CwShouKuanVO queryCwShouKuanById(int skId) {
		List<Object> params = new ArrayList<Object>();
		String sql = "SELECT skId,skPayerName,skPayerNickname,skPayables,skReceivable,"
				+ "shouzhilxType,skReceiptsCode,skBeiZhu,userNickname,skCreateDate,"
				+ "skOperatorId,skOperationDate,skState,sk.fkzhDafaultId"
				+ " FROM caiwu_shoukuan sk" + " JOIN common_user yh ON sk.skCreatorId=yh.userId"
				+ " JOIN caiwu_shouzhilx sz ON sk.shouzhilxId = sz.shouzhilxId WHERE skId=?";
		params.add(skId);
		return this.queryForList(sql, params).get(0);
	}
	/**
	 *通过userid查找用户昵称
	 */
	@Override
	public String listById(String id) {
		List<Object> params = new ArrayList<Object>();
		String sql = "SELECT userNickname FROM common_user WHERE userId = ?";
		params.add(id);
		return this.nameForList(sql, params);
	}

}
