package mjy.caiwu.jichuziliao.vo;

public class ShouZhiTypeVO {
	private int shouzhilxId;
	private String shouzhilxType;
	private String shouzhilxStatus;
	private String shouzhilxComment;

	public ShouZhiTypeVO() {
		super();
	}

	public ShouZhiTypeVO(String shouzhilxType, String shouzhilxStatus, String shouzhilxComment) {
		this.shouzhilxType = shouzhilxType;
		this.shouzhilxStatus = shouzhilxStatus;
		this.shouzhilxComment = shouzhilxComment;
	}

	public ShouZhiTypeVO(int shouzhilxId, String shouzhilxType, String shouzhilxStatus, String shouzhilxComment) {
		super();
		this.shouzhilxId = shouzhilxId;
		this.shouzhilxType = shouzhilxType;
		this.shouzhilxStatus = shouzhilxStatus;
		this.shouzhilxComment = shouzhilxComment;
	}

	public int getShouzhilxId() {
		return shouzhilxId;
	}

	public void setShouzhilxId(int shouzhilxId) {
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

}
