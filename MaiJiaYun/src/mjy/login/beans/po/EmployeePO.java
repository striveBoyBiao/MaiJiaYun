package mjy.login.beans.po;

import java.io.Serializable;

/**
 * Ա��PO
 * @author student
 *
 */
public class EmployeePO implements Serializable{
	private Integer userId;
	private Integer bossUserId;

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getBossUserId() {
		return bossUserId;
	}

	public void setBossUserId(Integer bossId) {
		this.bossUserId = bossId;
	}

}
