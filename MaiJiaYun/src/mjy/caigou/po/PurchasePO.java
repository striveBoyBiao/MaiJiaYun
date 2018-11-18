package mjy.caigou.po;

public class PurchasePO {

		private String  purchaseCode;
		private Integer supplierId;
		private Integer wareHouseId;
		private Integer userId;
		private String state;
		private String wareHouseName;
		private String userType;
		private String supplierCName;
		private Integer goodId;
		private Integer rowStart;

		private String storageState;
		


	
	
	
		public String getStorageState() {
			return storageState;
		}
		public void setStorageState(String storageState) {
			this.storageState = storageState;
		}
		public String getPurchaseCode() {
			return purchaseCode;

		}
		private String queryUrl;
		
		
		
		public String getQueryUrl() {
			StringBuffer sb = new StringBuffer("");
			if( purchaseCode!= null &&  ! purchaseCode.equals("")){
				sb.append("& purchaseCode="+  purchaseCode);
			}
			
			return  sb.toString();
		}
		public void setQueryUrl(String queryUrl) {
			
		
			
			this.queryUrl = queryUrl;
		}
		
		public void setPurchaseCode(String purchaseCode) {
			this.purchaseCode = purchaseCode;
		}
		public Integer getSupplierId() {
			return supplierId;
		}
		public void setSupplierId(Integer supplierId) {
			this.supplierId = supplierId;
		}
		public Integer getWareHouseId() {
			return wareHouseId;
		}
		public void setWareHouseId(Integer wareHouseId) {
			this.wareHouseId = wareHouseId;
		}
		public Integer getUserId() {
			return userId;
		}
		public void setUserId(Integer userId) {
			this.userId = userId;
		}
		public String getState() {
			return state;
		}
		public void setState(String state) {
			this.state = state;
		}
		public String getWareHouseName() {
			return wareHouseName;
		}
		public void setWareHouseName(String wareHouseName) {
			this.wareHouseName = wareHouseName;
		}
		public String getUserType() {
			return userType;
		}
		public void setUserType(String userType) {
			this.userType = userType;
		}
		public String getSupplierCName() {
			return supplierCName;
		}
		public void setSupplierCName(String supplierCName) {
			this.supplierCName = supplierCName;
		}
		public Integer getGoodId() {
			return goodId;
		}
		public void setGoodId(Integer goodId) {
			this.goodId = goodId;
		}
		public Integer getRowStart() {
			return rowStart;
		}
		public void setRowStart(Integer rowStart) {
			this.rowStart = rowStart;
		}
		
		
		
		
		
		
		

	

}
