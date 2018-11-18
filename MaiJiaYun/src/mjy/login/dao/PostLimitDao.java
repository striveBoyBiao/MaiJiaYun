package mjy.login.dao;

import java.util.List;

import mjy.login.beans.vo.PostLimitVO;

public interface PostLimitDao {
	/**
	 * 通过权限ID获取权限PO对象
	 * @param limitId
	 * @return
	 */
	PostLimitVO getLimitPO(Integer limitId);
	
	/**
	 * 通过岗位id获取其基础的权限PO对象集合
	 * @param postId
	 * @return
	 */
	List<PostLimitVO> getBasicPostLimit(Integer postId);
	
	/**
	 * 获得岗位额外权限
	 * @param bossId老板userId
	 * @param postId岗位Id
	 * @return
	 */
	List<PostLimitVO> getExtraPostLimit(Integer bossId,Integer postId);
	
	
}
