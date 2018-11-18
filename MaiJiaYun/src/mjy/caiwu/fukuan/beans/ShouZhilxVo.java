package mjy.caiwu.fukuan.beans;
/**
 * 收支类型表的所有的数据
 * @author student
 * 2016年12月12日
 */

public class ShouZhilxVo {
	private Integer shouzhilxId;	//无含义的id
	private String shouzhilxType;	//收支类型
	private String shouzhilxStatus;	//状态，是否启用
	private String shouzhilxComment;	//
	
	public Integer getShouzhilxId() {
		return shouzhilxId;
	}
	public void setShouzhilxId(Integer shouzhilxId) {
		this.shouzhilxId = shouzhilxId;
	}
	public String getShouzhilxType() {
		return shouzhilxType;
	}
	public void setShouzhilxType(String shouzhilxType) {
		this.shouzhilxType = shouzhilxType;
	}
	public String getShouzhilxStatus() {
		return shouzhilxStatus;
	}
	public void setShouzhilxStatus(String shouzhilxStatus) {
		this.shouzhilxStatus = shouzhilxStatus;
	}
	public String getShouzhilxComment() {
		return shouzhilxComment;
	}
	public void setShouzhilxComment(String shouzhilxComment) {
		this.shouzhilxComment = shouzhilxComment;
	}
	@Override
	public String toString() {
		return "ShouZhilxVo [shouzhilxId=" + shouzhilxId + ", shouzhilxType=" + shouzhilxType + ", shouzhilxStatus="
				+ shouzhilxStatus + ", shouzhilxComment=" + shouzhilxComment + "]";
	}
	
}
