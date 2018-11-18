package mjy.order.bean.po;

/**
 * 用于高级搜索中的备注查询
 * @author student
 *@date 创建时间：2016年12月1日  *
 */
public class RemarkPo {
	
	private String orderBuyerRemark; //买家备注
	private String orderSellerRemark; //orderSellerRemark 卖家备注
	
	public RemarkPo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public RemarkPo(String orderBuyerRemark, String orderSellerRemark) {
		this.orderBuyerRemark = orderBuyerRemark;
		this.orderSellerRemark = orderSellerRemark;
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


	@Override
	public String toString() {
		return "RemarkPo [orderBuyerRemark=" + orderBuyerRemark + ", orderSellerRemark=" + orderSellerRemark + "]";
	}
	
}
