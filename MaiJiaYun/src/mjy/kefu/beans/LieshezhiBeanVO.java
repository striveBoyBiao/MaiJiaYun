package mjy.kefu.beans;

public class LieshezhiBeanVO {
	private String lieTitle;//列名
	private String showName;//显示名称
	private boolean state;//显示状态
	private int sequence;//顺序
	public String getLieTitle() {
		return lieTitle;
	}
	public void setLieTitle(String lieTitle) {
		this.lieTitle = lieTitle;
	}
	public String getShowName() {
		return showName;
	}
	public void setShowName(String showName) {
		this.showName = showName;
	}
	public boolean getState() {
		return state;
	}
	public void setState(boolean state) {
		this.state = state;
	}
	public int getSequence() {
		return sequence;
	}
	public void setSequence(int sequence) {
		this.sequence = sequence;
	}
}
