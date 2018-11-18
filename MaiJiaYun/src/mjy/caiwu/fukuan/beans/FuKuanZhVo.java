package mjy.caiwu.fukuan.beans;

public class FuKuanZhVo {
	private String fkzhBankId;//付款银行账户ID
	private String fkzhBankName;//开户机构
	private String fkzhDafaultId;//默认
	private String fkzhRemark;
	private boolean dafaultBankId;//是否默认
	private Integer flshopId;//店铺
	public String getFkzhBankId() {
		return fkzhBankId;
	}
	public void setFkzhBankId(String fkzhBankId) {
		this.fkzhBankId = fkzhBankId;
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
	public Integer getFlshopId() {
		return flshopId;
	}
	public void setFlshopId(Integer flshopId) {
		this.flshopId = flshopId;
	}
	
	
}
