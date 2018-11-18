package mjy.login.service;

import java.util.List;

import mjy.login.beans.po.PostPO;
import mjy.login.beans.po.UserPO;
import mjy.login.beans.vo.LoginInfoVO;
import mjy.login.beans.vo.UserInfoVO;

public interface UserInfoService {
	/**
	 * �����û���Ϣ
	 * @param userInfo
	 * 
	 * @return
	 */
	boolean registerUser(UserInfoVO userInfo);
	
	
	/**
	 * �����û���Ϣ
	 * @param userPO
	 * @return
	 */
	boolean saveUserPO(UserPO userPO);
	
	/**
	 * ͨ����¼��Ϣ��ȡ�û���Ϣ�����ƥ��ʧ�ܷ���NULL
	 * @param loginInfo
	 * @return UserInfoVO
	 */
	UserInfoVO getUserInfoVO(LoginInfoVO loginInfo);
	
	/**
	 * ��ȡ������Ϣ
	 * @param loginInfo
	 * @return
	 */
	String getErrorMessage(LoginInfoVO loginInfo);
	
	//根据员工id获取员工职位
	List<PostPO> getEmplPost(Integer userid);
	
	//存储员工信息
	boolean savePost(List<PostPO> posts,Integer userid);
	
}
