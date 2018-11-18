package mjy.kuguan.diaobo.po;

/**
 * 调拨单状态表插入数据封装
 * @author student
 *
 */

public class DiaobodanstatePO {
	private String diaobodanCode;
	private String diaobodanCreater;
	private String diaobodanOutStore;
	private String diaobodanInStore;
	private String diaoboState;
	private String diaoboBeizhu;

	private String queryUrl;
	
	public String getDiaobodanCode() {
		return diaobodanCode;
	}
	public void setDiaobodanCode(String diaobodanCode) {
		this.diaobodanCode = diaobodanCode;
	}
	public String getDiaobodanCreater() {
		return diaobodanCreater;
	}
	public void setDiaobodanCreater(String diaobodanCreater) {
		this.diaobodanCreater = diaobodanCreater;
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
	public String getDiaoboState() {
		return diaoboState;
	}
	public void setDiaoboState(String diaoboState) {
		this.diaoboState = diaoboState;
	}
	public String getDiaoboBeizhu() {
		return diaoboBeizhu;
	}
	public void setDiaoboBeizhu(String diaoboBeizhu) {
		this.diaoboBeizhu = diaoboBeizhu;
	}
	public String getQueryUrl() {

		StringBuffer sb = new StringBuffer("&1=1");
		if (diaobodanCode != null && !diaobodanCode.equals("")) {
			sb.append("&diaobodanCode=" + diaobodanCode);
		}
		if (diaobodanOutStore != null && !diaobodanOutStore.equals("")) {
			sb.append("&diaobodanOutStore=" + diaobodanOutStore);
		}
		if (diaobodanInStore != null && !diaobodanInStore.equals("")) {
			sb.append("&diaobodanInStore=" + diaobodanInStore);
		}

		return sb.toString();
	}
	
	@Override
	public String toString() {
		return "DiaobodanstatePO [diaobodanCode=" + diaobodanCode + ", diaobodanCreater=" + diaobodanCreater
				+ ", diaobodanOutStore=" + diaobodanOutStore + ", diaobodanInStore=" + diaobodanInStore
				+ ", diaoboState=" + diaoboState + ", diaoboBeizhu=" + diaoboBeizhu + "]";
	}
	
	
}
