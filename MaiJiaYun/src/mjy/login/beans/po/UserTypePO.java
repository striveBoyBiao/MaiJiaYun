package mjy.login.beans.po;

import java.io.Serializable;

public class UserTypePO implements Serializable{
	private String userType;
	private String userTypeId;
	
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getUserTypeId() {
		return userTypeId;
	}
	public void setUserTypeId(String userTypeId) {
		this.userTypeId = userTypeId;
	}
	
	
}
