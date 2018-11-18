package mjy.caiwu.kucunchengben.po;

import java.util.Date;

/**
 * (�����ϸ����) ÿ�ν����۸�ͬ��ϵͳ��μ���ɱ��� �������ơ��ǰ���"�ƶ���Ȩƽ����"��������ɱ��� ����ÿ�ν����ĳɱ�����ԭ�п�����ĳɱ�,
 * ����ÿ�ν���������ԭ�п����������֮��, ���Լ����Ȩƽ����λ�ɱ�,�Դ�Ϊ�������㷢������ĳɱ�����ĩ����ĳɱ��� ����㹫ʽ���� �ƶ���Ȩƽ�����ۣ�
 * (��������ǰ�����Ʒ���+����������Ʒ���)/ (��������ǰ�����Ʒ����+����������Ʒ���� )
 * 
 * @author david �����ϸ �䶯ʱ�� ҵ�� ��ص��ݺ� �䶯���� �䶯���� �ڳ���� �ڳ��ɱ� ��ĩ��� ��ĩ�ɱ� �ɱ�����
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
