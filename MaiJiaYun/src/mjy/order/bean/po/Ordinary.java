package mjy.order.bean.po;
/**
 * 用于高级搜索中的常用查询
 * @author student
 *@date 创建时间：2016年12月1日  *
 */
public class Ordinary {

	private Integer storeId; //店铺(店铺id)
	private Integer logisticId; //logisticId 物流公司(物流id)
	private Integer  orderPayWay;//orderPayWay 付款方式
	private String orderNum;//订单号
	private String nickName;//昵称
	private String buyerName;//收货人 (买家姓名)
	private String  buyerPhone;//手机号
	private String buyerTel;//电话
	private String buyerLocation;//地址(详细地址)
	
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
