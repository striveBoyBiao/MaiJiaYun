package mjy.caiwu.jichuziliao.vo;

import java.util.List;

import mjy.caigou.vo.ShopVO;

/**
 * �����˻�
 * 
 * @author student
 *
 */
public class FuKuanAccountVO {
	// �����˺�
	private String fkzhBankId;
	// ���̱��
	private int flshopId;
	// ��������(����û�У�������ҳ����ʾ)
	private String flshopName;
	// ��������
	private String fkzhBankName;
	// �Զ����ɣ���עĬ���˺ţ���ʾҳ�棬��ʾ�û�
	private int fkzhDafaultId;
	// ��ע
	private String fkzhRemark;
	// ��ʶĬ�ϸ��������˺�
	private boolean dafaultBankId;
	

	public String getFkzhBankId() {
		return fkzhBankId;
	}

	public void setFkzhBankId(String fkzhBankId) {
		this.fkzhBankId = fkzhBankId;
	}

	public int getFlshopId() {
		return flshopId;
	}

	public void setFlshopId(int flshopId) {
		this.flshopId = flshopId;
	}

	public String getFkzhBankName() {
		return fkzhBankName;
	}

	public void setFkzhBankName(String fkzhBankName) {
		this.fkzhBankName = fkzhBankName;
	}

	public int getFkzhDafaultId() {
		return fkzhDafaultId;
	}

	public void setFkzhDafaultId(int fkzhDafaultId) {
		this.fkzhDafaultId = fkzhDafaultId;
	}

	public String getFkzhRemark() {
		return fkzhRemark;
	}

	public void setFkzhRemark(String fkzhRemark) {
		this.fkzhRemark = fkzhRemark;
	}

	public boolean isDafaultBankId() {
		return dafaultBankId;
	}

	public void setDafaultBankId(boolean dafaultBankId) {
		this.dafaultBankId = dafaultBankId;
	}

	public String getFlshopName() {
		return flshopName;
	}

	public void setFlshopName(String flshopName) {
		this.flshopName = flshopName;
	}
}
