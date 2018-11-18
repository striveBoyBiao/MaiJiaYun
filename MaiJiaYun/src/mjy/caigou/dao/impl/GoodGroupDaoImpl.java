package mjy.caigou.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.caigou.dao.BaseDao;
import mjy.caigou.dao.GoodGroupDao;
import mjy.caigou.vo.GoodGroupVO;

public class GoodGroupDaoImpl extends BaseDao<GoodGroupVO> implements GoodGroupDao {

	@Override
	public List<GoodGroupVO> QueryGoodGroupName() {
		String sql="select * from caigou_goodGroup where 1=1";
		List<Object> params = new ArrayList<>();
		return this.queryForList(sql,params);
	}
	
	
	//重写映射
	@Override
	public List<GoodGroupVO> mapRow(ResultSet rs) throws Exception {
		List<GoodGroupVO> GoodGroupVOs=new ArrayList<GoodGroupVO>();
		GoodGroupVO goodGroupVO=null;
		while(rs.next()){
			goodGroupVO=new GoodGroupVO();
			goodGroupVO.setGoodGroupId(rs.getInt("goodGroupId"));
			goodGroupVO.setGoodGroupName(rs.getString("goodGroupName"));
			GoodGroupVOs.add(goodGroupVO);
		}
		
		return GoodGroupVOs;
	}

	//向数据库中加入商品分组信息
	@Override
	public void addGoodGroup(String GroupName) {
		String sql="insert into caigou_goodGroup(goodGroupName) values(?)";
		
		List<Object> params = new ArrayList<>();
		params.add(GroupName);
		this.SaveOrUpdate(sql, params);
	}


	@Override
	public String  getNameById(int groupId) {
		String sql="select * from caigou_goodGroup where goodGroupId=?";
		List<Object> params = new ArrayList<>();
		params.add(groupId);
		return this.queryForSingle(sql, params).getGoodGroupName();
		
		
	}

}
