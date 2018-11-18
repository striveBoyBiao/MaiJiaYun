package mjy.kefu.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.common.util.jdbc.BaseDao;
import mjy.kefu.beans.LieshezhiBeanPO;
/**
 * 列设置查询数据库
 * @author Li Haibo
 *
 */
public class LieshezhiQuery extends BaseDao<LieshezhiBeanPO> {
	private String page;
	public List<LieshezhiBeanPO> lieshezhiQuery(String page, int userId,String defaultStr) {
		this.page=page;
		// page ="订单查询";//根据页面修改
		String sql = "select a.lieshezhiId,a.userId,b.colName,b.lieTitle,a."+page+"ShowName,a."+page+"State,a."+page+"Sequence,b."+page+"DefaultState,b."+page+"DefaultSequence "
				+ "from kefu_lieshezhi a " 
				+ "join kefu_lszinfo b on a.lszinfoId=b.lszinfoId "
				+ "where userId='"+userId+"' and a."+page+"ShowName is not null " 
				+ "order by "+page+defaultStr+"Sequence";
		ArrayList<Object> params = new ArrayList<Object>();
		return queryForList(sql, params);
	}
	

	@Override
	public List<LieshezhiBeanPO> mapRow(ResultSet rs) throws Exception {
		List<LieshezhiBeanPO> list = new ArrayList<LieshezhiBeanPO>();
		LieshezhiBeanPO lieshezhi = null;
		while (rs.next()) {
			lieshezhi = new LieshezhiBeanPO();
			lieshezhi.setLieshezhiId(rs.getInt("lieshezhiId"));
			lieshezhi.setUserId(rs.getInt("userId"));
			lieshezhi.setColName(rs.getString("colName"));
			lieshezhi.setLieTitle(rs.getString("lieTitle"));
			lieshezhi.setShowName(rs.getString(page+"ShowName"));
			lieshezhi.setState(rs.getBoolean(page+"State"));
			lieshezhi.setSequence(rs.getInt(page+"Sequence"));
			lieshezhi.setDefaultState(rs.getBoolean(page+"DefaultState"));
			lieshezhi.setDefaultSequence(rs.getInt(page+"DefaultSequence"));
			list.add(lieshezhi);
		}
		return list;
	}

}
