package mjy.order.bean.vo;
/**
 * Detailϸ�ڱ�
 * @author student
 *
 */

public class Detail {
	private Integer detailId;//��ϸid
	private Integer orderId;//����id
	private Integer goodId;//��Ʒid
	private Integer wareHouserId;//�ֿ�id
	private Integer detailGoodNum;//��Ʒ����
	private double goodPrice;//��Ʒ�۸�
	private double detailGoodPrivilege;//��Ʒ�Ż�
	private float detailGoodDiscount;//��Ʒ�ۿ�
	private double detailSellPrice;//���ۼ۸�
	private double detailTotal;//������Ʒ�ĺϼ�
	
	//ϸ�ڱ�get��set ���� 
	public Integer getDetailId() {
		return detailId;
	}
	public void setDetailId(Integer detailId) {
		this.detailId = detailId;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public Integer getGoodId() {
		return goodId;
	}
	public void setGoodId(Integer goodId) {
		this.goodId = goodId;
	}
	public Integer getDetailGoodNum() {
		return detailGoodNum;
	}
	public void setDetailGoodNum(Integer detailGoodNum) {
		this.detailGoodNum = detailGoodNum;
	}
	public double getGoodPrice() {
		return goodPrice;
	}
	public void setGoodPrice(double goodPrice) {
		this.goodPrice = goodPrice;
	}
	public double getDetailGoodPrivilege() {
		return detailGoodPrivilege;
	}
	public void setDetailGoodPrivilege(double detailGoodPrivilege) {
		this.detailGoodPrivilege = detailGoodPrivilege;
	}
	public float getDetailGoodDiscount() {
		return detailGoodDiscount;
	}
	public void setDetailGoodDiscount(float detailGoodDiscount) {
		this.detailGoodDiscount = detailGoodDiscount;
	}
	public double getDetailSellPrice() {
		return detailSellPrice;
	}
	public void setDetailSellPrice(double detailSellPrice) {
		this.detailSellPrice = detailSellPrice;
	}
	public double getDetailTotal() {
		return detailTotal;
	}
	public void setDetailTotal(double detailTotal) {
		this.detailTotal = detailTotal;
	}
	public Integer getWareHouserId() {
		return wareHouserId;
	}
	public void setWareHouserId(Integer wareHouserId) {
		this.wareHouserId = wareHouserId;
	}
	
	
}
