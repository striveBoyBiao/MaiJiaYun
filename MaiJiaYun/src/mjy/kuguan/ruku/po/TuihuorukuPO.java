package mjy.kuguan.ruku.po;

public class TuihuorukuPO {
	//入库单编号
	private String tuihuoCode;
	//相关退货单编号
	private String tuihuoTuihuodanCode;
	//入库仓库
	private String tuihuoWarehouse;
	//入库数量
	private int tuihuoInCount;
	//已入库数量
	private int tuihuoInFinish;
	//制单时间
	private String tuihuoSetTime;
	//制单人
	private String tuihuoAuthor;
	//本单备注
	private String tuihuoNote;
	
	public String getTuihuoCode() {
		return tuihuoCode;
	}
	public void setTuihuoCode(String tuihuoCode) {
		this.tuihuoCode = tuihuoCode;
	}
	public String getTuihuoTuihuodanCode() {
		return tuihuoTuihuodanCode;
	}
	public void setTuihuoTuihuodanCode(String tuihuoTuihuodanCode) {
		this.tuihuoTuihuodanCode = tuihuoTuihuodanCode;
	}
	public String getTuihuoWarehouse() {
		return tuihuoWarehouse;
	}
	public void setTuihuoWarehouse(String tuihuoWarehouse) {
		this.tuihuoWarehouse = tuihuoWarehouse;
	}
	public int getTuihuoInCount() {
		return tuihuoInCount;
	}
	public void setTuihuoInCount(int tuihuoInCount) {
		this.tuihuoInCount = tuihuoInCount;
	}
	public int getTuihuoInFinish() {
		return tuihuoInFinish;
	}
	public void setTuihuoInFinish(int tuihuoInFinish) {
		this.tuihuoInFinish = tuihuoInFinish;
	}
	public String getTuihuoSetTime() {
		return tuihuoSetTime;
	}
	public void setTuihuoSetTime(String tuihuoSetTime) {
		this.tuihuoSetTime = tuihuoSetTime;
	}
	public String getTuihuoAuthor() {
		return tuihuoAuthor;
	}
	public void setTuihuoAuthor(String tuihuoAuthor) {
		this.tuihuoAuthor = tuihuoAuthor;
	}
	public String getTuihuoNote() {
		return tuihuoNote;
	}
	public void setTuihuoNote(String tuihuoNote) {
		this.tuihuoNote = tuihuoNote;
	}
	
	
}
