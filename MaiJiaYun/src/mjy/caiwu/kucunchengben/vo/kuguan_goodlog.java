package mjy.caiwu.kucunchengben.vo;

import java.util.Date;

public class kuguan_goodlog {
	private int wareHouseId;
	private int goodId;
	private int goodNum;
	private Date dateTime;
	public int getWareHouseId() {
		return wareHouseId;
	}
	public void setWareHouseId(int wareHouseId) {
		this.wareHouseId = wareHouseId;
	}
	public int getGoodId() {
		return goodId;
	}
	public void setGoodId(int goodId) {
		this.goodId = goodId;
	}
	public int getGoodNum() {
		return goodNum;
	}
	public void setGoodNum(int goodNum) {
		this.goodNum = goodNum;
	}
	public Date getDateTime() {
		return dateTime;
	}
	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}
	@Override
	public String toString() {
		return "kuguan_goodlog [wareHouseId=" + wareHouseId + ", goodId=" + goodId + ", goodNum=" + goodNum
				+ ", dateTime=" + dateTime + "]";
	}
	
}
