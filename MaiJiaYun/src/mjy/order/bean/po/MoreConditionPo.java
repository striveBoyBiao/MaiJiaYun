package mjy.order.bean.po;

/**
 * 用于高级搜索中的更多条件查询
 * @author student
 *@date 创建时间：2016年12月1日  *
 */
public class MoreConditionPo {

	private String orderTimeFrm;//  下单时间上
	private String orderTimeTo;//  下单时间下
	
	private String orderExaTimeFrm; // 审单时间上
	private String orderExaTimeTo; // 审单时间下
	
	private String orderSendTimeFrm; //发货时间上
	private String orderSendTimeTo; //发货时间下
	
	public String getOrderTimeFrm() {
		return orderTimeFrm;
	}
	public void setOrderTimeFrm(String orderTimeFrm) {
		this.orderTimeFrm = orderTimeFrm;
	}
	public String getOrderTimeTo() {
		return orderTimeTo;
	}
	public void setOrderTimeTo(String orderTimeTo) {
		this.orderTimeTo = orderTimeTo;
	}
	public String getOrderExaTimeFrm() {
		return orderExaTimeFrm;
	}
	public void setOrderExaTimeFrm(String orderExaTimeFrm) {
		this.orderExaTimeFrm = orderExaTimeFrm;
	}
	public String getOrderExaTimeTo() {
		return orderExaTimeTo;
	}
	public void setOrderExaTimeTo(String orderExaTimeTo) {
		this.orderExaTimeTo = orderExaTimeTo;
	}
	public String getOrderSendTimeFrm() {
		return orderSendTimeFrm;
	}
	public void setOrderSendTimeFrm(String orderSendTimeFrm) {
		this.orderSendTimeFrm = orderSendTimeFrm;
	}
	public String getOrderSendTimeTo() {
		return orderSendTimeTo;
	}
	public void setOrderSendTimeTo(String orderSendTimeTo) {
		this.orderSendTimeTo = orderSendTimeTo;
	}
}
