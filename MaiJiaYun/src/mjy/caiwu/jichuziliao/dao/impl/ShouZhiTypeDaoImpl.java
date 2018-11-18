package mjy.caiwu.jichuziliao.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mjy.caiwu.jichuziliao.dao.ShouZhiTypeDao;
import mjy.caiwu.jichuziliao.po.ShouZhiTypePO;
import mjy.caiwu.jichuziliao.vo.ShouZhiTypeVO;
import mjy.common.bean.PageInfo;
import mjy.common.util.jdbc.BaseDao;

public class ShouZhiTypeDaoImpl extends BaseDao<ShouZhiTypeVO> implements ShouZhiTypeDao {

	@Override
	public void addShouZhiType(ShouZhiTypeVO sVO) {
		String sql = "insert into caiwu_shouzhilx(shouzhilxType,shouzhilxStatus,shouzhilxComment) value(?,?,?)";
		List<Object> list = new ArrayList<>();
		list.add(sVO.getShouzhilxType());
		list.add(sVO.getShouzhilxStatus());
		list.add(sVO.getShouzhilxComment());
		this.SaveOrUpdate(sql, list);
	}

	@Override
	public void updateShouZhiType(ShouZhiTypeVO sVO) {
		String sql = "update caiwu_shouzhilx set shouzhilxType=?,shouzhilxStatus=?,shouzhilxComment=? where shouzhilxId = ?";
		List<Object> list = new ArrayList<>();
		list.add(sVO.getShouzhilxType());
		list.add(sVO.getShouzhilxStatus());
		list.add(sVO.getShouzhilxComment());
		list.add(sVO.getShouzhilxId());
		this.SaveOrUpdate(sql, list);
	}

	@Override
	public List<ShouZhiTypeVO> listBy(ShouZhiTypePO sPO) {
		String sql = "select * from caiwu_shouzhilx";
		List<Object> list = new ArrayList<>();
		if (sPO!=null && sPO.getStatus() != null) {
			sql = sql + " where shouzhilxStatus=? order by shouzhilxId desc";
			list.add(sPO.getStatus());
		}
		return this.queryForList(sql, list);
	}

	@Override
	public List<ShouZhiTypeVO> mapRow(ResultSet set) throws SQLException {
		List<ShouZhiTypeVO> list = new ArrayList<>();
		ShouZhiTypeVO sVO = null;
		while (set.next()) {
			sVO = new ShouZhiTypeVO();
			sVO.setShouzhilxId(set.getInt("shouzhilxId"));
			sVO.setShouzhilxType(set.getString("shouzhilxType"));
			sVO.setShouzhilxStatus(set.getString("shouzhilxStatus"));
			sVO.setShouzhilxComment(set.getString("shouzhilxComment"));
			list.add(sVO);
		}
		return list;
	}

	@Override
	public List<ShouZhiTypeVO> listByPage(ShouZhiTypePO sPO) {
		String sql = "select * from caiwu_shouzhilx order by shouzhilxId desc limit " + sPO.getPageBegin() + "," + PageInfo.pageSize;
		List<Object> list = new ArrayList<>();
		return this.queryForList(sql, list);
	}

}
