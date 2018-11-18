package mjy.kefu.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.common.util.jdbc.BaseDao;
import mjy.kefu.beans.LieshezhiddcxVO;

public class LieSheZhiDdcxQuery extends BaseDao<LieshezhiddcxVO> {
	//按顺序查询显示的字段
	public List<LieshezhiddcxVO> LieshezhiddcxQuery(int userId){
		String sql="SELECT ddcxShowName,ddcxState,ddcxSequence,colName"
					+" FROM kefu_lieshezhi"
					+" join kefu_lszinfo ON kefu_lszinfo.lszinfoId = kefu_lieshezhi.lszinfoId"
					+" where ddcxShowName is not null and ddcxState = '1' and userId = '"+userId+"'"
					+" order by ddcxSequence";
		ArrayList<Object> params=new ArrayList<Object>();
		return queryForList(sql, params);
	}
	
	@Override
	public List<LieshezhiddcxVO> mapRow(ResultSet rs) throws Exception {
		List<LieshezhiddcxVO> list = new ArrayList<LieshezhiddcxVO>();
		LieshezhiddcxVO lszd = null;
		while (rs.next()) {
			lszd = new LieshezhiddcxVO();
			lszd.setColName(rs.getString("colName"));
			lszd.setDdcxSequence(rs.getString("ddcxSequence"));
			lszd.setDdcxShowName(rs.getString("ddcxShowName"));
			lszd.setDdcxState(rs.getString("ddcxState"));
			list.add(lszd);
		}
		return list;
	}

}
