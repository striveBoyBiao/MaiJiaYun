package mjy.caigou.vo;

public class KCCBVO {
	
	private int warehouseId;
	public int getWarehouseId() {
		return warehouseId;
	}
	public void setWarehouseId(int warehouseId) {
		this.warehouseId = warehouseId;
	}

	private int goodId;				 //商 品货号
	private String sku;				 //sku
	private String goodName;		 //商品名称
	private String goodProperty;     //属性
	private String wareHouseName;	 //仓库名称
	private int goodCount;       //商品库存总量
	private Double goodInventoryCost;//商品库存成本
	private String goodPicture;      //商品图片
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
	public String getGoodProperty() {
		return goodProperty;
	}
	public void setGoodProperty(String goodProperty) {
		this.goodProperty = goodProperty;
	}
	public String getWareHouseName() {
		return wareHouseName;
	}
	public void setWareHouseName(String wareHouseName) {
		this.wareHouseName = wareHouseName;
	}
	
	public int getGoodCount() {
		return goodCount;
	}
	public void setGoodCount(int goodCount) {
		this.goodCount = goodCount;
	}
	public Double getGoodInventoryCost() {
		return goodInventoryCost;
	}
	public void setGoodInventoryCost(Double goodInventoryCost) {
		this.goodInventoryCost = goodInventoryCost;
	}
	public String getGoodPicture() {
		return goodPicture;
	}
	public void setGoodPicture(String goodPicture) {
		this.goodPicture = goodPicture;
	}

	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		KCCBVO kccbvo=(KCCBVO) obj;
		return this.sku.equals(kccbvo.getSku());
	}

}
