package mjy.login.beans.vo;

import java.io.Serializable;
import java.util.List;
/**
 * ��λVO�������װ��λ�����Ϣ����Ȩ��
 * @author student
 *
 */
public class PostVO implements Serializable{
	private Integer userId;
	private Integer bossId;
	private Integer postId;
	private String postName;
	//�Ƿ�����
	private boolean isHide;
	/**
	 * ��λ�µ�������Ȩ����
	 */
	private List<PostLimitVO> limits;
	
	public PostVO(){}
	public PostVO(Integer userId, Integer bossId, Integer postId, String postName, List<PostLimitVO> limits) {
		super();
		this.userId = userId;
		this.bossId = bossId;
		this.postId = postId;
		this.postName = postName;
		this.limits = limits;
	}


	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

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

	public String getPostName() {
		return postName;
	}

	public void setPostName(String postName) {
		this.postName = postName;
	}

	public List<PostLimitVO> getLimits() {
		return limits;
	}

	public void setLimits(List<PostLimitVO> limits) {
		this.limits = limits;
	}

	public boolean isHide() {
		return isHide;
	}
	public void setHide(boolean isHide) {
		this.isHide = isHide;
	}
	@Override
	public String toString() {
		return "PostVO [userId=" + userId + ", bossId=" + bossId + ", postId=" + postId + ", postName=" + postName
				+ ", isHide=" + isHide + ", limits=" + limits + "]";
	}


}
