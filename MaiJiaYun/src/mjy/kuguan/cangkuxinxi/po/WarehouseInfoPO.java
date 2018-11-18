package mjy.kuguan.cangkuxinxi.po;

/*
 * 仓库信息
 */
public class WarehouseInfoPO {
	private int warehouseId;
	private String warehouseName;
	private String warehouseType; //仓库类型：自有仓库或奇门仓库
	private String warehouseStatus;  //仓库状态：空闲或使用
	private int goodCount; //商品数量-->借此判断仓库状态
	public int getWarehouseId() {
		return warehouseId;
	}
	public void setWarehouseId(int warehouseId) {
		this.warehouseId = warehouseId;
	}
	public String getWarehouseName() {
		return warehouseName;
	}
	public void setWarehouseName(String warehouseName) {
		this.warehouseName = warehouseName;
	}
	public String getWarehouseType() {
		return warehouseType;
	}
	public void setWarehouseType(String warehouseType) {
		this.warehouseType = warehouseType;
	}
	public String getWarehouseStatus() {
		return warehouseStatus;
	}
	public void setWarehouseStatus(String warehouseStatus) {
		this.warehouseStatus = warehouseStatus;
	}
	public int getGoodCount() {
		return goodCount;
	}
	public void setGoodCount(int i) {
		this.goodCount = i;
	}
}
