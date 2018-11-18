package mjy.kuguan.ruku.po;

public class WanchengPO {
	// 入库点编号
	private String wanchengCode;
	// 相关单据
	private String wanchengXiangguanCode;
	// 入库类型
	private String wanchengType;
	// 入库数量
	private int wanchengInCount;
	// 制单时间
	private String wanchengSetTime;
	// 制单人
	private String wanchengAuthor;
	// 入库确认人
	private String wanchengChecker;
	// 入库确认时间
	private String wanchengCheckTime;
	// 操作
	private String wanchengNote;

	public String getWanchengCode() {
		return wanchengCode;
	}

	public void setWanchengCode(String wanchengCode) {
		this.wanchengCode = wanchengCode;
	}

	public String getWanchengXiangguanCode() {
		return wanchengXiangguanCode;
	}

	public void setWanchengXiangguanCode(String wanchengXiangguanCode) {
		this.wanchengXiangguanCode = wanchengXiangguanCode;
	}

	public String getWanchengType() {
		return wanchengType;
	}

	public void setWanchengType(String wanchengType) {
		this.wanchengType = wanchengType;
	}

	public int getWanchengInCount() {
		return wanchengInCount;
	}

	public void setWanchengInCount(int wanchengInCount) {
		this.wanchengInCount = wanchengInCount;
	}

	public String getWanchengSetTime() {
		return wanchengSetTime;
	}

	public void setWanchengSetTime(String wanchengSetTime) {
		this.wanchengSetTime = wanchengSetTime;
	}

	public String getWanchengAuthor() {
		return wanchengAuthor;
	}

	public void setWanchengAuthor(String wanchengAuthor) {
		this.wanchengAuthor = wanchengAuthor;
	}

	public String getWanchengChecker() {
		return wanchengChecker;
	}

	public void setWanchengChecker(String wanchengChecker) {
		this.wanchengChecker = wanchengChecker;
	}

	public String getWanchengCheckTime() {
		return wanchengCheckTime;
	}

	public void setWanchengCheckTime(String wanchengCheckTime) {
		this.wanchengCheckTime = wanchengCheckTime;
	}

	public String getWanchengNote() {
		return wanchengNote;
	}

	public void setWanchengNote(String wanchengNote) {
		this.wanchengNote = wanchengNote;
	}

	@Override
	public String toString() {
		return "WangChengPO [wanchengCode=" + wanchengCode + ", wanchengXiangguanCode=" + wanchengXiangguanCode
				+ ", wanchengType=" + wanchengType + ", wanchengInCount=" + wanchengInCount + ", wanchengSetTime="
				+ wanchengSetTime + ", wanchengAuthor=" + wanchengAuthor + ", wanchengChecker=" + wanchengChecker
				+ ", wanchengCheckTime=" + wanchengCheckTime + ", wanchengNote=" + wanchengNote + "]";
	}

}
