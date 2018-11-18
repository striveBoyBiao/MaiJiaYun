package mjy.login.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.common.util.jdbc.BaseDao;
import mjy.login.beans.po.ExtraLimitPO;
import mjy.login.dao.ExtraLimitDao;

public class ExtraLimitDaoImpl	extends BaseDao<ExtraLimitPO> implements ExtraLimitDao {

	@Override
	public List<ExtraLimitPO> getExtraLimits(Integer bossId, Integer postId) {
		String sql="SELECT * FROM common_extralimit WHERE bossId=? AND postId=?";
		List<Object> params=new ArrayList<>();
		params.add(bossId);
		params.add(postId);
		return queryForList(sql, params);
	}

	@Override
	public List<ExtraLimitPO> mapRow(ResultSet rs) throws Exception {
		List<ExtraLimitPO> extraLimitPOs=new ArrayList<>();
		ExtraLimitPO extraLimitPO;
		while(rs.next()){
			extraLimitPO=new ExtraLimitPO();
			extraLimitPO.setBossId(rs.getInt(1));
			extraLimitPO.setPostId(rs.getInt(2));
			extraLimitPO.setLimitId(rs.getInt(3));
			extraLimitPO.setExtIsSelected(rs.getInt(4));
			extraLimitPOs.add(extraLimitPO);
		}
		return extraLimitPOs;
	}

	@Override
	public boolean addExtraLimit(ExtraLimitPO extraLimitPO) {
		String sql="INSERT INTO common_extralimit  VALUES(?,?,?,?)";
		
		List<Object> params=new ArrayList<>();
		params.add(extraLimitPO.getBossId());
		params.add(extraLimitPO.getPostId());
		params.add(extraLimitPO.getLimitId());
		params.add(extraLimitPO.getExtIsSelected());
		return SaveOrUpdate(sql, params);
	}

	public static void main(String[] args) {
//		ExtraLimitPO e=	new ExtraLimitPO();
//		e.setBossId(10001);
//		e.setPostId(1);
//		e.setLimitId(1);
//		e.setExtIsSelected(0);
//		new ExtraLimitDaoImpl().updateExtraLimit(e);
		
		System.out.println(new ExtraLimitDaoImpl().getExtraLimits(10001, 3));
	}
	
	
	@Override
	public boolean updateExtraLimit(ExtraLimitPO extraLimitPO) {
	String sql="UPDATE common_extralimit SET extIsSelected=? WHERE bossId=? AND postId=? AND limitId=? ";
		
		List<Object> params=new ArrayList<>();
		
		params.add(extraLimitPO.getExtIsSelected());
		params.add(extraLimitPO.getBossId());
		params.add(extraLimitPO.getPostId());
		params.add(extraLimitPO.getLimitId());
	
		return SaveOrUpdate(sql, params);
	}

}
