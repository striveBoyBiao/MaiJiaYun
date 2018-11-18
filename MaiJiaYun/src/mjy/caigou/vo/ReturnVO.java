package mjy.caigou.vo;

public class ReturnVO {
	// 采购退货单Id
	private Integer returnId;
	// 采购退货单编码
	private String returnCode;
	// 采购单Id
	private Integer purchaseId;
	// 采购单编码
	private String purchaseCode;
	// 供应商名字
	private String supplierCName;
	// 退货仓库Id
	private Integer returnWarehouseId;
	// 退货仓库名称
	private String returnWarehouseName;
	// 采购入库仓库Id
	private Integer purchaseWarehouseId;
	// 采购入库仓库名称
	private String purchaseWarehouseName;
	// 采购退货总数
	private Integer returnNumber;
	// 已出库数量
	private Integer returnOutNum;
	// 采购退货总金额
	private Double returnMoney;
	// 采购总数
	private Double purchaseSum;
	// 采购退货单创建时间
	private String returnTime;
	// 采购退货制单人Id
	private Integer returnMaker;
	// 采购退货制单人名称
	private String returnMakerName;
	// 采购退货审单人Id
	private Integer returnChecker;
	// 采购退货审单人名称
	private String retrunCheckerName;
	// 采购退货备注
	private String returnRemark;
	// 采购退货状态
	private Integer returnState;
	// 用户Id
	private Integer userId;
	// 删除状态
	private Integer deleteState;

	public Integer getDeleteState() {
		return deleteState;
	}

	public void setDeleteState(Integer deleteState) {
		this.deleteState = deleteState;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Double getPurchaseSum() {
		return purchaseSum;
	}

	public void setPurchaseSum(Double purchaseSum) {
		this.purchaseSum = purchaseSum;
	}

	public Integer getReturnId() {
		return returnId;
	}

	public void setReturnId(Integer returnId) {
		this.returnId = returnId;
	}

	public String getReturnCode() {
		return returnCode;
	}

	public void setReturnCode(String returnCode) {
		this.returnCode = returnCode;
	}

	public Integer getPurchaseId() {
		return purchaseId;
	}

	public void setPurchaseId(Integer purchaseId) {
		this.purchaseId = purchaseId;
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

	public void setSupplierCName(String supplierCName) {
		this.supplierCName = supplierCName;
	}

	public Integer getReturnWarehouseId() {
		return returnWarehouseId;
	}

	public void setReturnWarehouseId(Integer returnWarehouseId) {
		this.returnWarehouseId = returnWarehouseId;
	}

	public String getReturnWarehouseName() {
		return returnWarehouseName;
	}

	public void setReturnWarehouseName(String returnWarehouseName) {
		this.returnWarehouseName = returnWarehouseName;
	}

	public Integer getPurchaseWarehouseId() {
		return purchaseWarehouseId;
	}

	public void setPurchaseWarehouseId(Integer purchaseWarehouseId) {
		this.purchaseWarehouseId = purchaseWarehouseId;
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

	public Integer getReturnOutNum() {
		return returnOutNum;
	}

	public void setReturnOutNum(Integer returnOutNum) {
		this.returnOutNum = returnOutNum;
	}

	public Double getReturnMoney() {
		return returnMoney;
	}

	public void setReturnMoney(Double returnMoney) {
		this.returnMoney = returnMoney;
	}

	public String getReturnTime() {
		return returnTime;
	}

	public void setReturnTime(String returnTime) {
		this.returnTime = returnTime;
	}

	public Integer getReturnMaker() {
		return returnMaker;
	}

	public void setReturnMaker(Integer returnMaker) {
		this.returnMaker = returnMaker;
	}

	public String getReturnMakerName() {
		return returnMakerName;
	}

	public void setReturnMakerName(String returnMakerName) {
		this.returnMakerName = returnMakerName;
	}

	public Integer getReturnChecker() {
		return returnChecker;
	}

	public void setReturnChecker(Integer returnChecker) {
		this.returnChecker = returnChecker;
	}

	public String getRetrunCheckerName() {
		return retrunCheckerName;
	}

	public void setRetrunCheckerName(String retrunCheckerName) {
		this.retrunCheckerName = retrunCheckerName;
	}

	public String getReturnRemark() {
		return returnRemark;
	}

	public void setReturnRemark(String returnRemark) {
		this.returnRemark = returnRemark;
	}

	public Integer getReturnState() {
		return returnState;
	}

	public void setReturnState(Integer returnState) {
		this.returnState = returnState;
	}

}
