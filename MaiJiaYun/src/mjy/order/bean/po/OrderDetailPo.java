package mjy.order.bean.po;

//对应数据库中的order_detail
public class OrderDetailPo {
	
	private Integer detailId;	//订单明细id
	private Integer orderId;//订单id
	private Integer goodId;//商品id
	private Integer wareId;// 仓库id
	private Integer detailGoodNum;// 商品数量
	private double goodPrice;// 商品单价
	private double  detailGoodPrivilege;// 商品优惠
	private float detailGoodDiscount;//折扣
	private double detailSellPrice;//销售价格
	private double detailTotal;//合计
	
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
	public Integer getWareId() {
		return wareId;
	}
	public void setWareId(Integer wareId) {
		this.wareId = wareId;
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
	
}
