package mjy.order.bean.vo;
/**
 * Detail细节表
 * @author student
 *
 */

public class Detail {
	private Integer detailId;//明细id
	private Integer orderId;//订单id
	private Integer goodId;//商品id
	private Integer wareHouserId;//仓库id
	private Integer detailGoodNum;//商品数量
	private double goodPrice;//商品价格
	private double detailGoodPrivilege;//商品优惠
	private float detailGoodDiscount;//商品折扣
	private double detailSellPrice;//销售价格
	private double detailTotal;//单独商品的合计
	
	//细节表get和set 方法 
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
