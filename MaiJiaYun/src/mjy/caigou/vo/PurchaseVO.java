package mjy.caigou.vo;

import java.sql.Timestamp;
import java.util.List;

public class PurchaseVO {

		private int purchaseId;
		private String purchaseCode;
		private String supplierId;
		private int wareHouseId;
		private int purchaseNumber;
		private int storageQuantity;
		private int purchaseSum;
		private Timestamp creatTime;
		private int userId;
		private String remark;
		private String storageState;
		private String state;
		private String paymentState;
		private String operation;
		private String wareHouseName;
		private String userType;
		private String supplierCName;
		private List<PurchaseGoodVO>  purchaseGoodsVO;
		
		public Timestamp getCreatTime() {
			return creatTime;
		}
		public void setCreatTime(Timestamp creatTime) {
			this.creatTime = creatTime;
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

		public int getStorageQuantity() {
			return storageQuantity;
		}
		public void setStorageQuantity(int storageQuantity) {
			this.storageQuantity = storageQuantity;
		}
		public String getRemark() {
			return remark;
		}
		public void setRemark(String remark) {
			this.remark = remark;
		}
		public String getStorageState() {
			return storageState;
		}
		public void setStorageState(String storageState) {
			this.storageState = storageState;
		}
		public String getState() {
			return state;
		}
		public void setState(String state) {
			this.state = state;
		}
		public String getPaymentState() {
			return paymentState;
		}
		public void setPaymentState(String paymentState) {
			this.paymentState = paymentState;
		}
		
		public int getPurchaseId() {
			return purchaseId;
		}
		public void setPurchaseId(int purchaseId) {
			this.purchaseId = purchaseId;
		}
		public String getPurchaseCode() {
			return purchaseCode;
		}
		public void setPurchaseCode(String purchaseCode) {
			this.purchaseCode = purchaseCode;
		}
		
		public String getSupplierId() {
			return supplierId;
		}
		public void setSupplierId(String supplierId) {
			this.supplierId = supplierId;
		}
		public int getWareHouseId() {
			return wareHouseId;
		}
		public void setWareHouseId(int wareHouseId) {
			this.wareHouseId = wareHouseId;
		}
		public int getPurchaseNumber() {
			return purchaseNumber;
		}
		public void setPurchaseNumber(int purchaseNumber) {
			this.purchaseNumber = purchaseNumber;
		}
		
		public int getPurchaseSum() {
			return purchaseSum;
		}
		public void setPurchaseSum(int purchaseSum) {
			this.purchaseSum = purchaseSum;
		}
		
		
		public int getUserId() {
			return userId;
		}
		public void setUserId(int userId) {
			this.userId = userId;
		}
		
		public String getOperation() {
			return operation;
		}
		public void setOperation(String operation) {
			this.operation = operation;
		}
				
		public List<PurchaseGoodVO> getPurchaseGoodsVO() {
			return purchaseGoodsVO;
		}
		public void setPurchaseGoodsVO(List<PurchaseGoodVO> purchaseGoodsVO) {
			this.purchaseGoodsVO = purchaseGoodsVO;
		}
		@Override
		public String toString() {
			return "PurchaseVO [purchaseId=" + purchaseId + ", purchaseCode=" + purchaseCode + ", supplierId="
					+ supplierId + ", wareHouseId=" + wareHouseId + ", purchaseNumber=" + purchaseNumber
					+ ", storageQuantity=" + storageQuantity + ", purchaseSum=" + purchaseSum + ", creatTime="
					+ creatTime + ", documentMake=" + ", userId=" + userId + ", remark=" + remark
					+ ", storageState=" + storageState + ", state=" + state + ", paymentState=" + paymentState
					+ ", operation=" + operation + ", wareHouseName=" + wareHouseName + ", userType=" + userType
					+ ", supplierCName=" + supplierCName + "]";
		}
		
		
		
		
}
