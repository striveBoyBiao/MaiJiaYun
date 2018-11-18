package mjy.order.bean.vo;
/**
 * 商品信息
 * @author student
 *
 */
public class DetailGood {
	//这部分表从商品表获取
	private String orderCode;//订单号
	private Integer goodId;//货号
	private String goodPicture;/*商品图*/
	
	private String sku;/*sku编码*/

	private String goodName;/*商品名称*/
	
	private double goodPrice;/*零售价*/
	
	
	/*这部分表从明细表中获取*/
	
	/*数量*/
	private Integer detailGoodNum;
	/*优惠*/
	private double detailGoodPrivilege;
	
	/*应付*/
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
