package mjy.caiwu.kucunchengben.po;

import java.util.Date;

/**
 * (库存明细数据) 每次进货价格不同，系统如何计算成本？ “卖家云”是按照"移动加权平均法"计算进货成本。 即以每次进货的成本加上原有库存存货的成本,
 * 除以每次进货数量与原有库存存货的数量之和, 据以计算加权平均单位成本,以此为基础计算发出存货的成本和期末存货的成本。 其计算公式如下 移动加权平均单价＝
 * (本次收入前结存商品金额+本次收入商品金额)/ (本次收入前结存商品数量+本次收入商品数量 )
 * 
 * @author david 库存明细 变动时间 业务 相关单据号 变动数量 变动单价 期初库存 期初成本 期末库存 期末成本 成本结余
 */
public class KucunmxPo {
	private Date changeTime;
	private String Business;
	private String bills;
	private int changeCount;
	private double changePrice;
	private int firstCount;
	private double firstCost;
	private int lastCount;
	private double lastCost;
	private double jieyu;

	public Date getChangeTime() {
		return changeTime;
	}

	public void setChangeTime(Date changeTime) {
		this.changeTime = changeTime;
	}

	public String getBusiness() {
		return Business;
	}

	public void setBusiness(String business) {
		Business = business;
	}

	public String getBills() {
		return bills;
	}

	public void setBills(String bills) {
		this.bills = bills;
	}

	public int getChangeCount() {
		return changeCount;
	}

	public void setChangeCount(int changeCount) {
		this.changeCount = changeCount;
	}

	public double getChangePrice() {
		return changePrice;
	}

	public void setChangePrice(double changePrice) {
		this.changePrice = changePrice;
	}

	public int getFirstCount() {
		return firstCount;
	}

	public void setFirstCount(int firstCount) {
		this.firstCount = firstCount;
	}

	public double getFirstCost() {
		return firstCost;
	}

	public void setFirstCost(double firstCost) {
		this.firstCost = firstCost;
	}

	public int getLastCount() {
		return lastCount;
	}

	public void setLastCount(int lastCount) {
		this.lastCount = lastCount;
	}

	public double getLastCost() {
		return lastCost;
	}

	public void setLastCost(double lastCost) {
		this.lastCost = lastCost;
	}

	public double getJieyu() {
		return jieyu;
	}

	public void setJieyu(double jieyu) {
		this.jieyu = jieyu;
	}

	@Override
	public String toString() {
		return "KucunmxPo [changeTime=" + changeTime + ", Business=" + Business + ", bills=" + bills + ", changeCount="
				+ changeCount + ", changePrice=" + changePrice + ", firstCount=" + firstCount + ", firstCost="
				+ firstCost + ", lastCount=" + lastCount + ", lastCost=" + lastCost + ", jieyu=" + jieyu + "]";
	}

}
