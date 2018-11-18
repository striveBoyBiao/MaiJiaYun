package mjy.order.bean.vo;
/**
 * 交易信息
 * @author student
 *
 */
public class DealMessage {
	/*付款方式*/
	private Integer orderPayWay;
	/*付款类型*/
	private Integer orderPayTpye;
	/*付款时间*/
	private String orderPayTime;
	/*付款账号*/
	private String alipayId;
	
	public Integer getOrderPayWay() {
		return orderPayWay;
	}
	public void setOrderPayWay(Integer orderPayWay) {
		this.orderPayWay = orderPayWay;
	}
	public String getOrderPayTime() {
		return orderPayTime;
	}
	public void setOrderPayTime(String orderPayTime) {
		this.orderPayTime = orderPayTime;
	}
	public String getAlipayId() {
		return alipayId;
	}
	public void setAlipayId(String alipayId) {
		this.alipayId = alipayId;
	}
	public Integer getOrderPayTpye() {
		return orderPayTpye;
	}
	public void setOrderPayTpye(Integer orderPayTpye) {
		this.orderPayTpye = orderPayTpye;
	}
	
	
}
