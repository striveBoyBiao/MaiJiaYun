package mjy.order.bean.po;

public class ShopPO {
	
	private Integer shopId;//通过id查询店铺
	private String shopName;//通过名字查询店铺
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
		return "ShopPO [shopId=" + shopId + ", shopName=" + shopName + "]";
	}
}
