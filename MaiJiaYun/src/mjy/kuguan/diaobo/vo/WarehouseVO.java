package mjy.kuguan.diaobo.vo;
/**
 * 仓库表数据信息封装
 * @author student
 *
 */


public class WarehouseVO {

	private Integer wareHouseId;
	private String wareHouseName;
	private String wareHouseStatus;
	private String wareHouseType;
	private String wareHouseInfo;
	private Integer wareHouseBoolean;
	private Integer userId;
	

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
	
	
	
	public Integer getWareHouseBoolean() {
		return wareHouseBoolean;
	}
	public void setWareHouseBoolean(Integer wareHouseBoolean) {
		this.wareHouseBoolean = wareHouseBoolean;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	
	@Override
	public String toString() {
		return "仓库 [wareHouseId=" + wareHouseId + ", wareHouseName=" + wareHouseName + ", wareHouseStatus="
				+ wareHouseStatus + ", wareHouseType=" + wareHouseType + ", wareHouseInfo=" + wareHouseInfo
				+ ", wareHouseBoolean=" + wareHouseBoolean + ", userId=" + userId + "]";
	}
		
}
