package mjy.caiwu.fukuan.beans;
/**
 * 采购
 * @author student
 *
 */
public class WaitCheckCgPO {
	private String supplierCName;//供应商
	private String wareHouseName;//仓库
	private Integer purchaseNumber;//采购数量
	private Integer purchaseSum;//采购总价
	private String remark;//备注
	public String getSupplierCName() {
		return supplierCName;
	}
	public void setSupplierCName(String supplierCName) {
		this.supplierCName = supplierCName;
	}
	public String getWareHouseName() {
		return wareHouseName;
	}
	public void setWareHouseName(String wareHouseName) {
		this.wareHouseName = wareHouseName;
	}
	public Integer getPurchaseNumber() {
		return purchaseNumber;
	}
	public void setPurchaseNumber(Integer purchaseNumber) {
		this.purchaseNumber = purchaseNumber;
	}
	public Integer getPurchaseSum() {
		return purchaseSum;
	}
	public void setPurchaseSum(Integer purchaseSum) {
		this.purchaseSum = purchaseSum;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "WaitCheckCgPO [supplierCName=" + supplierCName
				+ ", wareHouseName=" + wareHouseName + ", purchaseNumber="
				+ purchaseNumber + ", purchaseSum=" + purchaseSum + ", remark="
				+ remark + "]";
	}

	
	
	

}
