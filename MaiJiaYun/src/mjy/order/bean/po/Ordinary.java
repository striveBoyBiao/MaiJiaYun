package mjy.order.bean.po;
/**
 * ���ڸ߼������еĳ��ò�ѯ
 * @author student
 *@date ����ʱ�䣺2016��12��1��  *
 */
public class Ordinary {

	private Integer storeId; //����(����id)
	private Integer logisticId; //logisticId ������˾(����id)
	private Integer  orderPayWay;//orderPayWay ���ʽ
	private String orderNum;//������
	private String nickName;//�ǳ�
	private String buyerName;//�ջ��� (�������)
	private String  buyerPhone;//�ֻ���
	private String buyerTel;//�绰
	private String buyerLocation;//��ַ(��ϸ��ַ)
	
	public Integer getStoreId() {
		return storeId;
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
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
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
	
}
