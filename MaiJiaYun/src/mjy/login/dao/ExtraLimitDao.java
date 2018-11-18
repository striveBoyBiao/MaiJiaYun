package mjy.login.dao;

import java.util.List;

import mjy.login.beans.po.ExtraLimitPO;

public interface ExtraLimitDao {
	/**
	 * ��ȡ��λ�Ķ���Ȩ��
	 * @param bossId �ϰ�Id
	 * @param postId ��λId
	 * @return
	 */
	List<ExtraLimitPO> getExtraLimits(Integer bossId,Integer postId);
	
	/**
	 * ��Ӹ�λ����Ȩ��
	 * @param bossId
	 * @param postId
	 * @return
	 */
	boolean addExtraLimit(ExtraLimitPO extraLimitPO);
	
	/**
	 * ���¸�λ����Ȩ��
	 * @param bossId
	 * @param postId
	 * @return
	 */
	boolean updateExtraLimit(ExtraLimitPO extraLimitPO);
}
