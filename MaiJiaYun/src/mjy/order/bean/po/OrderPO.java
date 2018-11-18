package mjy.order.bean.po;

public class OrderPO {
	// 常用搜索部分
	private Integer userId;//bossID
	private Integer pageSize;//页面显示的数据行数
	private Integer beginRow;//页面开始的行数
	
	private Integer orderState;//订单状态，待审核为1，已审单为2,已发货为3
	private Integer shopId; // 店铺(店铺id)
	private Integer logisticId; // logisticId 物流公司(物流id)
	private Integer orderPayWay;// orderPayWay 付款方式
	private String orderCode;// 订单号
	
	//这部分是关于buyer表的，通过这些条件可以查询出用户的id,然后查询出该用户的所有订单
	private BuyerPO buyerPO;
	/*
	 * 这些信息都一起分装在buyerPo里
	 * private String nickName;// 昵称
	private String buyerName;// 收货人 (买家姓名)
	private String buyerPhone;// 手机号
	private String buyerTel;// 电话
	private String buyerLocation;// 地址(详细地址)模糊查询
*/
	// 商品查询
	/**
	 * 当isInclude为ture时为仅包含，这时，下面的四个查询条件为and查询，即交集合
	 * 当isInclude为false时为包含，这事，下面的四个查询条件为Or查询，即并集合
	 */
//	private boolean isInclude;// 包含、仅包含
	
	private DetailGoodPO detailGoodPO;
	/*
	 * 将这三个条件分装到GoodsPO对象里
	 * private Integer goodId;// 商品货号(商品id)
	private String skuCode;// sku编码
	private String goodName;// 商品名称
*/	
	//关于商品数量这一条，在detail表里，
//	private Integer detailGoodNum;// 商品数量

	
	// 备注查询
	private Integer buyerRemark;// 买家备注
	/**
	 * 当买家备注为0时，查询条件为空，（由于静态页面制作的时候没有看到该内容，所有这里就不对关键字查询了 ）
	 * 当买家备注为1时，查询条件为有买家备注，即查询有买家备注的订单，（其中还有关键字查询）
	 * 当关键字查询为空时，查询的是所有有备注的订单，当关键字查询不为空时，还有这个模糊查询
	 * 当买家备注为2时，查询条件为无买家备注，即查询没有买家备注的订单
	 */
	// private String keyword;//当buyerRemark为1时，才有该字段，

	private Integer sellerRemark;// 卖家备注，同上

	// 更多查询，即时间段查询
	private String orderTimeFrom;// 下单时间上
	private String orderTimeTo;// 下单时间下

	private String orderExaTimeFrom; // 审单时间上

	private String orderExaTimeTo; // 审单时间下

	private String orderSendTimeFrom; // 发货时间上
	private String orderSendTimeTo; // 发货时间下
	public Integer getLogisticId() {
		return logisticId;
	}
	public Integer getOrderPayWay() {
		return orderPayWay;
	}
	public BuyerPO getBuyerPO() {
		return buyerPO;
	}
	public Integer getBuyerRemark() {
		return buyerRemark;
	}
	public Integer getSellerRemark() {
		return sellerRemark;
	}
	public String getOrderTimeFrom() {
		return orderTimeFrom;
	}
	public String getOrderTimeTo() {
		return orderTimeTo;
	}
	public String getOrderExaTimeFrom() {
		return orderExaTimeFrom;
	}
	public String getOrderExaTimeTo() {
		return orderExaTimeTo;
	}
	public String getOrderSendTimeFrom() {
		return orderSendTimeFrom;
	}
	public String getOrderSendTimeTo() {
		return orderSendTimeTo;
	}
	public void setLogisticId(Integer logisticId) {
		this.logisticId = logisticId;
	}
	public void setOrderPayWay(Integer orderPayWay) {
		this.orderPayWay = orderPayWay;
	}
	public void setBuyerPO(BuyerPO buyerPO) {
		this.buyerPO = buyerPO;
	}
	public DetailGoodPO getDetailGoodPO() {
		return detailGoodPO;
	}
	public void setDetailGoodPO(DetailGoodPO detailGoodPO) {
		this.detailGoodPO = detailGoodPO;
	}
	
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public void setBuyerRemark(Integer buyerRemark) {
		this.buyerRemark = buyerRemark;
	}
	public void setSellerRemark(Integer sellerRemark) {
		this.sellerRemark = sellerRemark;
	}
	public void setOrderTimeFrom(String orderTimeFrom) {
		this.orderTimeFrom = orderTimeFrom;
	}
	public void setOrderTimeTo(String orderTimeTo) {
		this.orderTimeTo = orderTimeTo;
	}
	public void setOrderExaTimeFrom(String orderExaTimeFrom) {
		this.orderExaTimeFrom = orderExaTimeFrom;
	}
	public void setOrderExaTimeTo(String orderExaTimeTo) {
		this.orderExaTimeTo = orderExaTimeTo;
	}
	public void setOrderSendTimeFrom(String orderSendTimeFrom) {
		this.orderSendTimeFrom = orderSendTimeFrom;
	}
	public void setOrderSendTimeTo(String orderSendTimeTo) {
		this.orderSendTimeTo = orderSendTimeTo;
	}
	public Integer getShopId() {
		return shopId;
	}
	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public Integer getOrderState() {
		return orderState;
	}
	public void setOrderState(Integer orderState) {
		this.orderState = orderState;
	}
	public Integer getBeginRow() {
		return beginRow;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public void setBeginRow(Integer beginRow) {
		this.beginRow = beginRow;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	

}
