package mjy.kuguan.cangkuxinxi.po;

/*
 * ø‚«¯–≈œ¢
 */
public class ReservoirInfoPO {
	private int warehouseId;
	private int reservoirId;
	private String reservoirName;

	public ReservoirInfoPO(int warehouseId) {
		super();
		this.warehouseId = warehouseId;
	}
	public ReservoirInfoPO(int warehouseId, int reservoirId) {
		super();
		this.warehouseId = warehouseId;
		this.reservoirId = reservoirId;
	}
	public ReservoirInfoPO() {
		super();
	}
	public int getWarehouseId() {
		return warehouseId;
	}
	public void setWarehouseId(int warehouseId) {
		this.warehouseId = warehouseId;
	}
	public int getReservoirId() {
		return reservoirId;
	}
	public void setReservoirId(int reservoirId) {
		this.reservoirId = reservoirId;
	}
	public String getReservoirName() {
		return reservoirName;
	}
	public void setReservoirName(String reservoirName) {
		this.reservoirName = reservoirName;
	}
	
}
