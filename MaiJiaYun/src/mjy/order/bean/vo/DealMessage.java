package mjy.order.bean.vo;
/**
 * ������Ϣ
 * @author student
 *
 */
public class DealMessage {
	/*���ʽ*/
	private Integer orderPayWay;
	/*��������*/
	private Integer orderPayTpye;
	/*����ʱ��*/
	private String orderPayTime;
	/*�����˺�*/
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
