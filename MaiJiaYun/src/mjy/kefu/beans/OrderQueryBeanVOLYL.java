package mjy.kefu.beans;

import mjy.login.beans.vo.UserInfoVO;

public class OrderQueryBeanVOLYL {
	private String eShopName;
	private String buyerMemo;
	private String sellerMemo;
	private String receiverAddress;
	private String expressCompanyNameExpressCode;
	private String expressCompanyName;
	private String skuTotalQuantity;
	private String currentPageSize;
	private String currentPageNum;
	//文本搜索
	private String searchText;
	
	//用户ID
	private int userId;
	//状态
	private String status;
	public String geteShopName() {
		return eShopName;
	}
	public void seteShopName(String eShopName) {
		this.eShopName = eShopName;
	}
	public String getBuyerMemo() {
		return buyerMemo;
	}
	public void setBuyerMemo(String buyerMemo) {
		this.buyerMemo = buyerMemo;
	}
	public String getSellerMemo() {
		return sellerMemo;
	}
	public void setSellerMemo(String sellerMemo) {
		this.sellerMemo = sellerMemo;
	}
	public String getReceiverAddress() {
		return receiverAddress;
	}
	public void setReceiverAddress(String receiverAddress) {
		this.receiverAddress = receiverAddress;
	}
	public String getExpressCompanyNameExpressCode() {
		return expressCompanyNameExpressCode;
	}
	public void setExpressCompanyNameExpressCode(String expressCompanyNameExpressCode) {
		this.expressCompanyNameExpressCode = expressCompanyNameExpressCode;
	}
	public String getExpressCompanyName() {
		return expressCompanyName;
	}
	public void setExpressCompanyName(String expressCompanyName) {
		this.expressCompanyName = expressCompanyName;
	}
	public String getSkuTotalQuantity() {
		return skuTotalQuantity;
	}
	public void setSkuTotalQuantity(String skuTotalQuantity) {
		this.skuTotalQuantity = skuTotalQuantity;
	}
	public String getCurrentPageSize() {
		return currentPageSize;
	}
	public void setCurrentPageSize(String currentPageSize) {
		this.currentPageSize = currentPageSize;
	}
	public String getCurrentPageNum() {
		return currentPageNum;
	}
	public void setCurrentPageNum(String currentPageNum) {
		this.currentPageNum = currentPageNum;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
