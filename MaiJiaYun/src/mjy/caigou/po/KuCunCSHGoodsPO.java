package mjy.caigou.po;

/**
 * ����ʼ���������Ʒ
 * @author �ھ�С����Ա�ſ�
 *
 */

public class KuCunCSHGoodsPO {
	private String sku;//sku���루caigou_goods��
	private String goodName;//��Ʒ���ƣ�caigou_goods��
	private int goodId;//��Ʒ���ţ�caigou_goods��
	private int goodCount;//��棨caigou_goodwarehouse��
	
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
		return "KuCunCSHGoodsPO [sku����=" + sku + ", ��Ʒ����=" + goodName + ", ��Ʒ����=" + goodId + ", ���="
				+ goodCount + "]";
	}
	
	
	
	
	
}
