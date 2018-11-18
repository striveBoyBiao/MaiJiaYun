package mjy.login.beans.po;

import java.io.Serializable;

public class ExtraLimitPO implements Serializable{
	private Integer bossId;
	private Integer postId;
	private Integer limitId;
	private Integer extIsSelected;

	public Integer getBossId() {
		return bossId;
	}

	public void setBossId(Integer bossId) {
		this.bossId = bossId;
	}

	public Integer getPostId() {
		return postId;
	}

	public void setPostId(Integer postId) {
		this.postId = postId;
	}

	public Integer getLimitId() {
		return limitId;
	}

	public void setLimitId(Integer limitId) {
		this.limitId = limitId;
	}

	public Integer getExtIsSelected() {
		return extIsSelected;
	}

	public void setExtIsSelected(Integer extIsSelected) {
		this.extIsSelected = extIsSelected;
	}

	@Override
	public String toString() {
		return "ExtraLimitPO [bossId=" + bossId + ", postId=" + postId + ", limitId=" + limitId + ", extIsSelected="
				+ extIsSelected + "]";
	}

}
