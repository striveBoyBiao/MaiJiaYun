package mjy.caigou.vo;

public class GoodsVO {
private int goodId;//��Ʒ����
private String sku;//sku
private int goodGroupId;//��Ʒ����

private String goodName;//��Ʒ����
private Double goodPrice;//��Ʒ�۸�
private Double goodWeight;//��Ʒ����
private int goodRepertory;//��Ʒ�������

private int goodVirtualInventories;//��Ʒ������
private Double goodInventoryCost;//��Ʒ���ɱ�
private String goodPicture;//��ƷͼƬ




public int getGoodId() {
	return goodId;
}
public void setGoodId(int goodId) {
	this.goodId = goodId;
}
public String getSku() {
	return sku;
}
public void setSku(String sku) {
	this.sku = sku;
}
public int getGoodGroupId() {
	return goodGroupId;
}
public void setGoodGroupId(int goodGroupId) {
	this.goodGroupId = goodGroupId;
}

public String getGoodName() {
	return goodName;
}
public void setGoodName(String goodName) {
	this.goodName = goodName;
}
public Double getGoodPrice() {
	return goodPrice;
}
public void setGoodPrice(Double goodPrice) {
	this.goodPrice = goodPrice;
}
public Double getGoodWeight() {
	return goodWeight;
}
public void setGoodWeight(Double goodWeight) {
	this.goodWeight = goodWeight;
}
public int getGoodRepertory() {
	return goodRepertory;
}
public void setGoodRepertory(int goodRepertory) {
	this.goodRepertory = goodRepertory;
}


public int getGoodVirtualInventories() {
	return goodVirtualInventories;
}
public void setGoodVirtualInventories(int goodVirtualInventories) {
	this.goodVirtualInventories = goodVirtualInventories;
}
public Double getGoodInventoryCost() {
	return goodInventoryCost;
}
public void setGoodInventoryCost(Double goodInventoryCost) {
	this.goodInventoryCost = goodInventoryCost;
}
public String getGoodPicture() {
	return goodPicture;
}
public void setGoodPicture(String goodPicture) {
	this.goodPicture = goodPicture;
}
@Override
public String toString() {
	return "GoodsVO [goodId=" + goodId + ", sku=" + sku + ", goodGroupId=" + goodGroupId + ", goodName=" + goodName
			+ ", goodPrice=" + goodPrice + ", goodWeight=" + goodWeight + ", goodRepertory=" + goodRepertory
			+ ", goodVirtualInventories=" + goodVirtualInventories + ", goodInventoryCost=" + goodInventoryCost
			+ ", goodPicture=" + goodPicture + "]";
}



}
