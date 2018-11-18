package mjy.caigou.vo;

public class GoodWarehouseVO {
private Integer goodId;//商品货号
private Integer warehouseId;//仓库id
private String warehouseName;//仓库名称
private int goodCount;//商品数量
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
