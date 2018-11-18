package mjy.caiwu.kucunchengben.vo;

/**
 * ¿â´æ³É±¾
 */
public class Caiwu_kucuncb {
	private int goodId;
	private int wareHouseId;
	private double kucunCost;
	public int getGoodId() {
		return goodId;
	}
	public void setGoodId(int goodId) {
		this.goodId = goodId;
	}
	public int getWareHouseId() {
		return wareHouseId;
	}
	public void setWareHouseId(int wareHouseId) {
		this.wareHouseId = wareHouseId;
	}
	public double getKucunCost() {
		return kucunCost;
	}
	public void setKucunCost(double kucunCost) {
		this.kucunCost = kucunCost;
	}
	@Override
	public String toString() {
		return "Caiwu_kucuncb [goodId=" + goodId + ", wareHouseId=" + wareHouseId + ", kucunCost=" + kucunCost + "]";
	}
	
}
