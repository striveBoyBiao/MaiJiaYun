package mjy.caigou.vo;

public class ReturnGoodsVO {
	// 采购退货单Id
	private Integer returnId;
	// 商品Id
	private Integer goodId;
	// 每种商品退货数量
	private Integer quantity;
	// 每种商品退货总额
	private Double price;

	public Integer getReturnId() {
		return returnId;
	}

	public void setReturnId(Integer returnId) {
		this.returnId = returnId;
	}

	public Integer getGoodId() {
		return goodId;
	}

	public void setGoodId(Integer goodId) {
		this.goodId = goodId;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

}
