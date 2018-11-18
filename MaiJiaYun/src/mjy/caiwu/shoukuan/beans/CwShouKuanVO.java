package mjy.caiwu.shoukuan.beans;

import java.util.Date;

/**
 * 财务收款
 */
public class CwShouKuanVO {
	// 收款id 自增
	private Integer skId;

	// 付款人姓名
	private String skPayerName;

	// 付款人昵称
	private String skPayerNickname;

	// 相关单据号
	private String skReceiptsCode;

	// 应付款
	private Double skPayables;

	// 应收款
	private Double skReceivable;

	// 创建人
	private String skCreator;
	//创建人Id
	private String skCreatorId;
	

	// 创建时间
	private String skCreateDate;
	// 操作人
	private String skOperator;
	// 操作人id
	private String skOperatorId;
	// 操作时间
	private String skOperationDate;
	// 备注
	private String skBeiZhu;
	/*
	 * 状态 只保存 0 1 2 0：将数据显示在应收款页面 1：将数据显示在已收款页面 2：将数据显示在坏账页面
	 */
	private Integer skState;

	// 收支类型id
	private Integer shouzhilxId;
	// 收支类型
	private String shouzhilxType;

	// 银行卡ID
	private String fkzhBankId;
	// 银行卡号
	private String fkzhBankCode;
	// 开户行
	private String fkzhBankName;
	public String getFkzhBankName() {
		return fkzhBankName;
	}

	public void setFkzhBankName(String fkzhBankName) {
		this.fkzhBankName = fkzhBankName;
	}

	public String getFkzhBankCode() {
		return fkzhBankCode;
	}

	public void setFkzhBankCode(String fkzhBankCode) {
		this.fkzhBankCode = fkzhBankCode;
	}

	public Integer getSkId() {

		return skId;
	}

	public void setSkId(Integer skId) {
		this.skId = skId;
	}

	public String getSkPayerName() {
		return skPayerName;
	}

	public void setSkPayerName(String skPayerName) {
		this.skPayerName = skPayerName;
	}

	public String getSkPayerNickname() {
		return skPayerNickname;
	}

	public void setSkPayerNickname(String skPayerNickname) {
		this.skPayerNickname = skPayerNickname;
	}

	public String getSkReceiptsCode() {
		return skReceiptsCode;
	}

	public void setSkReceiptsCode(String skReceiptsCode) {
		this.skReceiptsCode = skReceiptsCode;
	}

	public Double getSkPayables() {
		return skPayables;
	}

	public void setSkPayables(double skPayables) {
		this.skPayables = skPayables;
	}

	public Double getSkReceivable() {
		return skReceivable;
	}

	public void setSkReceivable(double skReceivable) {
		this.skReceivable = skReceivable;
	}

	public String getSkCreator() {
		return skCreator;
	}

	public void setSkCreator(String skCreator) {
		this.skCreator = skCreator;
	}

	public String getSkCreateDate() {
		return skCreateDate;
	}

	public void setSkCreateDate(String skCreateDate) {
		this.skCreateDate = skCreateDate;
	}

	public String getSkOperator() {
		return skOperator;
	}

	public void setSkOperator(String skOperator) {
		this.skOperator = skOperator;
	}

	public String getSkOperationDate() {
		return skOperationDate;
	}

	public void setSkOperationDate(String skOperationDate) {
		this.skOperationDate = skOperationDate;
	}

	public String getSkBeiZhu() {
		return skBeiZhu;
	}

	public void setSkBeiZhu(String skBeiZhu) {
		this.skBeiZhu = skBeiZhu;
	}

	public Integer getSkState() {
		return skState;
	}

	public void setSkState(Integer skState) {
		this.skState = skState;
	}

	public Integer getShouzhilxId() {
		return shouzhilxId;
	}

	public void setShouzhilxId(Integer shouzhilxId) {
		this.shouzhilxId = shouzhilxId;
	}

	public String getFkzhBankId() {
		return fkzhBankId;
	}

	public void setFkzhBankId(String fkzhBankId) {
		this.fkzhBankId = fkzhBankId;
	}

	public String getShouzhilxType() {
		return shouzhilxType;
	}

	public void setShouzhilxType(String shouzhilxType) {
		this.shouzhilxType = shouzhilxType;
	}

	public String getSkOperatorId() {
		return skOperatorId;
	}

	public void setSkOperatorId(String skOperatorId) {
		this.skOperatorId = skOperatorId;
	}
	
	public String getSkCreatorId() {
		return skCreatorId;
	}

	public void setSkCreatorId(String skCreatorId) {
		this.skCreatorId = skCreatorId;
	}
	
	@Override
	public String toString() {
		return "CwShouKuanVO [skId=" + skId + ", skPayerName=" + skPayerName + ", skPayerNickname=" + skPayerNickname
				+ ", skReceiptsCode=" + skReceiptsCode + ", skPayables=" + skPayables + ", skReceivable=" + skReceivable
				+ ", skCreator=" + skCreator + ", skCreateDate=" + skCreateDate + ", skOperator=" + skOperator
				+ ", skOperationDate=" + skOperationDate + ", skBeiZhu=" + skBeiZhu + ", skState=" + skState
				+ ", shouzhilxId=" + shouzhilxId + ", fkzhBankId=" + fkzhBankId + "]";
	}

}
