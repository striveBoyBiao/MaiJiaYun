package mjy.order.bean.vo;
/**
 * ������ʵ����
 * @author student
 *
 */
public class Logistic {
	private Integer logisticId;
	private String logisticName;
	
	//�������Ե�get��set����
	public Integer getLogisticId() {
		return logisticId;
	}
	public void setLogisticId(Integer logisticId) {
		this.logisticId = logisticId;
	}
	public String getLogisticName() {
		return logisticName;
	}
	public void setLogisticName(String logisticName) {
		this.logisticName = logisticName;
	}
	@Override
	public String toString() {
		return "Logistic [logisticId=" + logisticId + ", logisticName=" + logisticName + "]";
	}
	
	
}
