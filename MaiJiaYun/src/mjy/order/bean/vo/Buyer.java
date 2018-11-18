package mjy.order.bean.vo;
/**
 * 买家实体
 * @author student
 *
 */
public class Buyer {
	private Integer buyerId;//买家ID
	private String buyerName;//买家姓名
	private Integer userId;//客户ID
	private String alipayId;//买家支付宝ID
	private String buyerTel;//买家Tel
	private String buyerPhone;//买家手机号
	private String buyerPostcode;//买家邮编
	private String buyerProvince;//买家省份
	private String buyerCity;//买家城市
	private String buyerDistrict;//买家区
	private String buyerLocation;//买家详细地址
	private String buyerAddress;//买家的总地址信息
	
	
	public String getBuyerAddress() {
		return buyerAddress;
	}
	public void setBuyerAddress(String buyerAddress) {
		this.buyerAddress = buyerAddress;
	}
	//卖家类属性的get和set方法
	public Integer getBuyerId() {
		return buyerId;
	}
	public void setBuyerId(Integer buyerId) {
		this.buyerId = buyerId;
	}
	public String getBuyerName() {
		return buyerName;
	}
	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}
	public String getBuyerTel() {
		return buyerTel;
	}
	public void setBuyerTel(String buyerTel) {
		this.buyerTel = buyerTel;
	}
	public String getBuyerPhone() {
		return buyerPhone;
	}
	public void setBuyerPhone(String buyerPhone) {
		this.buyerPhone = buyerPhone;
	}
	public String getBuyerPostcode() {
		return buyerPostcode;
	}
	public void setBuyerPostcode(String buyerPostcode) {
		this.buyerPostcode = buyerPostcode;
	}
	public String getBuyerProvince() {
		return buyerProvince;
	}
	public void setBuyerProvince(String buyerProvince) {
		this.buyerProvince = buyerProvince;
	}
	public String getBuyerCity() {
		return buyerCity;
	}
	public void setBuyerCity(String buyerCity) {
		this.buyerCity = buyerCity;
	}
	public String getBuyerLocation() {
		return buyerLocation;
	}
	public void setBuyerLocation(String buyerLocation) {
		this.buyerLocation = buyerLocation;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getAlipayId() {
		return alipayId;
	}
	public void setAlipayId(String alipayId) {
		this.alipayId = alipayId;
	}
	public String getBuyerDistrict() {
		return buyerDistrict;
	}
	public void setBuyerDistrict(String buyerDistrict) {
		this.buyerDistrict = buyerDistrict;
	}
	@Override
	public String toString() {
		return "Buyer [buyerId=" + buyerId + ", buyerName=" + buyerName + ", userId=" + userId + ", alipayId="
				+ alipayId + ", buyerTel=" + buyerTel + ", buyerPhone=" + buyerPhone + ", buyerPostcode="
				+ buyerPostcode + ", buyerProvince=" + buyerProvince + ", buyerCity=" + buyerCity + ", buyerDistrict="
				+ buyerDistrict + ", buyerLocation=" + buyerLocation + ", buyerAddress=" + buyerAddress + "]";
	}
	
	
}
