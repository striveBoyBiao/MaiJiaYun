package mjy.kuguan.diaobo.vo;

public class DiaobodanVO {
	private String diaobodanCode;
	private String sku;
	private String goodName;
	private String goodProperty;
	private Integer goodRepertory;
	private Integer outNumber;
	private String beizhu;
	
	public String getDiaobodanCode() {
		return diaobodanCode;
	}
	public void setDiaobodanCode(String diaobodanCode) {
		this.diaobodanCode = diaobodanCode;
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
	
	@Override
	public String toString() {
		return "DiaobodanVO [diaobodanCode=" + diaobodanCode + ", sku=" + sku + ", goodName=" + goodName
				+ ", goodProperty=" + goodProperty + ", goodRepertory=" + goodRepertory + ", outNumber=" + outNumber
				+ ", beizhu=" + beizhu + "]";
	}
	
}
