package mjy.order.bean.vo;
/**
 * ���ʵ��
 * @author student
 *
 */
public class Buyer {
	private Integer buyerId;//���ID
	private String buyerName;//�������
	private Integer userId;//�ͻ�ID
	private String alipayId;//���֧����ID
	private String buyerTel;//���Tel
	private String buyerPhone;//����ֻ���
	private String buyerPostcode;//����ʱ�
	private String buyerProvince;//���ʡ��
	private String buyerCity;//��ҳ���
	private String buyerDistrict;//�����
	private String buyerLocation;//�����ϸ��ַ
	private String buyerAddress;//��ҵ��ܵ�ַ��Ϣ
	
	
	public String getBuyerAddress() {
		return buyerAddress;
	}
	public void setBuyerAddress(String buyerAddress) {
		this.buyerAddress = buyerAddress;
	}
	//���������Ե�get��set����
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
