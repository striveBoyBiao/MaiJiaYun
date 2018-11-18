package mjy.caiwu.shoukuan.beans;

import java.util.Date;
/**
 * 收款表的查询参数
 */
public class CwShouKuanPO {

	//boss 的id
	
	private String userId;
	// 付款人姓名
	private String skPayerName;
	// 付款人昵称
	private String skPayerNickname;
	// 相关单据号
	private String skReceiptsCode; 
	// 应付款
	private double skPayables;
	// 应收款
	private double skReceivable;
	// 创建人
	private String skCreator;
	// 创建时间
	private Date skCreateDate;
	// 操作人
	private String skOperator;
	// 操作时间
	private Date skOperationDate;
	// 备注
	private String skBeiZhu;


	// 状态参数
	private Integer skState;
	// 收支类型id
	private Integer shouzhilxId;
	// 页面开始参数
	private Integer rowStart;
	//查询参数：
	private String param;
	/*
	 * // 每页显示的记录条数 private int pageSize;
	 * 
	 * 
	 * public int getPageSize() { return pageSize; }
	 * 
	 * public void setPageSize(int pageSize) { this.pageSize = pageSize; }
	 */

	public void setRowStart(Integer rowStart) {
		this.rowStart = rowStart;
	}

	public Integer getRowStart() {
		return rowStart;
	}
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setRowStart(int rowStart) {
		this.rowStart = rowStart;
	}

	public Integer getSkState() {
		return skState;
	}

	public void setSkState(Integer skState) {
		this.skState = skState;
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

	public double getSkPayables() {
		return skPayables;
	}

	public void setSkPayables(double skPayables) {
		this.skPayables = skPayables;
	}

	public double getSkReceivable() {
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

	public Date getSkCreateDate() {
		return skCreateDate;
	}

	public void setSkCreateDate(Date skCreateDate) {
		this.skCreateDate = skCreateDate;
	}

	public String getSkOperator() {
		return skOperator;
	}

	public void setSkOperator(String skOperator) {
		this.skOperator = skOperator;
	}

	public Date getSkOperationDate() {
		return skOperationDate;
	}

	public void setSkOperationDate(Date skOperationDate) {
		this.skOperationDate = skOperationDate;
	}

	public String getSkBeiZhu() {
		return skBeiZhu;
	}

	public void setSkBeiZhu(String skBeiZhu) {
		this.skBeiZhu = skBeiZhu;
	}


	public Integer getShouzhilxId() {
		return shouzhilxId;
	}

	public void setShouzhilxId(Integer shouzhilxId) {
		this.shouzhilxId = shouzhilxId;
	}
	public String getParam() {
		return param;
	}

	public void setParam(String param) {
		this.param = param;
	}
}
