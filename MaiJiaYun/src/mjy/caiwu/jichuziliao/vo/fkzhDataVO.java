package mjy.caiwu.jichuziliao.vo;

public class fkzhDataVO {
	private String shopName;
	private int shopId;
	private String fkzhBankName;
	private String fkzhBankId;
	private int dafaultBankId;
	private int fkzhDafaultId;
	private String fkzhRemark;
	private int isExist;
	
	public int getIsExist() {
		return isExist;
	}
	public void setIsExist(int isExist) {
		this.isExist = isExist;
	}
	public int getShopId() {
		return shopId;
	}
	public void setShopId(int shopId) {
		this.shopId = shopId;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getFkzhBankName() {
		return fkzhBankName;
	}
	public void setFkzhBankName(String fkzhBankName) {
		this.fkzhBankName = fkzhBankName;
	}
	public String getFkzhBankId() {
		return fkzhBankId;
	}
	public void setFkzhBankId(String fkzhBankId) {
		this.fkzhBankId = fkzhBankId;
	}
	public void setDafaultBankId(int dafaultBankId) {
		this.dafaultBankId = dafaultBankId;
	}
	public int getDafaultBankId() {
		return dafaultBankId;
	}
	public int getFkzhDafaultId() {
		return fkzhDafaultId;
	}
	public void setFkzhDafaultId(int fkzhDafaultId) {
		this.fkzhDafaultId = fkzhDafaultId;
	}
	public String getFkzhRemark() {
		return fkzhRemark;
	}
	public void setFkzhRemark(String fkzhRemark) {
		this.fkzhRemark = fkzhRemark;
	}
	@Override
	public String toString() {
		return "fkzhDataVO [shopName=" + shopName + ", shopId=" + shopId + ", fkzhBankName=" + fkzhBankName
				+ ", fkzhBankId=" + fkzhBankId + ", dafaultBankId=" + dafaultBankId + ", fkzhDafaultId=" + fkzhDafaultId
				+ ", fkzhRemark=" + fkzhRemark + "]";
	}
	
	
}
