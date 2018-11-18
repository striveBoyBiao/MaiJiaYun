package mjy.caigou.vo;
/**
 * 商品表
 * @author student
 *
 */
public class ShopVO {
	private Integer shopId;//店铺id
	private Integer userId;//用户id
	private String shopName;//店铺名称
	private String shopUseVirtual;
	public Integer getShopId() {
		return shopId;
	}
	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getShopUseVirtual() {
		return shopUseVirtual;
	}
	public void setShopUseVirtual(String shopUseVirtual) {
		this.shopUseVirtual = shopUseVirtual;
	}
	@Override
	public String toString() {
		return "ShopVO [shopId=" + shopId + ", userId=" + userId + ", shopName=" + shopName + ", shopUseVirtual="
				+ shopUseVirtual + "]";
	}
	
}
