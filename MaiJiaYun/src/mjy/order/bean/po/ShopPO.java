package mjy.order.bean.po;

public class ShopPO {
	
	private Integer shopId;//ͨ��id��ѯ����
	private String shopName;//ͨ�����ֲ�ѯ����
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
