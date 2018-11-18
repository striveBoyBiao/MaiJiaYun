package mjy.order.bean.vo;

public class Shop {
	private Integer shopId;
	private String shopName;
	public Integer getShopId() {
		return shopId;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	@Override
	public String toString() {
		return "Shop [shopId=" + shopId + ", shopName=" + shopName + "]";
	}
	
}
