package mjy.order.bean.vo;

/**
 * ������
 * @author student
 *
 */
public class Order {
	
	private Integer orderId;
	private Integer buyerId;
	private Integer logisticId;
	private Integer shopId;
	private Integer userId;
	private String orderCode;//������
	private Integer orderRemind;//����
	
	private String orderBuyerRemark;//��ұ�ע
	private String orderSellerRemark;//���ұ�ע
	private Integer orderPayWay;//���ʽ
	private Integer orderPayTpye;//��������
	private double orderPayMent;//ʵ����
	private double orderFreight;//�˷�
	
	private String orderTime;
	private String orderPayTime;
	private String orderExaTime;//��ʱ��
	private String orderSendTime;//����ʱ��
	
	private String orderWaybill;//�˵���
	
	private String orderExpressCode;//��ݵ���
	private String orderSendCode;//��������
	
	private Integer orderState;//����״̬
	private double orderTotal;//���������ܺϼ�
	
	private Integer orderGoodNum;//�����������Ʒ����
	private double orderWeight;//����������
	private double orderFee;//�������Ż�
	private double orderFavorable;//��Ʒ���Ż�

	public double getOrderFavorable() {
		return orderFavorable;
	}
	public void setOrderFavorable(double orderFavorable) {
		this.orderFavorable = orderFavorable;
	}
	public double getOrderWeight() {
		return orderWeight;
	}
	public double getOrderFee() {
		return orderFee;
	}
	public void setOrderFee(double orderFee) {
		this.orderFee = orderFee;
	}
	public void setOrderWeight(double orderWeight) {
		this.orderWeight = orderWeight;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public Integer getBuyerId() {
		return buyerId;
	}
	public Integer getLogisticId() {
		return logisticId;
	}
	public Integer getShopId() {
		return shopId;
	}
	public Integer getUserId() {
		return userId;
	}
	public Integer getOrderRemind() {
		return orderRemind;
	}
	public String getOrderBuyerRemark() {
		return orderBuyerRemark;
	}
	public String getOrderSellerRemark() {
		return orderSellerRemark;
	}
	public Integer getOrderPayWay() {
		return orderPayWay;
	}
	public double getOrderPayMent() {
		return orderPayMent;
	}
	public double getOrderFreight() {
		return orderFreight;
	}
	public String getOrderTime() {
		return orderTime;
	}
	public String getOrderPayTime() {
		return orderPayTime;
	}
	public String getOrderExaTime() {
		return orderExaTime;
	}
	public String getOrderSendTime() {
		return orderSendTime;
	}
	public String getOrderWaybill() {
		return orderWaybill;
	}
	public String getOrderSendCode() {
		return orderSendCode;
	}
	public Integer getOrderState() {
		return orderState;
	}
	public double getOrderTotal() {
		return orderTotal;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public void setBuyerId(Integer buyerId) {
		this.buyerId = buyerId;
	}
	public void setLogisticId(Integer logisticId) {
		this.logisticId = logisticId;
	}
	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public void setOrderRemind(Integer orderRemind) {
		this.orderRemind = orderRemind;
	}
	public void setOrderBuyerRemark(String orderBuyerRemark) {
		this.orderBuyerRemark = orderBuyerRemark;
	}
	public void setOrderSellerRemark(String orderSellerRemark) {
		this.orderSellerRemark = orderSellerRemark;
	}
	public void setOrderPayWay(Integer orderPayWay) {
		this.orderPayWay = orderPayWay;
	}
	public void setOrderPayMent(double orderPayMent) {
		this.orderPayMent = orderPayMent;
	}
	public void setOrderFreight(double orderFreight) {
		this.orderFreight = orderFreight;
	}
	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}
	public void setOrderPayTime(String orderPayTime) {
		this.orderPayTime = orderPayTime;
	}
	public void setOrderExaTime(String orderExaTime) {
		this.orderExaTime = orderExaTime;
	}
	public void setOrderSendTime(String orderSendTime) {
		this.orderSendTime = orderSendTime;
	}
	public void setOrderWaybill(String orderWaybill) {
		this.orderWaybill = orderWaybill;
	}
	public void setOrderSendCode(String orderSendCode) {
		this.orderSendCode = orderSendCode;
	}
	public void setOrderState(Integer orderState) {
		this.orderState = orderState;
	}
	public void setOrderTotal(double orderTotal) {
		this.orderTotal = orderTotal;
	}
	public Integer getOrderPayTpye() {
		return orderPayTpye;
	}
	public void setOrderPayTpye(Integer orderPayTpye) {
		this.orderPayTpye = orderPayTpye;
	}
	public String getOrderExpressCode() {
		return orderExpressCode;
	}
	public Integer getOrderGoodNum() {
		return orderGoodNum;
	}
	public void setOrderExpressCode(String orderExpressCode) {
		this.orderExpressCode = orderExpressCode;
	}
	public void setOrderGoodNum(Integer orderGoodNum) {
		this.orderGoodNum = orderGoodNum;
	}
	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", buyerId=" + buyerId + ", logisticId=" + logisticId + ", shopId="
				+ shopId + ", userId=" + userId + ", orderCode=" + orderCode + ", orderRemind=" + orderRemind
				+ ", orderBuyerRemark=" + orderBuyerRemark + ", orderSellerRemark=" + orderSellerRemark
				+ ", orderPayWay=" + orderPayWay + ", orderPayTpye=" + orderPayTpye + ", orderPayMent=" + orderPayMent
				+ ", orderFreight=" + orderFreight + ", orderTime=" + orderTime + ", orderPayTime=" + orderPayTime
				+ ", orderExaTime=" + orderExaTime + ", orderSendTime=" + orderSendTime + ", orderWaybill="
				+ orderWaybill + ", orderExpressCode=" + orderExpressCode + ", orderSendCode=" + orderSendCode
				+ ", orderState=" + orderState + ", orderTotal=" + orderTotal + ", orderGoodNum=" + orderGoodNum
				+ ", orderWeight=" + orderWeight + "]";
	}
	
}
