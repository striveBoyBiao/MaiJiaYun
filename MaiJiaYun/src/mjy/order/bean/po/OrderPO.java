package mjy.order.bean.po;

public class OrderPO {
	// ������������
	private Integer userId;//bossID
	private Integer pageSize;//ҳ����ʾ����������
	private Integer beginRow;//ҳ�濪ʼ������
	
	private Integer orderState;//����״̬�������Ϊ1������Ϊ2,�ѷ���Ϊ3
	private Integer shopId; // ����(����id)
	private Integer logisticId; // logisticId ������˾(����id)
	private Integer orderPayWay;// orderPayWay ���ʽ
	private String orderCode;// ������
	
	//�ⲿ���ǹ���buyer��ģ�ͨ����Щ�������Բ�ѯ���û���id,Ȼ���ѯ�����û������ж���
	private BuyerPO buyerPO;
	/*
	 * ��Щ��Ϣ��һ���װ��buyerPo��
	 * private String nickName;// �ǳ�
	private String buyerName;// �ջ��� (�������)
	private String buyerPhone;// �ֻ���
	private String buyerTel;// �绰
	private String buyerLocation;// ��ַ(��ϸ��ַ)ģ����ѯ
*/
	// ��Ʒ��ѯ
	/**
	 * ��isIncludeΪtureʱΪ����������ʱ��������ĸ���ѯ����Ϊand��ѯ����������
	 * ��isIncludeΪfalseʱΪ���������£�������ĸ���ѯ����ΪOr��ѯ����������
	 */
//	private boolean isInclude;// ������������
	
	private DetailGoodPO detailGoodPO;
	/*
	 * ��������������װ��GoodsPO������
	 * private Integer goodId;// ��Ʒ����(��Ʒid)
	private String skuCode;// sku����
	private String goodName;// ��Ʒ����
*/	
	//������Ʒ������һ������detail���
//	private Integer detailGoodNum;// ��Ʒ����

	
	// ��ע��ѯ
	private Integer buyerRemark;// ��ұ�ע
	/**
	 * ����ұ�עΪ0ʱ����ѯ����Ϊ�գ������ھ�̬ҳ��������ʱ��û�п��������ݣ���������Ͳ��Թؼ��ֲ�ѯ�� ��
	 * ����ұ�עΪ1ʱ����ѯ����Ϊ����ұ�ע������ѯ����ұ�ע�Ķ����������л��йؼ��ֲ�ѯ��
	 * ���ؼ��ֲ�ѯΪ��ʱ����ѯ���������б�ע�Ķ��������ؼ��ֲ�ѯ��Ϊ��ʱ���������ģ����ѯ
	 * ����ұ�עΪ2ʱ����ѯ����Ϊ����ұ�ע������ѯû����ұ�ע�Ķ���
	 */
	// private String keyword;//��buyerRemarkΪ1ʱ�����и��ֶΣ�

	private Integer sellerRemark;// ���ұ�ע��ͬ��

	// �����ѯ����ʱ��β�ѯ
	private String orderTimeFrom;// �µ�ʱ����
	private String orderTimeTo;// �µ�ʱ����

	private String orderExaTimeFrom; // ��ʱ����

	private String orderExaTimeTo; // ��ʱ����

	private String orderSendTimeFrom; // ����ʱ����
	private String orderSendTimeTo; // ����ʱ����
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
