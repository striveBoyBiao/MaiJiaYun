package mjy.kuguan.diaobo.po;

public class XiangqingDiaoboPO {
	private String sku;
	private String goodName;
	private String goodProperty;
	private Integer goodRepertory;
	private Integer outNumber;
	private String beizhu;
	
	private String diaobodanOutStore;
	private String diaobodanInStore;
	private String diaoboBeizhu;
	private String diaoboState;
	
	public String getDiaoboState() {
		return diaoboState;
	}
	public void setDiaoboState(String diaoboState) {
		this.diaoboState = diaoboState;
	}
	public String getSku() {
		return sku;
	}
	public void setSku(String sku) {
		this.sku = sku;
	}
	public String getGoodName() {
		return goodName;
	}
	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}
	public String getGoodProperty() {
		return goodProperty;
	}
	public void setGoodProperty(String goodProperty) {
		this.goodProperty = goodProperty;
	}
	public Integer getGoodRepertory() {
		return goodRepertory;
	}
	public void setGoodRepertory(Integer goodRepertory) {
		this.goodRepertory = goodRepertory;
	}
	public Integer getOutNumber() {
		return outNumber;
	}
	public void setOutNumber(Integer outNumber) {
		this.outNumber = outNumber;
	}
	public String getBeizhu() {
		return beizhu;
	}
	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
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
	@Override
	public String toString() {
		return "XiangqingDiaoboPO [sku=" + sku + ", goodName=" + goodName + ", goodProperty=" + goodProperty
				+ ", goodRepertory=" + goodRepertory + ", outNumber=" + outNumber + ", beizhu=" + beizhu
				+ ", diaobodanOutStore=" + diaobodanOutStore + ", diaobodanInStore=" + diaobodanInStore
				+ ", diaoboBeizhu=" + diaoboBeizhu + "]";
	}
	
	
	
	
}
