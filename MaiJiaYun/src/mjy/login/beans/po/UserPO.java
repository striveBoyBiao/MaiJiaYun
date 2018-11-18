package mjy.login.beans.po;

import java.io.Serializable;

public class UserPO implements Serializable{
	private Integer userId;
	private String userPhoneNo;
	private String userPassword;
	private String userType;
	private String userNickname;
	private String userName;
	private String userEmail;
	private String userImgPath;
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserPhoneNumber() {
		return userPhoneNo;
	}
	public void setUserPhoneNumber(String userPhoneNumber) {
		this.userPhoneNo = userPhoneNumber;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserImgPath() {
		return userImgPath;
	}
	public void setUserImgPath(String userImgPath) {
		this.userImgPath = userImgPath;
	}
	@Override
	public String toString() {
		return "UserPO [userId=" + userId + ", userPhoneNo=" + userPhoneNo + ", userPassword=" + userPassword
				+ ", userType=" + userType + ", userNickname=" + userNickname + ", userName=" + userName
				+ ", userEmail=" + userEmail + ", userImgPath=" + userImgPath + "]";
	}
	
	
	
	
}
