package mjy.caigou.po;

public class ReturnPO {
	// 采购退货状态
	private Integer returnState;
	// 采购退货单
	private Integer returnId;
	// 登陆用户Id
	private Integer userId;
	// 页面第一条数据在数据中的起始位置
	private Integer beginNum;

	public Integer getBeginNum() {
		return beginNum;
	}

	public void setBeginNum(Integer beginNum) {
		this.beginNum = beginNum;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getReturnId() {
		return returnId;
	}

	public void setReturnId(Integer returnId) {
		this.returnId = returnId;
	}

	public Integer getReturnState() {
		return returnState;
	}

	public void setReturnState(Integer returnState) {
		this.returnState = returnState;
	}

}
