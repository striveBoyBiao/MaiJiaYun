package mjy.login.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.common.util.jdbc.BaseDao;
import mjy.login.beans.vo.PostLimitVO;
import mjy.login.dao.PostLimitDao;

public class PostLimitDaoImpl extends BaseDao<PostLimitVO> implements PostLimitDao {

	@Override
	public PostLimitVO getLimitPO(Integer limitId) {
		String sql="SELECT *,'isDefault'=1 FROM common_limit where limitId=?";
		List<Object> params=new ArrayList<>();
		params.add(limitId);
		return queryForSingle(sql, params);
	}

	@Override
	public List<PostLimitVO> getBasicPostLimit(Integer postId) {
		String sql="SELECT  "
				+ "common_limit.limitId,"
				+ "common_limit.limitName,"
				+ "common_limit.limitUrl,"
				+ "common_limit.limitIcon,"
				+ "common_bpl.bplIsDefault "
				+ "FROM common_bpl "
				+ "INNER JOIN common_limit ON common_bpl.limitId = common_limit.LimitId "
				+ "WHERE postId=?";
		List<Object> params=new ArrayList<>();
		params.add(postId);
		return queryForList(sql, params);
	
	}

	@Override
	public List<PostLimitVO> getExtraPostLimit(Integer bossId, Integer postId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PostLimitVO> mapRow(ResultSet rs) throws Exception {
		List<PostLimitVO> list=new ArrayList<>();
		PostLimitVO limitVO;
		while(rs.next()){
			limitVO=new PostLimitVO();
			limitVO.setLimitId(rs.getInt(1));
			limitVO.setLimitName(rs.getString(2));
			limitVO.setLimitUrl(rs.getString(3));
			limitVO.setLimitIcon(rs.getString(4));
			limitVO.setDefaulted(rs.getInt(5)==1?true:false);
			list.add(limitVO);
		}
		return list;
	}
	public static void main(String[] args) {
		System.out.println(new	PostLimitDaoImpl().getLimitPO(1));
	}
}
