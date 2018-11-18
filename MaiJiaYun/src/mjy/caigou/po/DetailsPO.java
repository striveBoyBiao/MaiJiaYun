package mjy.caigou.po;

public class DetailsPO {
	private String sku;//sku 编码
	private String goodName;//商品名称
	private Integer goodPrice;//商品单价
	private Integer purchaseSum;//采购总金额
	private String storageQuantity;//已经入库数量
	private String remark;//备注
	private String goodPicture;//商品图片
	private String supplierCName;//供货商名字
	private String warehouseName;//仓库的名字
	private String purchaseNumber; //采购数量
	
	public String getPurchaseNumber() {
		return purchaseNumber;
	}
	public void setPurchaseNumber(String purchaseNumber) {
		this.purchaseNumber = purchaseNumber;
	}
	public String getSku() {
		return sku;
	}
	public void setSku(String sku) {
		this.sku = sku;
	}
	public String getGoodName() {
		return goodName;
	}
	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}
	public Integer getGoodPrice() {
		return goodPrice;
	}
	public void setGoodPrice(Integer goodPrice) {
		this.goodPrice = goodPrice;
	}
	public Integer getPurchaseSum() {
		return purchaseSum;
	}
	public void setPurchaseSum(Integer purchaseSum) {
		this.purchaseSum = purchaseSum;
	}
	public String getStorageQuantity() {
		return storageQuantity;
	}
	public void setStorageQuantity(String storageQuantity) {
		this.storageQuantity = storageQuantity;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getGoodPicture() {
		return goodPicture;
	}
	public void setGoodPicture(String goodPicture) {
		this.goodPicture = goodPicture;
	}
	public String getSupplierCName() {
		return supplierCName;
	}
	public void setSupplierCName(String supplierCName) {
		this.supplierCName = supplierCName;
	}
	public String getWarehouseName() {
		return warehouseName;
	}
	public void setWarehouseName(String warehouseName) {
		this.warehouseName = warehouseName;
	}
	
	
	
	
	
}
