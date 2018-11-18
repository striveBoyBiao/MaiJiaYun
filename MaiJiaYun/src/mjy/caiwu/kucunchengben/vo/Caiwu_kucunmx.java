package mjy.caiwu.kucunchengben.vo;

import java.util.Date;

/**
 * 
 * @author david
 * @see �����ϸ �䶯ʱ�� ҵ�� ��ص��ݺ� �䶯���� �䶯���� �ڳ���� �ڳ��ɱ� ��ĩ��� ��ĩ�ɱ� �ɱ�����
 */
public class Caiwu_kucunmx {
	private int goodId;
	private int warehouseId;
	private String businessName;// ҵ��
	private String billsName;// ��ص��ݺ�
	private Date changeTime;
	private int firstInventory;// �ڳ����
	private double firstCost;// �ڳ��ɱ�
	private int lastInventory;// ��ĩ���
	private double lastCost;// ��ĩ�ɱ�

	public int getGoodId() {
		return goodId;
	}

	public void setGoodId(int goodId) {
		this.goodId = goodId;
	}

	public int getWarehouseId() {
		return warehouseId;
	}

	public void setWarehouseId(int warehouseId) {
		this.warehouseId = warehouseId;
	}

	public String getBusinessName() {
		return businessName;
	}

	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}

	public String getBillsName() {
		return billsName;
	}

	public void setBillsName(String billsName) {
		this.billsName = billsName;
	}

	public Date getChangeTime() {
		return changeTime;
	}

	public void setChangeTime(Date changeTime) {
		this.changeTime = changeTime;
	}

	public int getFirstInventory() {
		return firstInventory;
	}

	public void setFirstInventory(int firstInventory) {
		this.firstInventory = firstInventory;
	}

	public double getFirstCost() {
		return firstCost;
	}

	public void setFirstCost(double firstCost) {
		this.firstCost = firstCost;
	}

	public int getLastInventory() {
		return lastInventory;
	}

	public void setLastInventory(int lastInventory) {
		this.lastInventory = lastInventory;
	}

	public double getLastCost() {
		return lastCost;
	}

	public void setLastCost(double lastCost) {
		this.lastCost = lastCost;
	}

	@Override
	public String toString() {
		return "Caiwu_kucunmx [goodId=" + goodId + ", warehouseId=" + warehouseId + ", businessName=" + businessName
				+ ", billsName=" + billsName + ", changeTime=" + changeTime + ", firstInventory=" + firstInventory
				+ ", firstCost=" + firstCost + ", lastInventory=" + lastInventory + ", lastCost=" + lastCost + "]";
	}

}
