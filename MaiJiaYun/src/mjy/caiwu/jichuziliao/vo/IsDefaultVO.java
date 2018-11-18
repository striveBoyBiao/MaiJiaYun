package mjy.caiwu.jichuziliao.vo;

public class IsDefaultVO {
	private int dafaultBankId;
	private int fkzhDafaultId;
	public int getDafaultBankId() {
		return dafaultBankId;
	}

	public void setDafaultBankId(int dafaultBankId) {
		this.dafaultBankId = dafaultBankId;
	}
	
	public int getFkzhDafaultId() {
		return fkzhDafaultId;
	}

	public void setFkzhDafaultId(int fkzhDafaultId) {
		this.fkzhDafaultId = fkzhDafaultId;
	}

	@Override
	public String toString() {
		return "IsDefaultVO [dafaultBankId=" + dafaultBankId + ", fkzhDafaultId=" + fkzhDafaultId + "]";
	}
	
}
