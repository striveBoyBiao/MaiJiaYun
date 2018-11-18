package mjy.kuguan.chukudan.po;

import java.util.List;


public class ChuKuDanPO {

	private int chukudanId;
	private String chukudanCode;
	private String chukuxiangguandanCode;
	private int chukuType;
	private String chukuCangku;
	private int chukuNum;
	private String chukuPeople;
	private int chukuState;
	private String chukudanTime;
	private String chukudanPeople;
	private int userId;
	
	private String cangkus;
	
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getChukudanId() {
		return chukudanId;
	}
	public void setChukudanId(int chukudanId) {
		this.chukudanId = chukudanId;
	}
	public String getChukudanCode() {
		return chukudanCode;
	}
	public void setChukudanCode(String chukudanCode) {
		this.chukudanCode = chukudanCode;
	}
	public String getChukuxiangguandanCode() {
		return chukuxiangguandanCode;
	}
	public void setChukuxiangguandanCode(String chukuxiangguandanCode) {
		this.chukuxiangguandanCode = chukuxiangguandanCode;
	}
	public int getChukuType() {
		return chukuType;
	}
	public void setChukuType(int chukuType) {
		this.chukuType = chukuType;
	}
	public String getChukuCangku() {
		return chukuCangku;
	}
	public void setChukuCangku(String chukuCangku) {
		this.chukuCangku = chukuCangku;
	}
	public int getChukuNum() {
		return chukuNum;
	}
	public void setChukuNum(int chukuNum) {
		this.chukuNum = chukuNum;
	}
	public String getChukuPeople() {
		return chukuPeople;
	}
	public void setChukuPeople(String chukuPeople) {
		this.chukuPeople = chukuPeople;
	}
	public int getChukuState() {
		return chukuState;
	}
	public void setChukuState(int chukuState) {
		this.chukuState = chukuState;
	}
	public String getChukudanTime() {
		return chukudanTime;
	}
	public void setChukudanTime(String chukudanTime) {
		this.chukudanTime = chukudanTime;
	}
	public String getChukudanPeople() {
		return chukudanPeople;
	}
	public void setChukudanPeople(String chukudanPeople) {
		this.chukudanPeople = chukudanPeople;
	}
	@Override
	public String toString() {
		return "ChuKuDanPO [chukudanId=" + chukudanId + ", chukudanCode=" + chukudanCode + ", chukuxiangguandanCode="
				+ chukuxiangguandanCode + ", chukuType=" + chukuType + ", chukuCangku=" + chukuCangku + ", chukuNum="
				+ chukuNum + ", chukuPeople=" + chukuPeople + ", chukuState=" + chukuState + ", chukudanTime="
				+ chukudanTime + ", chukudanPeople=" + chukudanPeople + ", userId=" + userId + "]";
	}
	public String getCangkus() {
		return cangkus;
	}
	public void setCangkus(String cangkus) {
		this.cangkus = cangkus;
	}
	

	
	
	
}
