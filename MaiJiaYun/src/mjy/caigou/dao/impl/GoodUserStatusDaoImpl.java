package mjy.caigou.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.caigou.beans.PageInfo;
import mjy.caigou.dao.BaseDao;
import mjy.caigou.dao.GoodUserStatusDao;
import mjy.caigou.vo.GoodUserStatusVO;

public class GoodUserStatusDaoImpl extends BaseDao<GoodUserStatusVO> implements GoodUserStatusDao {

	
	//得到当前用户的所有商品id信息
	@Override
	public List<Integer> getGoodIds(int userId) {
		List<Integer> goodIds=new ArrayList<>();
		String sql="select * from caigou_gooduserstatus where isUse=1 and userId=?";
		List<Object> params = new ArrayList<>();
		params.add(userId);
		List<GoodUserStatusVO> vos= this.queryForList(sql, params);
		for (GoodUserStatusVO goodUserStatusVO : vos) {
			goodIds.add(goodUserStatusVO.getGoodId());
		}
		return goodIds;
	}

	
	
	
	
	@Override
	public List<GoodUserStatusVO> mapRow(ResultSet rs) throws Exception {
		List<GoodUserStatusVO> list=new ArrayList<>();
		GoodUserStatusVO goodUserStatusVO=null;
		while(rs.next()){
			goodUserStatusVO=new GoodUserStatusVO();
			goodUserStatusVO.setGoodId(rs.getInt("goodId"));
			goodUserStatusVO.setUserId(rs.getInt("userId"));
			goodUserStatusVO.setIsUse(rs.getString("isUse"));
			goodUserStatusVO.setGoodName(rs.getString("goodName"));
			list.add(goodUserStatusVO);
		}
		return list;
	}




	//得到当前用户的商品总数
	@Override
	public int getCount(int userId) {
		String sql="select * from caigou_gooduserstatus where userId=? and isUse=1";
		List<Object> params = new ArrayList<>();
		params.add(userId);
		return this.queryForList(sql, params).size();
		
	}
	
	//得到当前用户的商品总数
		@Override
		public int getNameCount(GoodUserStatusVO goodUserStatusVO) {
			String sql="select * from caigou_gooduserstatus where userId=? and isUse=1 and goodName like ?";
			List<Object> params = new ArrayList<>();
			params.add(goodUserStatusVO.getUserId());
			params.add("%"+goodUserStatusVO.getGoodName()+"%");
			return this.queryForList(sql, params).size();
			
		}

	


	//通过goodId 修改当前用户的商品状态
	@Override
	public void updateGoodsStatus(int goodId, int userId) {
		String sql="update caigou_gooduserstatus set isUse=0 where goodId=? and userId=?";
		List<Object> params = new ArrayList<>();
		params.add(goodId);
		params.add(userId);
		this.SaveOrUpdate(sql, params);
	}





	//增加商品用户
	@Override
	public void addGoodUser(GoodUserStatusVO gusvo) {
		String sql="insert into  caigou_gooduserstatus(goodId,userId,goodName) values(?,?,?)";
		List<Object> params=new ArrayList<>();
		params.add(gusvo.getGoodId());
		params.add(gusvo.getUserId());
		params.add(gusvo.getGoodName());
		
		this.SaveOrUpdate(sql, params);
		
	}




	//通过id得到goodName
	@Override
	public String getGoodNameById(int goodId, int userId) {
		String sql="select * from caigou_gooduserstatus where goodId=? and userId=?";
		List<Object> params = new ArrayList<>();
		params.add(goodId);
		params.add(userId);
		return this.queryForSingle(sql, params).getGoodName();
	}





	@Override
	public void updateGoodNameById(int goodId, String updateVal, int userId) {
		String sql="update caigou_gooduserstatus set goodName=? where goodId=? and userId=?";
		List<Object> params = new ArrayList<>();
		params.add(updateVal);
		params.add(goodId);
		params.add(userId);
		 this.SaveOrUpdate(sql, params);;
	}




	//姓名模糊查询
	@Override
	public List<Integer> queryGoodsLikeName(GoodUserStatusVO goodUserstatusVO ) {
		List<Integer> listGoodIds=new ArrayList<>();
		System.out.println(goodUserstatusVO);
			String sql="select * from caigou_gooduserstatus where goodName like ? and userId=? and isUse=1";
		
		
		if(goodUserstatusVO.getRowStart()!=null){
			sql = sql + " LIMIT " + goodUserstatusVO.getRowStart() + "," + PageInfo.pageSize;
		}
		
		List<Object> params = new ArrayList<>();
		params.add("%"+goodUserstatusVO.getGoodName()+"%");
		params.add(goodUserstatusVO.getUserId());
		List<GoodUserStatusVO> vos=this.queryForList(sql, params);
		for (GoodUserStatusVO goodUserStatusVO : vos) {
			listGoodIds.add(goodUserStatusVO.getGoodId())	;
		}
		return listGoodIds;
		
	}





	@Override
	public void updateGoodUserStatus(String goodId, GoodUserStatusVO gusvo) {
		String sql="update caigou_gooduserstatus set goodName=?,userId=? where caigou_gooduserstatus.goodId=?";
		List<Object> params=new ArrayList<>();
		
		params.add(gusvo.getGoodName());
		params.add(gusvo.getUserId());
		params.add(goodId);
		
		
		this.SaveOrUpdate(sql, params);
		
	}

	//通过名称模糊查询商品列表的大小
		@Override
		public int queryLengthLikeName(int userId, String name) {
			String sql="select * from caigou_gooduserstatus where goodName like ? and userId=? and isUse=1";
			List<Object> params = new ArrayList<>();
			params.add("%"+name+"%");
			params.add(userId);
			
			
			return this.queryForList(sql, params).size();
		}

	
	
}
