package mjy.caigou.beans;

public class PurchaseInfo {
	// 商品Id
	private Integer goodId;
	// 商品图片地址
	private String goodPicture;
	// 商品sku编码
	private String sku;
	// 商品名称
	private String goodName;
	// 每种商品采购数量
	private String purchaseNumber;
	// 每种商品采购金额
	private Double purchaseSum;
	// 商品属性
	private String properties;
	// 每种商品退货数量
	private Integer quantity;
	// 每种商品退货金额
	private Double price;

	public Integer getGoodId() {
		return goodId;
	}

	public void setGoodId(Integer goodId) {
		this.goodId = goodId;
	}

	public String getGoodPicture() {
		return goodPicture;
	}

	public void setGoodPicture(String goodPicture) {
		this.goodPicture = goodPicture;
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

	public String getPurchaseNumber() {
		return purchaseNumber;
	}

	public void setPurchaseNumber(String purchaseNumber) {
		this.purchaseNumber = purchaseNumber;
	}

	public Double getPurchaseSum() {
		return purchaseSum;
	}

	public void setPurchaseSum(Double purchaseSum) {
		this.purchaseSum = purchaseSum;
	}

	public String getProperties() {
		return properties;
	}

	public void setProperties(String properties) {
		this.properties = properties;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "PurchaseInfo [goodId=" + goodId + ", goodPicture=" + goodPicture + ", sku=" + sku + ", goodName="
				+ goodName + ", purchaseNumber=" + purchaseNumber + ", purchaseSum=" + purchaseSum + ", properties="
				+ properties + ", quantity=" + quantity + ", price=" + price + "]";
	}

}
