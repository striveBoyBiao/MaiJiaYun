package mjy.login.dao;

import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;

import mjy.login.beans.po.InvitedUserPO;
public interface InvitedUserDao {
	
	/**
	 *保存被邀请人信息
	 * private int invitedUserId;
		private int invitedUserBy;    //�?请人id
		private String invitedUserName; //被邀请人姓名
		private String invitedUserPhone; //被邀请人手机�?
		private String invitedUserEmail;  //被邀请人邮箱
		private String invitedUserPost;  //被邀请人岗位
		private int invitedUserActivationState;  //�?活状�?
		private String invitedUserActivationCode; //�?活码
		private Date invitedUserRegisterTime;  //注册时间
	 * 
	 * @param user
	 */
	public boolean save(InvitedUserPO user);
	
	/**
	 *更新用户信息
	 * 
	 */
	
	public boolean update(InvitedUserPO user);
	
	/**
	 * 获取用户信息
	 * @throws ParseException 
	 */
	public InvitedUserPO find(String email) throws ParseException;
	
	
}
