package mjy.login.beans.po;

import java.io.Serializable;

/**
 * 封装与common_post表字段一一对应的PO对象
 * @author student
 *
 */
public class PostPO implements Serializable{
	private Integer postId;
	private String postName;
	

	public String getPostName() {
		return postName;
	}
	public void setPostName(String postName) {
		this.postName = postName;
	}
	public Integer getPostId() {
		return postId;
	}
	public void setPostId(Integer postId) {
		this.postId = postId;
	}
	@Override
	public String toString() {
		return "PostPO [postId=" + postId + ", postName=" + postName + "]";
	}
	
	
}
