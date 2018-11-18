package mjy.kefu.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.common.util.jdbc.BaseDao;
import mjy.kefu.beans.LieshezhiBeanVO;
/**
 * 列设置更新数据库
 * @author Li Haibo
 *
 */
public class LieshezhiUpdate extends BaseDao<Object> {
	public boolean lieshezhiUpdate(LieshezhiBeanVO lieshezhiBeanVO,String page,int userId){
		String sql = "update kefu_lieshezhi set "+page+"ShowName=?,"+page+"State=?,"+page+"Sequence=? "
				+"where lszinfoId=(select lszinfoId from kefu_lszinfo where lieTitle=?)&&userId=?";
		List<Object> params = new ArrayList<Object>();
		params.add(lieshezhiBeanVO.getShowName());
		params.add(lieshezhiBeanVO.getState());
		params.add(lieshezhiBeanVO.getSequence());
		params.add(lieshezhiBeanVO.getLieTitle());
		params.add(userId);
		return SaveOrUpdate(sql, params);
	}


	@Override
	public List<Object> mapRow(ResultSet rs) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
