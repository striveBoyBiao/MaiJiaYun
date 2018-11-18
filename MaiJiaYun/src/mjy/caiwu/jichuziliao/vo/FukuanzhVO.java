package mjy.caiwu.jichuziliao.vo;

public class FukuanzhVO {
	private String fkzhBankId;
	private int flshopId;
	private String fkzhBankName;
	private String fkzhDafaultId;
	private String fkzhRemark;
	private boolean dafaultBankId;
	public String getFkzhBankId() {
		return fkzhBankId;
	}
	public void setFkzhBankId(String fkzhBankId) {
		this.fkzhBankId = fkzhBankId;
	}
	public int getFlshopId() {
		return flshopId;
	}
	public void setFlshopId(int flshopId) {
		this.flshopId = flshopId;
	}
	public String getFkzhBankName() {
		return fkzhBankName;
	}
	public void setFkzhBankName(String fkzhBankName) {
		this.fkzhBankName = fkzhBankName;
	}
	public String getFkzhDafaultId() {
		return fkzhDafaultId;
	}
	public void setFkzhDafaultId(String fkzhDafaultId) {
		this.fkzhDafaultId = fkzhDafaultId;
	}
	public String getFkzhRemark() {
		return fkzhRemark;
	}
	public void setFkzhRemark(String fkzhRemark) {
		this.fkzhRemark = fkzhRemark;
	}
	public boolean isDafaultBankId() {
		return dafaultBankId;
	}
	public void setDafaultBankId(boolean dafaultBankId) {
		this.dafaultBankId = dafaultBankId;
	}
	@Override
	public String toString() {
		return "FukuanzhVO [fkzhBankId=" + fkzhBankId + ", flshopId=" + flshopId + ", fkzhBankName=" + fkzhBankName
				+ ", fkzhDafaultId=" + fkzhDafaultId + ", fkzhRemark=" + fkzhRemark + ", dafaultBankId=" + dafaultBankId
				+ "]";
	}
	
}
