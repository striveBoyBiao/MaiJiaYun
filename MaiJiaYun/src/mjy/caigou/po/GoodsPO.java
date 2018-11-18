package mjy.caigou.po;

import java.util.List;

import mjy.caigou.vo.GoodWarehouseVO;

public class GoodsPO {
	private int goodId;//商品货号
	private String sku;//sku
	private int goodGroupId;//商品分类
	private String goodGroupName;//商品分类名称
	private int goodWarehouseId ;//商品仓库id
	private String goodName;//商品名称
	private Double goodPrice;//商品价格
	private Double goodWeight;//商品重量
	private int goodRepertory;//商品库存总量
	private List<GoodWarehouseVO> goodwarehouse; ;//商品仓库中间表对象集合
	
	private int goodVirtualInventories;//商品虚拟库存
	private String goodWarehouseName; //商品仓库名称
	private Double goodInventoryCost;//商品库存成本
	private String goodPicture;//商品图片
	
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
	public int getGoodGroupId() {
		return goodGroupId;
	}
	public void setGoodGroupId(int goodGroupId) {
		this.goodGroupId = goodGroupId;
	}
	public int getGoodWarehouseId() {
		return goodWarehouseId;
	}
	public void setGoodWarehouseId(int goodWarehouseId) {
		this.goodWarehouseId = goodWarehouseId;
	}
	public String getGoodName() {
		return goodName;
	}
	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}
	public Double getGoodPrice() {
		return goodPrice;
	}
	public void setGoodPrice(Double goodPrice) {
		this.goodPrice = goodPrice;
	}
	public Double getGoodWeight() {
		return goodWeight;
	}
	public void setGoodWeight(Double goodWeight) {
		this.goodWeight = goodWeight;
	}
	public int getGoodRepertory() {
		return goodRepertory;
	}
	public void setGoodRepertory(int goodRepertory) {
		this.goodRepertory = goodRepertory;
	}
	
	public int getGoodVirtualInventories() {
		return goodVirtualInventories;
	}
	public void setGoodVirtualInventories(int goodVirtualInventories) {
		this.goodVirtualInventories = goodVirtualInventories;
	}
	public String getGoodWarehouseName() {
		return goodWarehouseName;
	}
	public void setGoodWarehouseName(String goodWarehouseName) {
		this.goodWarehouseName = goodWarehouseName;
	}
	public List<GoodWarehouseVO> getGoodwarehouse() {
		return goodwarehouse;
	}
	public void setGoodwarehouse(List<GoodWarehouseVO> goodwarehouse) {
		this.goodwarehouse = goodwarehouse;
	}
	@Override
	public String toString() {
		return "GoodsPO [goodId=" + goodId + ", sku=" + sku + ", goodGroupId=" + goodGroupId + ", goodWarehouseId="
				+ goodWarehouseId + ", goodName=" + goodName + ", goodPrice=" + goodPrice + ", goodWeight=" + goodWeight
				+ ", goodRepertory=" + goodRepertory + ", goodwarehouse=" + goodwarehouse + ", goodVirtualInventories="
				+ goodVirtualInventories + ", goodWarehouseName=" + goodWarehouseName + ", goodInventoryCost="
				+ goodInventoryCost + ", goodPicture=" + goodPicture + "]";
	}
	public String getGoodGroupName() {
		return goodGroupName;
	}
	public void setGoodGroupName(String goodGroupName) {
		this.goodGroupName = goodGroupName;
	}
	
	
	
}
