package mjy.kuguan.chukudan.vo;

public class ChuKuDanVO {

	private String danCode;
	private String chukuType;
	private String chukuState;
	private String chukuCangku;

	
	public String getChukuCangku() {
		return chukuCangku;
	}
	public void setChukuCangku(String chukuCangku) {
		this.chukuCangku = chukuCangku;
	}
	public String getDanCode() {
		return danCode;
	}
	public void setDanCode(String danCode) {
		this.danCode = danCode;
	}
	public String getChukuType() {
		return chukuType;
	}
	public void setChukuType(String chukuType) {
		this.chukuType = chukuType;
	}
	public String getChukuState() {
		return chukuState;
	}
	public void setChukuState(String chukuState) {
		this.chukuState = chukuState;
	}
	@Override
	public String toString() {
		return "ChuKuDanVO [danCode=" + danCode + ", chukuType=" + chukuType + ", chukuState=" + chukuState
				+ ", chukuCangku=" + chukuCangku + "]";
	}

	
	
}
