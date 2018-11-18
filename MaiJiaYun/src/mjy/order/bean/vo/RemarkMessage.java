package mjy.order.bean.vo;
/**
 * 备注信息
 * @author student
 *
 */
public class RemarkMessage {
	/*买家备注*/
	private String orderBuyerRemark;
	/*卖家备注*/
	private String orderSellerRemark;
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
}
