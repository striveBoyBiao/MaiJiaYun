package mjy.caigou.po;

/**
 * ����ʼ����������ø���PO  
 * @author �ھ�С����Ա�ſ�
 *
 */

public class KuCunCSHGoods2PO {


	private int goodId;   //caigou_goodwarehouse�е�goodId   ��Ʒid
	private int goodCount;//caigou_goodwarehouse�е�goodCount  ���
	
	
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
