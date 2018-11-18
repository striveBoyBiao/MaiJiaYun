package mjy.order.bean.vo;
/**
 * 客户信息
 * @author student
 *
 */
public class ClientMessage {
	/*用户id*/
	private Integer buyerId; 
	/*收货人*/
	private String buyerName;
	/*电话号*/
	private String buyerTel; 
	/*手机号*/
	private String buyerPhone;
	
	/*物流公司id*/
	private Integer logisticId;
	/*物流公司名称*/
	private String logisticName;
	
	/*仓库id*/
	private Integer wareHouserId;
	
	/*省份*/
	private String buyerProvince;
	private String provincesCode;
	/*市*/
	private String buyerCity;
	private String cityCode;
	/*区*/
	private String buyerDistrict;
	private String areaCode;
	/*详细地址*/
	private String buyerLocation;
	/*邮政编码*/
	private String buyerPostcode;
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
	public Integer getLogisticId() {
		return logisticId;
	}
	public void setLogisticId(Integer logisticId) {
		this.logisticId = logisticId;
	}
	public Integer getWareHouserId() {
		return wareHouserId;
	}
	public void setWareHouserId(Integer wareHouserId) {
		this.wareHouserId = wareHouserId;
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
	public String getBuyerPostcode() {
		return buyerPostcode;
	}
	public void setBuyerPostcode(String buyerPostcode) {
		this.buyerPostcode = buyerPostcode;
	}
	
	public String getLogisticName() {
		return logisticName;
	}
	public void setLogisticName(String logisticName) {
		this.logisticName = logisticName;
	}
	public String getProvincesCode() {
		return provincesCode;
	}
	public void setProvincesCode(String provincesCode) {
		this.provincesCode = provincesCode;
	}
	public String getCityCode() {
		return cityCode;
	}
	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}
	public String getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}
	@Override
	public String toString() {
		return "ClientMessage [buyerId=" + buyerId + ", buyerName=" + buyerName + ", buyerTel=" + buyerTel
				+ ", buyerPhone=" + buyerPhone + ", logisticId=" + logisticId + ", logisticName=" + logisticName
				+ ", wareHouserId=" + wareHouserId + ", buyerProvince=" + buyerProvince + ", provincesCode="
				+ provincesCode + ", buyerCity=" + buyerCity + ", cityCode=" + cityCode + ", buyerDistrict="
				+ buyerDistrict + ", areaCode=" + areaCode + ", buyerLocation=" + buyerLocation + ", buyerPostcode="
				+ buyerPostcode + "]";
	}
	
	
}
