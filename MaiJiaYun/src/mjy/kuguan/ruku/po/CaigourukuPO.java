package mjy.kuguan.ruku.po;

public class CaigourukuPO {
	//入库单编号
	private String caigouCode;
	//相关采购单编号
	private String caigouCaigoudanCode;
	//入库仓库
	private String caigouWarehouse;
	//入库数量
	private int caigouInCount;
	//已入库数量
	private int caigouInFinish;
	//制单时间
	private String caigouSetTime;
	//制单人
	private String caigouAuthor;
	//入库备注
	private String caigouNote;
	
	public String getCaigouCode() {
		return caigouCode;
	}
	public void setCaigouCode(String caigouCode) {
		this.caigouCode = caigouCode;
	}
	public String getCaigouCaigoudanCode() {
		return caigouCaigoudanCode;
	}
	public void setCaigouCaigoudanCode(String caigouCaigoudanCode) {
		this.caigouCaigoudanCode = caigouCaigoudanCode;
	}
	public String getCaigouWarehouse() {
		return caigouWarehouse;
	}
	public void setCaigouWarehouse(String caigouWarehouse) {
		this.caigouWarehouse = caigouWarehouse;
	}
	public int getCaigouInCount() {
		return caigouInCount;
	}
	public void setCaigouInCount(int caigouInCount) {
		this.caigouInCount = caigouInCount;
	}
	public int getCaigouInFinish() {
		return caigouInFinish;
	}
	public void setCaigouInFinish(int caigouInFinish) {
		this.caigouInFinish = caigouInFinish;
	}
	public String getCaigouSetTime() {
		return caigouSetTime;
	}
	public void setCaigouSetTime(String caigouSetTime) {
		this.caigouSetTime = caigouSetTime;
	}
	public String getCaigouAuthor() {
		return caigouAuthor;
	}
	public void setCaigouAuthor(String caigouAuthor) {
		this.caigouAuthor = caigouAuthor;
	}
	public String getCaigouNote() {
		return caigouNote;
	}
	public void setCaigouNote(String caigouNote) {
		this.caigouNote = caigouNote;
	}
}
