package mjy.caigou.vo;

public class GoodUserStatusVO {
	private Integer goodId;
	private Integer userId;
	private String isUse;
	private String goodName;
	private Integer rowStart;//ÆðÊ¼Î»ÖÃ
	
	public Integer getGoodId() {
		return goodId;
	}
	public void setGoodId(Integer goodId) {
		this.goodId = goodId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getIsUse() {
		return isUse;
	}
	public void setIsUse(String isUse) {
		this.isUse = isUse;
	}
	@Override
	public String toString() {
		return "GoodUserStatusVO [goodId=" + goodId + ", userId=" + userId + ", isUse=" + isUse + "]";
	}
	public String getGoodName() {
		return goodName;
	}
	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}
	public Integer getRowStart() {
		return rowStart;
	}
	public void setRowStart(Integer rowStart) {
		this.rowStart = rowStart;
	}
	
	
}
