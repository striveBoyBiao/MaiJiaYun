package mjy.caiwu.kucunchengben.vo;

/*
 *  `wareHouseId` int(11) NOT NULL,
  `wareHouseName` varchar(255) DEFAULT NULL,
  `wareHouseStatus` varchar(255) DEFAULT NULL,
  `wareHouseType` varchar(255) DEFAULT NULL,
  `wareHouseInfo` varchar(255) DEFAULT NULL,
 */
public class Caigou_warehouse {
	private int wareHouseId;
	private String wareHouseName;
	private String wareHouseStatus;
	private String wareHouseType;
	private String wareHouseInfo;
	private int userId;
	private Integer wareHouseBoolean;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getWareHouseId() {
		return wareHouseId;
	}

	public void setWareHouseId(int wareHouseId) {
		this.wareHouseId = wareHouseId;
	}

	public String getWareHouseName() {
		return wareHouseName;
	}

	public void setWareHouseName(String wareHouseName) {
		this.wareHouseName = wareHouseName;
	}

	public String getWareHouseStatus() {
		return wareHouseStatus;
	}

	public void setWareHouseStatus(String wareHouseStatus) {
		this.wareHouseStatus = wareHouseStatus;
	}

	public String getWareHouseType() {
		return wareHouseType;
	}

	public void setWareHouseType(String wareHouseType) {
		this.wareHouseType = wareHouseType;
	}

	public String getWareHouseInfo() {
		return wareHouseInfo;
	}

	public void setWareHouseInfo(String wareHouseInfo) {
		this.wareHouseInfo = wareHouseInfo;
	}

	public int getWareHouseBoolean() {
		return wareHouseBoolean;
	}

	public void setWareHouseBoolean(int wareHouseBoolean) {
		this.wareHouseBoolean = wareHouseBoolean;
	}

	@Override
	public String toString() {
		return "Caigou_warehouse [wareHouseId=" + wareHouseId + ", wareHouseName=" + wareHouseName
				+ ", wareHouseStatus=" + wareHouseStatus + ", wareHouseType=" + wareHouseType + ", wareHouseInfo="
				+ wareHouseInfo + ", userId=" + userId + ", wareHouseBoolean=" + wareHouseBoolean + "]";
	}

}
