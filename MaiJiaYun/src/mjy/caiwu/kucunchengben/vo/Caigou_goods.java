package mjy.caiwu.kucunchengben.vo;

/*
 *   `goodId` int(11) NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `goodGroupId` int(11) NOT NULL,
  `goodName` varchar(255) DEFAULT NULL,
  `goodPrice` double DEFAULT NULL,
  `goodWeight` double DEFAULT NULL,
  `goodRepertory` int(11) DEFAULT NULL,
  `goodVirtualInventories` int(11) DEFAULT NULL,
  `goodInventoryCost` double DEFAULT NULL,
  `goodPicture` varchar(255) DEFAULT NULL,
 */
public class Caigou_goods {
	private int goodId;
	private String sku;
	private int goodGroupId;
	private String goodName;
	private Double goodPrice;
	private Double goodWeight;
	private Integer goodRepertory;
	private Integer goodVirtualInventories;
	private Double goodInventoryCost;
	private String goodPicture;
	private String goodAttribute;


	public int getGoodId() {
		return goodId;
	}


	public void setGoodId(int goodId) {
		this.goodId = goodId;
	}


	public String getSku() {
		return sku;
	}


	public void setSku(String sku) {
		this.sku = sku;
	}


	public int getGoodGroupId() {
		return goodGroupId;
	}


	public void setGoodGroupId(int goodGroupId) {
		this.goodGroupId = goodGroupId;
	}


	public String getGoodName() {
		return goodName;
	}


	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}


	public double getGoodPrice() {
		return goodPrice;
	}


	public void setGoodPrice(double goodPrice) {
		this.goodPrice = goodPrice;
	}


	public Double getGoodWeight() {
		return goodWeight;
	}


	public void setGoodWeight(Double goodWeight) {
		this.goodWeight = goodWeight;
	}


	public Integer getGoodRepertory() {
		return goodRepertory;
	}


	public void setGoodRepertory(Integer goodRepertory) {
		this.goodRepertory = goodRepertory;
	}


	public int getGoodVirtualInventories() {
		return goodVirtualInventories;
	}


	public void setGoodVirtualInventories(int goodVirtualInventories) {
		this.goodVirtualInventories = goodVirtualInventories;
	}


	public double getGoodInventoryCost() {
		return goodInventoryCost;
	}


	public void setGoodInventoryCost(double goodInventoryCost) {
		this.goodInventoryCost = goodInventoryCost;
	}


	public String getGoodPicture() {
		return goodPicture;
	}


	public void setGoodPicture(String goodPicture) {
		this.goodPicture = goodPicture;
	}


	public String getGoodAttribute() {
		return goodAttribute;
	}


	public void setGoodAttribute(String goodAttribute) {
		this.goodAttribute = goodAttribute;
	}


	@Override
	public String toString() {
		return "Caigou_goods [goodId=" + goodId + ", sku=" + sku + ", goodGroupId=" + goodGroupId + ", goodName="
				+ goodName + ", goodPrice=" + goodPrice + ", goodWeight=" + goodWeight + ", goodRepertory="
				+ goodRepertory + ", goodVirtualInventories=" + goodVirtualInventories + ", goodInventoryCost="
				+ goodInventoryCost + ", goodPicture=" + goodPicture + "]";
	}

}
