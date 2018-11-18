package mjy.login.dao;

import java.util.List;

import mjy.login.beans.vo.PostLimitVO;

public interface PostLimitDao {
	/**
	 * ͨ��Ȩ��ID��ȡȨ��PO����
	 * @param limitId
	 * @return
	 */
	PostLimitVO getLimitPO(Integer limitId);
	
	/**
	 * ͨ����λid��ȡ�������Ȩ��PO���󼯺�
	 * @param postId
	 * @return
	 */
	List<PostLimitVO> getBasicPostLimit(Integer postId);
	
	/**
	 * ��ø�λ����Ȩ��
	 * @param bossId�ϰ�userId
	 * @param postId��λId
	 * @return
	 */
	List<PostLimitVO> getExtraPostLimit(Integer bossId,Integer postId);
	
	
}
