package mjy.caigou.po;

/**
 * 库存初始化界面的商品
 * @author 第九小组组员张俊
 *
 */

public class KuCunCSHGoodsPO {
	private String sku;//sku编码（caigou_goods表）
	private String goodName;//商品名称（caigou_goods表）
	private int goodId;//商品货号（caigou_goods表）
	private int goodCount;//库存（caigou_goodwarehouse表）
	
	public String getSku() {
		return sku;
	}
	public void setSku(String sku) {
		this.sku = sku;
	}
	public String getGoodName() {
		return goodName;
	}
	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}
	public int getGoodId() {
		return goodId;
	}
	public void setGoodId(int goodId) {
		this.goodId = goodId;
	}
	public int getGoodCount() {
		return goodCount;
	}
	public void setGoodCount(int goodCount) {
		this.goodCount = goodCount;
	}
	
	@Override
	public String toString() {
		return "KuCunCSHGoodsPO [sku编码=" + sku + ", 商品名称=" + goodName + ", 商品货号=" + goodId + ", 库存="
				+ goodCount + "]";
	}
	
	
	
	
	
}
