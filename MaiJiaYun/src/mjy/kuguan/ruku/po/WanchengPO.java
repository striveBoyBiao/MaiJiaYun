package mjy.kuguan.ruku.po;

public class WanchengPO {
	// ������
	private String wanchengCode;
	// ��ص���
	private String wanchengXiangguanCode;
	// �������
	private String wanchengType;
	// �������
	private int wanchengInCount;
	// �Ƶ�ʱ��
	private String wanchengSetTime;
	// �Ƶ���
	private String wanchengAuthor;
	// ���ȷ����
	private String wanchengChecker;
	// ���ȷ��ʱ��
	private String wanchengCheckTime;
	// ����
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
