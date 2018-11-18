package mjy.login.beans.po;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

/**
 * 被邀请人用户信息
 * @author student
 *
 */

public class InvitedUserPO implements Serializable{
	private int invitedUserId;
	private int invitedUserBy;    //邀请人请人id
	private String invitedUserName; //被邀请人姓名
	private String invitedUserPhone; //被邀请人手机号
	private String invitedUserEmail;  //被邀请人邮箱
	private String invitedUserPost;  //被邀请人岗位
	private int invitedUserActivationState;  //激活状态
	private String invitedUserActivationCode; //激活码活码
	private Date invitedUserRegisterTime;  //注册时间
	
	
	public int getInvitedUserId() {
		return invitedUserId;
	}
	public void setInvitedUserId(int invitedUserId) {
		this.invitedUserId = invitedUserId;
	}
	public int getInvitedUserBy() {
		return invitedUserBy;
	}
	public void setInvitedUserBy(int invitedUserBy) {
		this.invitedUserBy = invitedUserBy;
	}
	public String getInvitedUserName() {
		return invitedUserName;
	}
	public void setInvitedUserName(String invitedUserName) {
		this.invitedUserName = invitedUserName;
	}
	public String getInvitedUserPhone() {
		return invitedUserPhone;
	}
	public void setInvitedUserPhone(String invitedUserPhone) {
		this.invitedUserPhone = invitedUserPhone;
	}
	public String getInvitedUserEmail() {
		return invitedUserEmail;
	}
	public void setInvitedUserEmail(String invitedUserEmail) {
		this.invitedUserEmail = invitedUserEmail;
	}
	public String getInvitedUserPost() {
		return invitedUserPost;
	}
	public void setInvitedUserPost(String invitedUserPost) {
		this.invitedUserPost = invitedUserPost;
	}
	public int getInvitedUserActivationState() {
		return invitedUserActivationState;
	}
	public void setInvitedUserActivationState(int invitedUserActivationState) {
		this.invitedUserActivationState = invitedUserActivationState;
	}
	public String getInvitedUserActivationCode() {
		return invitedUserActivationCode;
	}
	public void setInvitedUserActivationCode(String invitedUserActivationCode) {
		this.invitedUserActivationCode = invitedUserActivationCode;
	}
	public Date getInvitedUserRegisterTime() {
		return invitedUserRegisterTime;
	}
	public void setInvitedUserRegisterTime(Date invitedUserRegisterTime) {
		this.invitedUserRegisterTime = invitedUserRegisterTime;
	}
	
	public Date getLastActivateTime() {  //最终激活期限
		Calendar cl = Calendar.getInstance();   //获取当前日历
		cl.setTime(invitedUserRegisterTime);  //设置当前时间
		cl.add(Calendar.DATE, 2); //添加激活码的有效时间
		
		return cl.getTime();
	}
	@Override
	public String toString() {
		return "InvitedUserPO [invitedUserId=" + invitedUserId + ", invitedUserBy=" + invitedUserBy
				+ ", invitedUserName=" + invitedUserName + ", invitedUserPhone=" + invitedUserPhone
				+ ", invitedUserEmail=" + invitedUserEmail + ", invitedUserPost=" + invitedUserPost
				+ ", invitedUserActivationState=" + invitedUserActivationState + ", invitedUserActivationCode="
				+ invitedUserActivationCode + ", invitedUserRegisterTime=" + invitedUserRegisterTime + "]";
	}
	
}
