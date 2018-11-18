package mjy.caiwu.kucunchengben.po;

public class KucuncbPo {
	private int goodId;
	private String goodPicture;
	private String goodName;
	private String sku;
	private String wareHouseName;
	private int goodNum;
	private String goodAttribute;
	private double kucunCost;

	public String getGoodPicture() {
		return goodPicture;
	}

	public void setGoodPicture(String goodPicture) {
		this.goodPicture = goodPicture;
	}

	public String getGoodName() {
		return goodName;
	}

	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}

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

	public String getGoodAttribute() {
		return goodAttribute;
	}

	public void setGoodAttribute(String goodAttribute) {
		this.goodAttribute = goodAttribute;
	}

	public String getWareHouseName() {
		return wareHouseName;
	}

	public void setWareHouseName(String wareHouseName) {
		this.wareHouseName = wareHouseName;
	}

	public int getGoodNum() {
		return goodNum;
	}

	public void setGoodNum(int goodNum) {
		this.goodNum = goodNum;
	}

	public double getKucunCost() {
		return kucunCost;
	}

	public void setKucunCost(double kucunCost) {
		this.kucunCost = kucunCost;
	}

	@Override
	public String toString() {
		return "KucuncbPo [goodId=" + goodId + ", goodPicture=" + goodPicture + ", goodName=" + goodName + ", sku="
				+ sku + ", wareHouseName=" + wareHouseName + ", goodNum=" + goodNum + ", goodAttribute=" + goodAttribute
				+ ", kucunCost=" + kucunCost + "]";
	}

}
