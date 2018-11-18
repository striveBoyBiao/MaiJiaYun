package mjy.caigou.dao;

import java.util.List;

import mjy.caigou.vo.GoodGroupVO;

public interface GoodGroupDao {
	public List<GoodGroupVO> QueryGoodGroupName();//查询商品分类表的名称集合
	
	public void addGoodGroup(String GroupName);//添加商品分类
	
	public String  getNameById(int groupId);//通过id找商品分类名称
	
}
