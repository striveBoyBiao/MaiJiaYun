package mjy.caigou.vo;

public class SupplierVO {
	// 供应商Id
	private Integer supplierId;
	// 公司名称（供应商名称）
	private String supplierCName;
	// 公司地址
	private String supplierCAddress;
	// 法人
	private String supplierLPerson;
	// 法人电话
	private String supplierLPhone;
	// 联系人名称
	private String supplierLMName;
	// 联系人电话
	private String supplierLMMobile;
	// 联系人邮箱
	private String supplierLMEmail;
	// 联系人qq
	private String supplierLMQq;
	// 删除状态
	private Integer supplierBoolean;
	// 用户Id
	private Integer userId;

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getSupplierBoolean() {
		return supplierBoolean;
	}

	public void setSupplierBoolean(Integer supplierBoolean) {
		this.supplierBoolean = supplierBoolean;
	}

	public Integer getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(Integer supplierId) {
		this.supplierId = supplierId;
	}

	public String getSupplierCName() {
		return supplierCName;
	}

	public void setSupplierCName(String supplierCName) {
		this.supplierCName = supplierCName;
	}

	public String getSupplierCAddress() {
		return supplierCAddress;
	}

	public void setSupplierCAddress(String supplierCAddress) {
		this.supplierCAddress = supplierCAddress;
	}

	public String getSupplierLPerson() {
		return supplierLPerson;
	}

	public void setSupplierLPerson(String supplierLPerson) {
		this.supplierLPerson = supplierLPerson;
	}

	public String getSupplierLPhone() {
		return supplierLPhone;
	}

	public void setSupplierLPhone(String supplierLPhone) {
		this.supplierLPhone = supplierLPhone;
	}

	public String getSupplierLMName() {
		return supplierLMName;
	}

	public void setSupplierLMName(String supplierLMName) {
		this.supplierLMName = supplierLMName;
	}

	public String getSupplierLMMobile() {
		return supplierLMMobile;
	}

	public void setSupplierLMMobile(String supplierLMMobile) {
		this.supplierLMMobile = supplierLMMobile;
	}

	public String getSupplierLMEmail() {
		return supplierLMEmail;
	}

	public void setSupplierLMEmail(String supplierLMEmail) {
		this.supplierLMEmail = supplierLMEmail;
	}

	public String getSupplierLMQq() {
		return supplierLMQq;
	}

	public void setSupplierLMQq(String supplierLMQq) {
		this.supplierLMQq = supplierLMQq;
	}

	@Override
	public String toString() {
		return "SupplierVO [supplierId=" + supplierId + ", supplierCName=" + supplierCName + ", supplierCAddress="
				+ supplierCAddress + ", supplierLPerson=" + supplierLPerson + ", supplierLPhone=" + supplierLPhone
				+ ", supplierLMName=" + supplierLMName + ", supplierLMMobile=" + supplierLMMobile + ", supplierLMEmail="
				+ supplierLMEmail + ", supplierLMQq=" + supplierLMQq + "]";
	}

}
