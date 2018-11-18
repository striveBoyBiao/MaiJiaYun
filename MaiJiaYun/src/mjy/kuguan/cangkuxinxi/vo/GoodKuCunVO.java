package mjy.kuguan.cangkuxinxi.vo;

public class GoodKuCunVO {
	private int goodId;
	private String sku;
	private String goodName;
	private int userId;
	private int goodCount;
	private String goodAttribute;
	private int wareHouseId;
	private String wareHouseName;

	public GoodKuCunVO() {
		super();
	}

	public GoodKuCunVO(int goodId, String sku, String goodName, String goodAttribute, int wareHouseId,
			String wareHouseName) {
		super();
		this.goodId = goodId;
		this.sku = sku;
		this.goodName = goodName;
		this.goodAttribute = goodAttribute;
		this.wareHouseId = wareHouseId;
		this.wareHouseName = wareHouseName;
	}

	public GoodKuCunVO(int goodId, String sku, String goodName, int userId, String goodAttribute, int goodCount,
			int wareHouseId, String wareHouseName) {
		super();
		this.goodId = goodId;
		this.sku = sku;
		this.goodName = goodName;
		this.userId = userId;
		this.goodAttribute = goodAttribute;
		this.goodCount = goodCount;
		this.wareHouseId = wareHouseId;
		this.wareHouseName = wareHouseName;
	}

	public int getGoodId() {
		return goodId;
	}

	public void setGoodId(int goodId) {
		this.goodId = goodId;
	}

	public String getSku() {
		return sku;
	}

	public void setSku(String sku) {
		this.sku = sku;
	}

	public String getGoodName() {
		return goodName;
	}

	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}

	public String getGoodAttribute() {
		return goodAttribute;
	}

	public void setGoodAttribute(String goodAttribute) {
		this.goodAttribute = goodAttribute;
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

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getGoodCount() {
		return goodCount;
	}

	public void setGoodCount(int goodCount) {
		this.goodCount = goodCount;
	}

}
