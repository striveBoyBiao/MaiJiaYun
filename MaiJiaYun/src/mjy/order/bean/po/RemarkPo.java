package mjy.order.bean.po;

/**
 * ���ڸ߼������еı�ע��ѯ
 * @author student
 *@date ����ʱ�䣺2016��12��1��  *
 */
public class RemarkPo {
	
	private String orderBuyerRemark; //��ұ�ע
	private String orderSellerRemark; //orderSellerRemark ���ұ�ע
	
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
