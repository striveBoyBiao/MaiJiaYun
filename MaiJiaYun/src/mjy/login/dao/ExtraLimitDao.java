package mjy.login.dao;

import java.util.List;

import mjy.login.beans.po.ExtraLimitPO;

public interface ExtraLimitDao {
	/**
	 * 获取岗位的额外权限
	 * @param bossId 老板Id
	 * @param postId 岗位Id
	 * @return
	 */
	List<ExtraLimitPO> getExtraLimits(Integer bossId,Integer postId);
	
	/**
	 * 添加岗位额外权限
	 * @param bossId
	 * @param postId
	 * @return
	 */
	boolean addExtraLimit(ExtraLimitPO extraLimitPO);
	
	/**
	 * 更新岗位额外权限
	 * @param bossId
	 * @param postId
	 * @return
	 */
	boolean updateExtraLimit(ExtraLimitPO extraLimitPO);
}
