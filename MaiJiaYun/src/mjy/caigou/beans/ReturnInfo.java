package mjy.caigou.beans;

/**
 * 记录采购退货单信息
 * 
 * @author student
 *
 */
public class ReturnInfo {
	// 采购单编码
	private String purchaseCode;
	// 供应商信息
	private String supplierCName;
	// 采购入库仓库名称
	private String purchaseWarehouseName;
	// 退货仓库名称
	private String returnWarehouseName;
	// 退货总数
	private Integer returnNumber;
	// 退货总金额
	private Double returnMoney;
	// 采购退货备注
	private String returnRemark;

	public String getReturnRemark() {
		return returnRemark;
	}

	public void setReturnRemark(String returnRemark) {
		this.returnRemark = returnRemark;
	}

	public String getPurchaseCode() {
		return purchaseCode;
	}

	public void setPurchaseCode(String purchaseCode) {
		this.purchaseCode = purchaseCode;
	}

	public String getSupplierCName() {
		return supplierCName;
	}

	public String getReturnWarehouseName() {
		return returnWarehouseName;
	}

	public void setReturnWarehouseName(String returnWarehouseName) {
		this.returnWarehouseName = returnWarehouseName;
	}

	public void setSupplierCName(String supplierCName) {
		this.supplierCName = supplierCName;
	}

	public String getPurchaseWarehouseName() {
		return purchaseWarehouseName;
	}

	public void setPurchaseWarehouseName(String purchaseWarehouseName) {
		this.purchaseWarehouseName = purchaseWarehouseName;
	}

	public Integer getReturnNumber() {
		return returnNumber;
	}

	public void setReturnNumber(Integer returnNumber) {
		this.returnNumber = returnNumber;
	}

	public Double getReturnMoney() {
		return returnMoney;
	}

	public void setReturnMoney(Double returnMoney) {
		this.returnMoney = returnMoney;
	}

	@Override
	public String toString() {
		return "ReturnInfo [purchaseCode=" + purchaseCode + ", supplierCName=" + supplierCName
				+ ", purchaseWarehouseName=" + purchaseWarehouseName + ", returnWarehouseName=" + returnWarehouseName
				+ ", returnNumber=" + returnNumber + ", returnMoney=" + returnMoney + ", returnRemark=" + returnRemark
				+ "]";
	}

}
