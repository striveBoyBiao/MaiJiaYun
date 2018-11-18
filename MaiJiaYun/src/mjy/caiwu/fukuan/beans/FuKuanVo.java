package mjy.caiwu.fukuan.beans;

/**
 * caiwu_fukuan表的所有字段
 * @author student
 * 2016年12月9日
 */
public class FuKuanVo {
	private Integer fkId;//id
	private String fkNo;//采购编号
	private String fkSkName;//收款人姓名
	private String fkSkNickName;//收款人昵称
	private Integer fkNumber;//数量
	private Double fkPayMoney;//付款额
	private Double fkShouldpayMoney;//应付款
	private Integer fkShouzhilxId;//收支类型ID
	private String fkRemark;//备注
	private Integer fkCreaterId;//创建人
	private String fkCreaterTime;//创建时间
	private Integer fkOperatorId;//操作人
	private String fkOperatorTime;//操作时间
	private  Integer fkState;//状态
	private String fkzhDafaultId;//银行账户ID
	private String other1; //空余字段1
	private String other2; //空余字段2
	private String other3; //空余字段3
	private Integer other4;//空余字段4
	private String other5;//空余字段5
	private Integer other6; //空余字段6
	

	public Integer getFkId() {
		return fkId;
	}
	public void setFkId(Integer fkId) {
		this.fkId = fkId;
	}
	public String getFkNo() {
		return fkNo;
	}
	public void setFkNo(String fkNo) {
		this.fkNo = fkNo;
	}
	public String getFkSkName() {
		return fkSkName;
	}
	public void setFkSkName(String fkSkName) {
		this.fkSkName = fkSkName;
	}
	public String getFkSkNickName() {
		return fkSkNickName;
	}
	public void setFkSkNickName(String fkSkNickName) {
		this.fkSkNickName = fkSkNickName;
	}
	public Integer getFkNumber() {
		return fkNumber;
	}
	public void setFkNumber(Integer fkNumber) {
		this.fkNumber = fkNumber;
	}
	public Double getFkPayMoney() {
		return fkPayMoney;
	}
	public void setFkPayMoney(Double fkPayMoney) {
		this.fkPayMoney = fkPayMoney;
	}
	public Double getFkShouldpayMoney() {
		return fkShouldpayMoney;
	}
	public void setFkShouldpayMoney(Double fkShouldpayMoney) {
		this.fkShouldpayMoney = fkShouldpayMoney;
	}
	public Integer getFkShouzhilxId() {
		return fkShouzhilxId;
	}
	public void setFkShouzhilxId(Integer fkShouzhilxId) {
		this.fkShouzhilxId = fkShouzhilxId;
	}
	public String getFkRemark() {
		return fkRemark;
	}
	public void setFkRemark(String fkRemark) {
		this.fkRemark = fkRemark;
	}
	public Integer getFkCreaterId() {
		return fkCreaterId;
	}
	public void setFkCreaterId(Integer fkCreaterId) {
		this.fkCreaterId = fkCreaterId;
	}
	public String getFkCreaterTime() {
		return fkCreaterTime;
	}
	public void setFkCreaterTime(String fkCreaterTime) {
		this.fkCreaterTime = fkCreaterTime;
	}
	public Integer getFkOperatorId() {
		return fkOperatorId;
	}
	public void setFkOperatorId(Integer fkOperatorId) {
		this.fkOperatorId = fkOperatorId;
	}
	public String getFkOperatorTime() {
		return fkOperatorTime;
	}
	public void setFkOperatorTime(String fkOperatorTime) {
		this.fkOperatorTime = fkOperatorTime;
	}
	public Integer getFkState() {
		return fkState;
	}
	public void setFkState(Integer fkState) {
		this.fkState = fkState;
	}

	
	public String getFkzhDafaultId() {
		return fkzhDafaultId;
	}
	public void setFkzhDafaultId(String fkzhDafaultId) {
		this.fkzhDafaultId = fkzhDafaultId;
	}
	public String getOther1() {
		return other1;
	}
	
	public void setOther1(String other1) {
		this.other1 = other1;
	}
	
	public String getOther2() {
		return other2;
	}
	
	public void setOther2(String other2) {
		this.other2 = other2;
	}
	
	public String getOther3() {
		return other3;
	}
	
	public void setOther3(String other3) {
		this.other3 = other3;
	}
	public Integer getOther4() {
		return other4;
	}
	public void setOther4(Integer other4) {
		this.other4 = other4;
	}
	public String getOther5() {
		return other5;
	}
	public void setOther5(String other5) {
		this.other5 = other5;
	}
	public Integer getOther6() {
		return other6;
	}
	public void setOther6(Integer other6) {
		this.other6 = other6;
	}
	@Override
	public String toString() {
		return "FuKuanVo [fkId=" + fkId + ", fkNo=" + fkNo + ", fkSkName="
				+ fkSkName + ", fkSkNickName=" + fkSkNickName + ", fkNumber="
				+ fkNumber + ", fkPayMoney=" + fkPayMoney
				+ ", fkShouldpayMoney=" + fkShouldpayMoney + ", fkShouzhilxId="
				+ fkShouzhilxId + ", fkRemark=" + fkRemark + ", fkCreaterId="
				+ fkCreaterId + ", fkCreaterTime=" + fkCreaterTime
				+ ", fkOperatorId=" + fkOperatorId + ", fkOperatorTime="
				+ fkOperatorTime + ", fkState=" + fkState + ", fkzhDafaultId="
				+ fkzhDafaultId + ", other1=" + other1 + ", other2=" + other2
				+ ", other3=" + other3 + ", other4=" + other4 + ", other5="
				+ other5 + ", other6=" + other6 + "]";
	}
	
	
	
}
