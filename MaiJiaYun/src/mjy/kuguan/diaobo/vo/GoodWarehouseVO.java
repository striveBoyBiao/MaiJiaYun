package mjy.kuguan.diaobo.vo;

public class GoodWarehouseVO {
	private Integer goodId;//商品编号
	private Integer warehouseId;//仓库编号
	private Integer goodCount;//该仓库编号下的商品库存
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
	public Integer getGoodCount() {
		return goodCount;
	}
	public void setGoodCount(Integer goodCount) {
		this.goodCount = goodCount;
	}
	
	@Override
	public String toString() {
		return "GoodWarehouseVO [goodId=" + goodId + ", warehouseId=" + warehouseId + ", goodCount=" + goodCount + "]";
	}
	
}
