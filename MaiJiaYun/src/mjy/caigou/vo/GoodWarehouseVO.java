package mjy.caigou.vo;

public class GoodWarehouseVO {
private Integer goodId;//��Ʒ����
private Integer warehouseId;//�ֿ�id
private String warehouseName;//�ֿ�����
private int goodCount;//��Ʒ����
public Integer getGoodId() {
	return goodId;
}
public void setGoodId(Integer goodId) {
	this.goodId = goodId;
}
public Integer getWarehouseId() {
	return warehouseId;
}
public void setWarehouseId(Integer warehouseId) {
	this.warehouseId = warehouseId;
}
public int getGoodCount() {
	return goodCount;
}
public void setGoodCount(int goodCount) {
	this.goodCount = goodCount;
}
@Override
public String toString() {
	return "GoodwarehouseVO [goodId=" + goodId + ", warehouseId=" + warehouseId + ", goodCount=" + goodCount + "]";
}
public String getWarehouseName() {
	return warehouseName;
}
public void setWarehouseName(String warehouseName) {
	this.warehouseName = warehouseName;
}

}
