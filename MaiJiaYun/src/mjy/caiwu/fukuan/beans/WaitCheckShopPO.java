package mjy.caiwu.fukuan.beans;
/**
 * 商品
*/
public class WaitCheckShopPO {

	private String goodPicture;//商品图片
	private String sku;//sku码
	private String goodName;//商品名字
	private String goodAttribute;//商品属性
	private Integer purchaseNum;//采购数量
	private Integer quantity;//入库数量
	private Double purchasePrice;//采购价格
	private Double purchaseSum;//采购总价
	private String remark_1;//备注1
	


	
	
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
	public Integer getPurchaseNum() {
		return purchaseNum;
	}
	public void setPurchaseNum(Integer purchaseNum) {
		this.purchaseNum = purchaseNum;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Double getPurchasePrice() {
		return purchasePrice;
	}
	public void setPurchasePrice(Double purchasePrice) {
		this.purchasePrice = purchasePrice;
	}
	public Double getPurchaseSum() {
		return purchaseSum;
	}
	public void setPurchaseSum(Double purchaseSum) {
		this.purchaseSum = purchaseSum;
	}
	public String getRemark_1() {
		return remark_1;
	}
	public void setRemark_1(String remark_1) {
		this.remark_1 = remark_1;
	}

	public String getGoodAttribute() {
		return goodAttribute;
	}
	public void setGoodAttribute(String goodAttribute) {
		this.goodAttribute = goodAttribute;
	}
	@Override
	public String toString() {
		return "WaitCheckShopPO [goodPicture=" + goodPicture + ", sku=" + sku
				+ ", goodName=" + goodName + ", goodAttribute=" + goodAttribute
				+ ", purchaseNum=" + purchaseNum + ", quantity=" + quantity
				+ ", purchasePrice=" + purchasePrice + ", purchaseSum="
				+ purchaseSum + ", remark_1=" + remark_1 + "]";
	}

	
	
	
	
}
