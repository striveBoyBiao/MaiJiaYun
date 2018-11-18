package mjy.kuguan.diaobo.vo;

public class DiaobodanstateVO {
	private String diaobodanCode;
	private String diaobodanSetTime;
	private String diaobodanCreater;
	private String diaobodanAuditor;
	private String diaobodanAudittime;
	private String diaobodanOutStore;
	private String diaobodanInStore;
	private String diaoboState;
	private String diaoboBeizhu;
	
	
	public String getDiaobodanCode() {
		return diaobodanCode;
	}
	public void setDiaobodanCode(String diaobodanCode) {
		this.diaobodanCode = diaobodanCode;
	}
	public String getDiaobodanSetTime() {
		return diaobodanSetTime;
	}
	public void setDiaobodanSetTime(String diaobodanSetTime) {
		this.diaobodanSetTime = diaobodanSetTime;
	}
	public String getDiaobodanCreater() {
		return diaobodanCreater;
	}
	public void setDiaobodanCreater(String diaobodanCreater) {
		this.diaobodanCreater = diaobodanCreater;
	}
	public String getDiaobodanAuditor() {
		return diaobodanAuditor;
	}
	public void setDiaobodanAuditor(String diaobodanAuditor) {
		this.diaobodanAuditor = diaobodanAuditor;
	}
	public String getDiaobodanAudittime() {
		return diaobodanAudittime;
	}
	public void setDiaobodanAudittime(String diaobodanAudittime) {
		this.diaobodanAudittime = diaobodanAudittime;
	}
	public String getDiaobodanOutStore() {
		return diaobodanOutStore;
	}
	public void setDiaobodanOutStore(String diaobodanOutStore) {
		this.diaobodanOutStore = diaobodanOutStore;
	}
	public String getDiaobodanInStore() {
		return diaobodanInStore;
	}
	public void setDiaobodanInStore(String diaobodanInStore) {
		this.diaobodanInStore = diaobodanInStore;
	}
	public String getDiaoboBeizhu() {
		return diaoboBeizhu;
	}
	public void setDiaoboBeizhu(String diaoboBeizhu) {
		this.diaoboBeizhu = diaoboBeizhu;
	}
	public String getDiaoboState() {
		if(diaoboState.equals("0")){
			diaoboState="已完成";
		}else if(diaoboState.equals("1")){
			diaoboState="待审核";
		}else if(diaoboState.equals("2")){
			diaoboState="出库中";
		}else{
			diaoboState="入库中";
		}
		return diaoboState;
	}
	public void setDiaoboState(String diaoboState) {
		this.diaoboState = diaoboState;
	}
	@Override
	public String toString() {
		return "DiaobodanstateVO [diaobodanCode=" + diaobodanCode + ", diaobodanSetTime=" + diaobodanSetTime
				+ ", diaobodanCreater=" + diaobodanCreater + ", diaobodanAuditor=" + diaobodanAuditor
				+ ", diaobodanAudittime=" + diaobodanAudittime + ", diaobodanOutStore=" + diaobodanOutStore
				+ ", diaobodanInStore=" + diaobodanInStore + ", diaoboState=" + diaoboState + ", diaoboBeizhu="
				+ diaoboBeizhu + "]";
	}
	
}
