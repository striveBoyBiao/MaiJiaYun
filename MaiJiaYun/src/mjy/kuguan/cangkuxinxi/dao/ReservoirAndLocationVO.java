package mjy.kuguan.cangkuxinxi.dao;

public class ReservoirAndLocationVO {

	private int wareHouseId;
	private int reservoirId;
	private String reservoirName;
	private String locationName;
	private int locationId;

	public ReservoirAndLocationVO() {
		super();
	}

	public ReservoirAndLocationVO(int wareHouseId) {
		super();
		this.wareHouseId = wareHouseId;
	}

	public ReservoirAndLocationVO(int wareHouseId, int reservoirId, String reservoirName, String locationName,
			int locationId) {
		super();
		this.wareHouseId = wareHouseId;
		this.reservoirId = reservoirId;
		this.reservoirName = reservoirName;
		this.locationName = locationName;
		this.locationId = locationId;
	}

	public int getWareHouseId() {
		return wareHouseId;
	}

	public void setWareHouseId(int warehouseId) {
		this.wareHouseId = warehouseId;
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

	public String getLocationName() {
		return locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}

	public int getLocationId() {
		return locationId;
	}

	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}

}
