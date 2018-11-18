package mjy.login.beans.po;

import java.io.Serializable;

public class BossPO implements Serializable{
	private Integer userID;
	private Integer bossType;
	private String bossCompanyName;

	public Integer getUserID() {
		return userID;
	}
	public void setUserID(Integer userID) {
		this.userID = userID;
	}
	public Integer getBossType() {
		return bossType;
	}
	public void setBossType(Integer bossType) {
		this.bossType = bossType;
	}
	public String getBossCompanyName() {
		return bossCompanyName;
	}
	public void setBossCompanyName(String bossCompanyName) {
		this.bossCompanyName = bossCompanyName;
	}
	@Override
	public String toString() {
		return "BossPO [userID=" + userID + ", bossType=" + bossType + ", bossCompanyName=" + bossCompanyName + "]";
	}

	
	
	

	
	
}
