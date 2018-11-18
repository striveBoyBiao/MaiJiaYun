package mjy.kuguan.diaobo.po;

public class GoodsPO {
	private String sku;//sku编码
	private String goodName;//商品名称
	private Integer goodCount;//商品库存
	private String goodPicture;//商品图
	private String property;//商品属性
	
	
	public String getProperty() {
		return property;
	}
	public void setProperty(String property) {
		this.property = property;
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
	public Integer getGoodCount() {
		return goodCount;
	}
	public void setGoodCount(Integer goodCount) {
		this.goodCount = goodCount;
	}
	public String getGoodPicture() {
		return goodPicture;
	}
	public void setGoodPicture(String goodPicture) {
		this.goodPicture = goodPicture;
	}
	@Override
	public String toString() {
		return "GoodsPO [sku=" + sku + ", goodName=" + goodName + ", goodCount=" + goodCount + ", goodPicture="
				+ goodPicture + ", property=" + property + "]";
	}
	
		
}
