package mjy.caigou.vo;

/**
 * 仓库的VO
 * @author 第九小组组员 张俊
 *
 */


public class WarehouseVO {

	private Integer wareHouseId;
	private String wareHouseName;
	private String wareHouseStatus;
	private String wareHouseType;
	private String wareHouseInfo;
	

	
	


	
	public Integer getWareHouseId() {
		return wareHouseId;
	}
	public void setWareHouseId(Integer wareHouseId) {
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
	
	@Override
	public String toString() {
		return "WarehouseVO [wareHouseId=" + wareHouseId + ", wareHouseName=" + wareHouseName + ", wareHouseStatus="
				+ wareHouseStatus + ", wareHouseType=" + wareHouseType + ", wareHouseInfo=" + wareHouseInfo + "]";
	}
	
	

	
}
