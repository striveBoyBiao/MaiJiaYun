package mjy.caigou.vo;
/**
 * ��Ʒ��
 * @author student
 *
 */
public class ShopVO {
	private Integer shopId;//����id
	private Integer userId;//�û�id
	private String shopName;//��������
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
