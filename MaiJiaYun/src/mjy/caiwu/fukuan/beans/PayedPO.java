package mjy.caiwu.fukuan.beans;

public class PayedPO {
	private Integer fkShouzhilxId;
	private int rowStart;
	private String fkNo;//�ɹ����
	private String key;
	private Integer bossid;
	
	public Integer getFkShouzhilxId() {
		return fkShouzhilxId;
	}
	public void setFkShouzhilxId(Integer fkShouzhilxId) {
		this.fkShouzhilxId = fkShouzhilxId;
	}
	public int getRowStart() {
		return rowStart;
	}
	public void setRowStart(int rowStart) {
		this.rowStart = rowStart;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getFkNo() {
		return fkNo;
	}
	public void setFkNo(String fkNo) {
		this.fkNo = fkNo;
	}
	public Integer getBossid() {
		return bossid;
	}
	public void setBossid(Integer bossid) {
		this.bossid = bossid;
	}
	@Override
	public String toString() {
		return "PayedPO [fkShouzhilxId=" + fkShouzhilxId + ", rowStart=" + rowStart + ", fkNo=" + fkNo + ", key=" + key
				+ ", bossid=" + bossid + "]";
	}
	
}
