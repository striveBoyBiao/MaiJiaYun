package mjy.kuguan.cangkuxinxi.po;

public class ReservoirAndLocationPO {
	private int wareHouseId;
	private int reservoirId;
	private int locationId;

	public ReservoirAndLocationPO(int wareHouseId) {
		super();
		this.wareHouseId = wareHouseId;
	}

	public ReservoirAndLocationPO(int wareHouseId, int reservoirId, int locationId) {
		super();
		this.wareHouseId = wareHouseId;
		this.reservoirId = reservoirId;
		this.locationId = locationId;
	}

	public int getWareHouseId() {
		return wareHouseId;
	}

	public void setWareHouseId(int wareHouseId) {
		this.wareHouseId = wareHouseId;
	}

	public int getReservoirId() {
		return reservoirId;
	}

	public void setReservoirId(int reservoirId) {
		this.reservoirId = reservoirId;
	}

	public int getLocationId() {
		return locationId;
	}

	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}

}
