package mjy.caigou.vo;

public class ShopGoodsVO {
	private String goodImage;
	private int goodId; 
	private String goodName;
	private double goodPrice;
	private double goodWeight;
	private int goodRepertory;
	private int shopId;
	private int isOnShelf;
	private int isCorrespond;
	
	
	public int getIsCorrespond() {
		return isCorrespond;
	}
	public void setIsCorrespond(int isCorrespond) {
		this.isCorrespond = isCorrespond;
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
}
