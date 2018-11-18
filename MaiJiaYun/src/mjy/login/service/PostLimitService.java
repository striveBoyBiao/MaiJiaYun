package mjy.login.service;

import java.util.List;

import mjy.login.beans.po.BossPO;
import mjy.login.beans.po.PostPO;
import mjy.login.beans.vo.PostLimitVO;
import mjy.login.beans.vo.PostVO;
import mjy.login.beans.vo.UserInfoVO;

/**
 * �û���λ����Ȩ����ص�service
 * @author student
 *
 */
public interface PostLimitService {
	/**
	 * ��ȡ�û����и�λ��Ϣ����
	 * @param userInfoVO�û���ϢVO����
	 * @return
	 */
	List<PostVO> getUserPostVOs(UserInfoVO userInfoVO);
	
	/**
	 * ��ȡԱ�����еĸ�λ����
	 * @param usetId
	 * @return
	 */
	List<PostVO> getEmpPostVOs(Integer empId,Integer bossId);
	
	/**
	 * ��ȡ�ϰ����и�λ��Ϣ
	 * @param bossId
	 * @return
	 */
	List<PostVO> getBossPostVOs(BossPO bossPO);
	
	/**
	 * ��ȡ�û�ĳ����λ�µ���Ȩ�޼���
	 * @param userId
	 * @param postId
	 * @return
	 */
	List<PostLimitVO> getPostLimitVOs(Integer bossId,Integer postId);
	
	/**
	 * 获取所有的职位
	 * @return
	 */
	List<PostPO> getAllPost();
}
