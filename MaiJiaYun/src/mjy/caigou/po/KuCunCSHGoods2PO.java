package mjy.caigou.po;

/**
 * 库存初始化界面的所用辅助PO  
 * @author 第九小组组员张俊
 *
 */

public class KuCunCSHGoods2PO {


	private int goodId;   //caigou_goodwarehouse中的goodId   商品id
	private int goodCount;//caigou_goodwarehouse中的goodCount  库存
	
	
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
		return "KuCunCSHGoods2PO [goodId=" + goodId + ", goodCount=" + goodCount + "]";
	}
	
	
	
}
