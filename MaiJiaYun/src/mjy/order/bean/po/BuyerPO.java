package mjy.order.bean.po;

public class BuyerPO {
	private String buyerName;
	private String buyerTel;
	private String buyerPhone;
	private String buyerAddress;
	private Integer buyerId;
	public Integer getBuyerId() {
		return buyerId;
	}
	public void setBuyerId(Integer buyerId) {
		this.buyerId = buyerId;
	}
	public String getBuyerName() {
		return buyerName;
	}
	public String getBuyerTel() {
		return buyerTel;
	}
	public String getBuyerPhone() {
		return buyerPhone;
	}
	public String getBuyerAddress() {
		return buyerAddress;
	}
	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}
	public void setBuyerTel(String buyerTel) {
		this.buyerTel = buyerTel;
	}
	public void setBuyerPhone(String buyerPhone) {
		this.buyerPhone = buyerPhone;
	}
	public void setBuyerAddress(String buyerAddress) {
		this.buyerAddress = buyerAddress;
	}
	@Override
	public String toString() {
		return "BuyerPO [buyerName=" + buyerName + ", buyerTel=" + buyerTel + ", buyerPhone=" + buyerPhone
				+ ", buyerAddress=" + buyerAddress + ", buyerId=" + buyerId + "]";
	}
	
}	
