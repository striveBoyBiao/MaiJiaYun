package mjy.kuguan.cangkuxinxi.po;

/*
 * �ֿ���Ϣ
 */
public class WarehouseInfoPO {
	private int warehouseId;
	private String warehouseName;
	private String warehouseType; //�ֿ����ͣ����вֿ�����Ųֿ�
	private String warehouseStatus;  //�ֿ�״̬�����л�ʹ��
	private int goodCount; //��Ʒ����-->����жϲֿ�״̬
	public int getWarehouseId() {
		return warehouseId;
	}
	public void setWarehouseId(int warehouseId) {
		this.warehouseId = warehouseId;
	}
	public String getWarehouseName() {
		return warehouseName;
	}
	public void setWarehouseName(String warehouseName) {
		this.warehouseName = warehouseName;
	}
	public String getWarehouseType() {
		return warehouseType;
	}
	public void setWarehouseType(String warehouseType) {
		this.warehouseType = warehouseType;
	}
	public String getWarehouseStatus() {
		return warehouseStatus;
	}
	public void setWarehouseStatus(String warehouseStatus) {
		this.warehouseStatus = warehouseStatus;
	}
	public int getGoodCount() {
		return goodCount;
	}
	public void setGoodCount(int i) {
		this.goodCount = i;
	}
}
