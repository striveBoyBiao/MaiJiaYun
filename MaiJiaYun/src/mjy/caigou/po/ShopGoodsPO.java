package mjy.caigou.po;

public class ShopGoodsPO {
	private String goodImage;
	private int goodId; 
	private String goodName;
	private double goodPrice;
	private double goodWeight;
	private int goodRepertory;
	private int isImport;//是否导入
	private int isCorrespond;//是否已队应
	private int correspondGoodsId;//对应的商品号
	private int isOnShelf;//是否上架
	private int shopId;//店铺ID
	
	public int getShopId() {
		return shopId;
	}
	public void setShopId(int shopId) {
		this.shopId = shopId;
	}
	public int getIsOnShelf() {
		return isOnShelf;
	}
	public void setIsOnShelf(int isOnShelf) {
		this.isOnShelf = isOnShelf;
	}
	public String getGoodImage() {
		return goodImage;
	}
	public void setGoodImage(String goodImage) {
		this.goodImage = goodImage;
	}
	public int getGoodId() {
		return goodId;
	}
	public void setGoodId(int goodId) {
		this.goodId = goodId;
	}
	public String getGoodName() {
		return goodName;
	}
	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}
	public double getGoodPrice() {
		return goodPrice;
	}
	public void setGoodPrice(double goodPrice) {
		this.goodPrice = goodPrice;
	}
	public double getGoodWeight() {
		return goodWeight;
	}
	public void setGoodWeight(double goodWeight) {
		this.goodWeight = goodWeight;
	}
	public int getGoodRepertory() {
		return goodRepertory;
	}
	public void setGoodRepertory(int goodRepertory) {
		this.goodRepertory = goodRepertory;
	}
	public int getIsImport() {
		return isImport;
	}
	public void setIsImport(int isImport) {
		this.isImport = isImport;
	}
	public int getIsCorrespond() {
		return isCorrespond;
	}
	public void setIsCorrespond(int isCorrespond) {
		this.isCorrespond = isCorrespond;
	}
	public int getCorrespondGoodsId() {
		return correspondGoodsId;
	}
	public void setCorrespondGoodsId(int correspondGoodsId) {
		this.correspondGoodsId = correspondGoodsId;
	}
	
}
