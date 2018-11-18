package mjy.caigou.vo;

import java.util.Date;

public class KCCBMXVO {
	
	private int goodId;
	private int warehouseId;
	private String businessName;
	private String billsName;
	private String changeTime;
	private int firstInventory;
	private double firstCost;
	private  int lastInventory;
	
	private double lastCost;

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

	public String getChangeTime() {
		return changeTime;
	}

	public void setChangeTime(String changeTime) {
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
	

}
