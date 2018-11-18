package mjy.kuguan.ruku.po;

public class DiaoborukuPO {
	//入库单号
	private String diaoboCode;
	//相关调拨单号
	private String diaoboDiaobodanCode;
	//入库仓库
	private String diaoboWarehouse;
	//入库数量
	private int diaoboInCount;
	//已入库数量
	private int diaoboInFinish;
	//制单时间
	private String diaoboSetTime;
	//制单人
	private String diaoboAuthor;
	//本单备注
	private String diaoboNote;
	public String getDiaoboCode() {
		return diaoboCode;
	}
	public void setDiaoboCode(String diaoboCode) {
		this.diaoboCode = diaoboCode;
	}
	public String getDiaoboDiaobodanCode() {
		return diaoboDiaobodanCode;
	}
	public void setDiaoboDiaobodanCode(String diaoboDiaobodanCode) {
		this.diaoboDiaobodanCode = diaoboDiaobodanCode;
	}
	public String getDiaoboWarehouse() {
		return diaoboWarehouse;
	}
	public void setDiaoboWarehouse(String diaoboWarehouse) {
		this.diaoboWarehouse = diaoboWarehouse;
	}
	public int getDiaoboInCount() {
		return diaoboInCount;
	}
	public void setDiaoboInCount(int diaoboInCount) {
		this.diaoboInCount = diaoboInCount;
	}
	public int getDiaoboInFinish() {
		return diaoboInFinish;
	}
	public void setDiaoboInFinish(int diaoboInFinish) {
		this.diaoboInFinish = diaoboInFinish;
	}
	public String getDiaoboSetTime() {
		return diaoboSetTime;
	}
	public void setDiaoboSetTime(String diaoboSetTime) {
		this.diaoboSetTime = diaoboSetTime;
	}
	public String getDiaoboAuthor() {
		return diaoboAuthor;
	}
	public void setDiaoboAuthor(String diaoboAuthor) {
		this.diaoboAuthor = diaoboAuthor;
	}
	public String getDiaoboNote() {
		return diaoboNote;
	}
	public void setDiaoboNote(String diaoboNote) {
		this.diaoboNote = diaoboNote;
	}
	
	
}
