package mjy.caigou.po;

public class SupplierPO {
	private String supplierCName;
	private Integer supplierId;
	// 页面第一条数据在数据库中的起始位置
	private Integer beginNum;
	private Integer userId;

	public String getQueryUrl() {
		StringBuffer queryUrl = new StringBuffer("");
		if (supplierCName != null) {
			queryUrl.append(supplierCName);
		}
		return queryUrl.toString();
	}

	public Integer getBeginNum() {
		return beginNum;
	}

	public void setBeginNum(Integer beginNum) {
		this.beginNum = beginNum;
	}

	public Integer getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(Integer supplierId) {
		this.supplierId = supplierId;
	}

	public String getSupplierCName() {
		return supplierCName;
	}

	public void setSupplierCName(String supplierCName) {
		this.supplierCName = supplierCName;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

}
