package mjy.login.dao;

import mjy.login.beans.po.UserPO;
import mjy.login.beans.vo.ForgetInfoVO;
import mjy.login.beans.vo.LoginInfoVO;

public interface UserDao {
	/**
	 * ͨ����¼��Ϣ��ȡ�û���Ϣ��ƥ��ʧ�ܷ���NULL
	 * @param loginInfo
	 * @return
	 */
	UserPO   getUserInfo(LoginInfoVO loginInfo);
	
	/**
	 * ͨ���û�Id��ȡ�û���Ϣ
	 * @param userId
	 * @return
	 */
	UserPO   getUserInfo(Integer userId);
	
	/**
	 * 通过邮箱获取用户信息
	 * @param email
	 * @return
	 */
	UserPO getUserPO(String email);
	
	/**
	 * 注册用户
	 * @param user
	 * @return
	 */	

	boolean registerUser(UserPO user);
	
	
	
	
	/**
	 *保存用户信息
	 * @param user
	 * @return
	 */	
	boolean saveUser(UserPO user);
	
	
	/**
	 * ����˺��Ƿ����
	 * @param accontNo�˺�
	 * @param accType�˺�����
	 * @return
	 */
	boolean checkAccNo(String accontNo, String accType);
	/**
	 * �ֻ�������ڼ��
	 * @param phoneNo
	 * @return ���ڵ��ֻ��ŷ���true
	 */
	boolean phoneNoExistCheck(String phoneNo);

	
	/**
	 * ������ڼ��
	 * @param email
	 * @return ���ڵ����䷵��true
	 */
	boolean emailExistCheck(String email);
	
	
	/**
	 * �޸�����
	 */
	boolean updateUser(ForgetInfoVO forgetInfo);
	
	boolean shopCheck(String shop);
	
	
	
	

}
