package mjy.order.bean.po;

public class DetailGoodPO {
	private String orderCode;//ͨ�������Ų�ѯ��ϸ����Ʒ
	private Integer goodId;//��Ʒ����
	private String sku;//sku
	private String goodName;//��Ʒ����
	private Integer detailGoodNum;//ͨ����Ʒ������ѯ
	public Integer getDetailGoodNum() {
		return detailGoodNum;
	}
	public void setDetailGoodNum(Integer detailGoodNum) {
		this.detailGoodNum = detailGoodNum;
	}
	public Integer getGoodId() {
		return goodId;
	}
	public String getSku() {
		return sku;
	}
	public String getGoodName() {
		return goodName;
	}
	public void setGoodId(Integer goodId) {
		this.goodId = goodId;
	}
	public void setSku(String sku) {
		this.sku = sku;
	}
	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}
	
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	@Override
	public String toString() {
		return "DetailGoodPO [orderCode=" + orderCode + ", goodId=" + goodId + ", sku=" + sku + ", goodName=" + goodName
				+ ", detailGoodNum=" + detailGoodNum + "]";
	}
	
}

