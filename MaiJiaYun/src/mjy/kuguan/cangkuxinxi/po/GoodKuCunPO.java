package mjy.kuguan.cangkuxinxi.po;

public class GoodKuCunPO {

	private int wareHouseId;
	private String sku;
	private String goodName;

	public GoodKuCunPO() {
		super();
	}

	public GoodKuCunPO(String sku, String goodName) {
		super();
		this.sku = sku;
		this.goodName = goodName;
	}

	public GoodKuCunPO(int wareHouseId, String sku, String goodName) {
		super();
		this.wareHouseId = wareHouseId;
		this.sku = sku;
		this.goodName = goodName;
	}

	public int getWareHouseId() {
		return wareHouseId;
	}

	public void setWareHouseId(int wareHouseId) {
		this.wareHouseId = wareHouseId;
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

}
