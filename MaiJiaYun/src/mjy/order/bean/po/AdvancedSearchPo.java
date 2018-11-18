package mjy.order.bean.po;

/**
 * �߼�����
 * @author student
 *@date ����ʱ�䣺2016��11��30��  *
 */
public class AdvancedSearchPo {
	
	private Integer storeId; //����(����id)
	private Integer logisticId; //logisticId ������˾(����id)
	private Integer  orderPayWay;//orderPayWay ���ʽ
	private String orderNum;//������
	private String nickName;//�ǳ�
	private String buyerName;//�ջ��� (�������)
	private String buyerPhone;//�ֻ���
	private String buyerTel;//�绰
	private String buyerLocation;//��ַ(��ϸ��ַ)
	
	private Integer goodId;//��Ʒ����(��Ʒid)
	
	//���������Լ�����
	private boolean isInclude;//������������
	private String skuCode;//sku����
	private String goodName;//��Ʒ����
	
	private Integer detailGoodNum;//��Ʒ����
	private String orderBuyerRemark; //��ұ�ע
	private String orderSellerRemark; //orderSellerRemark ���ұ�ע
	private String orderTime;//orderTime  �µ�ʱ��
	private String orderExaTime; //orderExaTime ��ʱ��
	private String orderSendTime; //orderSendTime ����ʱ��

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
