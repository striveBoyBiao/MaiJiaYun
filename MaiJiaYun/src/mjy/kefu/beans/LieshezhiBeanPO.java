package mjy.kefu.beans;

public class LieshezhiBeanPO {
	private int lieshezhiId;//������Id
	private int userId;//�û�Id
	private String colName;
	private String lieTitle;//����
	private String showName;//��ʾ����
	private boolean state;//��ʾ״̬
	private int sequence;//˳��
	private boolean defaultState;//Ĭ����ʾ״̬
	private int defaultSequence;//Ĭ��˳��
	public int getLieshezhiId() {
		return lieshezhiId;
	}
	public void setLieshezhiId(int lieshezhiId) {
		this.lieshezhiId = lieshezhiId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getColName() {
		return colName;
	}
	public void setColName(String colName) {
		this.colName = colName;
	}
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
	public boolean getDefaultState() {
		return defaultState;
	}
	public void setDefaultState(boolean defaultState) {
		this.defaultState = defaultState;
	}
	public int getDefaultSequence() {
		return defaultSequence;
	}
	public void setDefaultSequence(int defaultSequence) {
		this.defaultSequence = defaultSequence;
	}
}
