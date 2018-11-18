package mjy.order.bean.po;
/**
 * 物流表实体类
 * @author student
 *
 */
public class LogisticPO {
	private Integer logisticId;
	private String logisticName;
	
	//物流属性的get和set方法
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
}
