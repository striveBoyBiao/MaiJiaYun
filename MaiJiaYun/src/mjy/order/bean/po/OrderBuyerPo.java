package mjy.order.bean.po;

/**
 * 对应数据库中的 order_buyer
 * @author student
 *@date 创建时间：2016年11月30日  *
 */
public class OrderBuyerPo {
	
	private Integer buyerId;//买家id
	private String buyerName;//买家姓名
	private Integer userId;//
	private String alipayId;//alipayId支付宝账号
	private String buyerTel;//电话号码buyerTel
	private String buyerPhone;//机号手buyerPhone
	private String buyerPostcode;//邮编
	private String buyerProvince;//省份
	private String buyerCity;//市
	private String buyerDistrict;//区
	private String buyerLocation;//详细地址
	
	
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
	public String getBuyerDistrict() {
		return buyerDistrict;
	}
	public void setBuyerDistrict(String buyerDistrict) {
		this.buyerDistrict = buyerDistrict;
	}
	public String getBuyerLocation() {
		return buyerLocation;
	}
	public void setBuyerLocation(String buyerLocation) {
		this.buyerLocation = buyerLocation;
	}
	
}
