package mjy.kuguan.ruku.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mjy.common.util.jdbc.BaseDao;
import mjy.kuguan.ruku.dao.RukuUserDao;
import mjy.login.beans.po.UserPO;

public class RukuUserDaoImpl extends BaseDao<UserPO> implements RukuUserDao{

	@Override
	public List<Integer> getSelectIdByName(String userNickName) {
		// TODO Auto-generated method stub
		String sql = "select * from common_user where userNickName like ?";
		List<Object> list = new ArrayList<Object>();
		list.add("%" + userNickName + "%");
		List<UserPO> poList = new ArrayList<UserPO>();
		poList = this.queryForList(sql, list);
		
		List<Integer> resultList = new ArrayList<Integer>();
		for (UserPO po : poList) {
			resultList.add(po.getUserId());
		}
		
		return resultList;
	}

	@Override
	public List<UserPO> mapRow(ResultSet rs){
		// TODO Auto-generated method stub
		List<UserPO> list = new ArrayList<UserPO>();
		UserPO po = null;
		try {
			while(rs.next()){
				po = new UserPO();
				po.setUserId(rs.getInt("userId"));
				list.add(po);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
}
