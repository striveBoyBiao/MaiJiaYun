package mjy.caiwu.jichuziliao.vo;

import java.util.List;

import mjy.caigou.vo.ShopVO;

/**
 * 付款账户
 * 
 * @author student
 *
 */
public class FuKuanAccountVO {
	// 银行账号
	private String fkzhBankId;
	// 商铺编号
	private int flshopId;
	// 店铺名称(表中没有，仅用于页面显示)
	private String flshopName;
	// 银行名称
	private String fkzhBankName;
	// 自动生成，标注默认账号，显示页面，提示用户
	private int fkzhDafaultId;
	// 备注
	private String fkzhRemark;
	// 标识默认付款银行账号
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
