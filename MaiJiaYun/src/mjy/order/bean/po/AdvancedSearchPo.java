package mjy.order.bean.po;

/**
 * 高级搜索
 * @author student
 *@date 创建时间：2016年11月30日  *
 */
public class AdvancedSearchPo {
	
	private Integer storeId; //店铺(店铺id)
	private Integer logisticId; //logisticId 物流公司(物流id)
	private Integer  orderPayWay;//orderPayWay 付款方式
	private String orderNum;//订单号
	private String nickName;//昵称
	private String buyerName;//收货人 (买家姓名)
	private String buyerPhone;//手机号
	private String buyerTel;//电话
	private String buyerLocation;//地址(详细地址)
	
	private Integer goodId;//商品货号(商品id)
	
	//下面三个自己定义
	private boolean isInclude;//包含、仅包含
	private String skuCode;//sku编码
	private String goodName;//商品名称
	
	private Integer detailGoodNum;//商品数量
	private String orderBuyerRemark; //买家备注
	private String orderSellerRemark; //orderSellerRemark 卖家备注
	private String orderTime;//orderTime  下单时间
	private String orderExaTime; //orderExaTime 审单时间
	private String orderSendTime; //orderSendTime 发货时间

	public AdvancedSearchPo() {
	}
	public Integer getStoreId() {
		return storeId;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}
	public Integer getLogisticId() {
		return logisticId;
	}
	public void setLogisticId(Integer logisticId) {
		this.logisticId = logisticId;
	}
	public Integer getOrderPayWay() {
		return orderPayWay;
	}
	public void setOrderPayWay(Integer orderPayWay) {
		this.orderPayWay = orderPayWay;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public String getBuyerName() {
		return buyerName;
	}
	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}
	public String getBuyerPhone() {
		return buyerPhone;
	}
	public void setBuyerPhone(String buyerPhone) {
		this.buyerPhone = buyerPhone;
	}
	public String getBuyerTel() {
		return buyerTel;
	}
	public void setBuyerTel(String buyerTel) {
		this.buyerTel = buyerTel;
	}
	public String getBuyerLocation() {
		return buyerLocation;
	}
	public void setBuyerLocation(String buyerLocation) {
		this.buyerLocation = buyerLocation;
	}
	public Integer getGoodId() {
		return goodId;
	}
	public void setGoodId(Integer goodId) {
		this.goodId = goodId;
	}
	public boolean isInclude() {
		return isInclude;
	}
	public void setInclude(boolean isInclude) {
		this.isInclude = isInclude;
	}
	public String getSkuCode() {
		return skuCode;
	}
	public void setSkuCode(String skuCode) {
		this.skuCode = skuCode;
	}
	public String getGoodName() {
		return goodName;
	}
	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}
	public Integer getDetailGoodNum() {
		return detailGoodNum;
	}
	public void setDetailGoodNum(Integer detailGoodNum) {
		this.detailGoodNum = detailGoodNum;
	}
	public String getOrderBuyerRemark() {
		return orderBuyerRemark;
	}
	public void setOrderBuyerRemark(String orderBuyerRemark) {
		this.orderBuyerRemark = orderBuyerRemark;
	}
	public String getOrderSellerRemark() {
		return orderSellerRemark;
	}
	public void setOrderSellerRemark(String orderSellerRemark) {
		this.orderSellerRemark = orderSellerRemark;
	}
	public String getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}
	public String getOrderExaTime() {
		return orderExaTime;
	}
	public void setOrderExaTime(String orderExaTime) {
		this.orderExaTime = orderExaTime;
	}
	public String getOrderSendTime() {
		return orderSendTime;
	}
	public void setOrderSendTime(String orderSendTime) {
		this.orderSendTime = orderSendTime;
	}
	
	
	
}
