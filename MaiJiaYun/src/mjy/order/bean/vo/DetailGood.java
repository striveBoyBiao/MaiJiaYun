package mjy.order.bean.vo;
/**
 * ��Ʒ��Ϣ
 * @author student
 *
 */
public class DetailGood {
	//�ⲿ�ֱ����Ʒ���ȡ
	private String orderCode;//������
	private Integer goodId;//����
	private String goodPicture;/*��Ʒͼ*/
	
	private String sku;/*sku����*/

	private String goodName;/*��Ʒ����*/
	
	private double goodPrice;/*���ۼ�*/
	
	
	/*�ⲿ�ֱ����ϸ���л�ȡ*/
	
	/*����*/
	private Integer detailGoodNum;
	/*�Ż�*/
	private double detailGoodPrivilege;
	
	/*Ӧ��*/
	private double detailTotal;
	
	private double goodWeight;
	public double getGoodWeight() {
		return goodWeight;
	}
	public void setGoodWeight(double goodWeight) {
		this.goodWeight = goodWeight;
	}
	public String getGoodPicture() {
		return goodPicture;
	}
	public void setGoodPicture(String goodPicture) {
		this.goodPicture = goodPicture;
	}
	public String getSku() {
		return sku;
	}
	public void setSku(String sku) {
		this.sku = sku;
	}
	public String getGoodName() {
		return goodName;
	}
	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}
	public double getGoodPrice() {
		return goodPrice;
	}
	public void setGoodPrice(double goodPrice) {
		this.goodPrice = goodPrice;
	}
	public Integer getDetailGoodNum() {
		return detailGoodNum;
	}
	public void setDetailGoodNum(Integer detailGoodNum) {
		this.detailGoodNum = detailGoodNum;
	}
	public double getDetailGoodPrivilege() {
		return detailGoodPrivilege;
	}
	public void setDetailGoodPrivilege(double detailGoodPrivilege) {
		this.detailGoodPrivilege = detailGoodPrivilege;
	}
	public double getDetailTotal() {
		return detailTotal;
	}
	public void setDetailTotal(double detailTotal) {
		this.detailTotal = detailTotal;
	}
	public Integer getGoodId() {
		return goodId;
	}
	public void setGoodId(Integer goodId) {
		this.goodId = goodId;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	@Override
	public String toString() {
		return "DetailGood [orderCode=" + orderCode + ", goodId=" + goodId + ", goodPicture=" + goodPicture + ", sku="
				+ sku + ", goodName=" + goodName + ", goodPrice=" + goodPrice + ", detailGoodNum=" + detailGoodNum
				+ ", detailGoodPrivilege=" + detailGoodPrivilege + ", detailTotal=" + detailTotal + ", goodWeight="
				+ goodWeight + "]";
	}
}
