package mjy.kuguan.diaobo.po;
/**
 * 搜索查询条件封装
 * @author student
 *
 */

public class DiaobodanPO {
	private String diaobodanCode;
	private String diaobodanOutStore;
	private String diaobodanInStore;
	private String diaoboState;

	public String getDiaobodanCode() {
		return diaobodanCode;
	}

	public void setDiaobodanCode(String diaobodanCode) {
		this.diaobodanCode = diaobodanCode;
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

	public String getDiaoboState() {
		return diaoboState;
	}

	public void setDiaoboState(String diaoboState) {
		this.diaoboState = diaoboState;
	}

	

}
