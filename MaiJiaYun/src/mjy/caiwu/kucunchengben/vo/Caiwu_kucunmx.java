package mjy.caiwu.kucunchengben.vo;

import java.util.Date;

/**
 * 
 * @author david
 * @see 库存明细 变动时间 业务 相关单据号 变动数量 变动单价 期初库存 期初成本 期末库存 期末成本 成本结余
 */
public class Caiwu_kucunmx {
	private int goodId;
	private int warehouseId;
	private String businessName;// 业务
	private String billsName;// 相关单据号
	private Date changeTime;
	private int firstInventory;// 期初库存
	private double firstCost;// 期初成本
	private int lastInventory;// 期末库存
	private double lastCost;// 期末成本

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
