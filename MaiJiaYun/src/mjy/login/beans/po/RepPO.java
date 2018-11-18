package mjy.login.beans.po;

public class RepPO {
	private Integer empId;
	private Integer postId;
	public Integer getEmpId() {
		return empId;
	}
	public void setEmpId(Integer empId) {
		this.empId = empId;
	}
	public Integer getPostId() {
		return postId;
	}
	public void setPostId(Integer postId) {
		this.postId = postId;
	}
	public RepPO(Integer empId, Integer postId) {
		super();
		this.empId = empId;
		this.postId = postId;
	}
	public RepPO() {}
	@Override
	public String toString() {
		return "RepPO [empId=" + empId + ", postId=" + postId + "]";
	}
	
}
