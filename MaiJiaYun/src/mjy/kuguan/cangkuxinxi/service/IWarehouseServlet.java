package mjy.kuguan.cangkuxinxi.service;

import java.util.List;

import mjy.kuguan.cangkuxinxi.vo.WarehouseInfoVO;

/*
 * �ֿ�
 */
public interface IWarehouseServlet {
	
	//��Ӳֿ���Ϣ
	boolean saveWarehouseInfo(WarehouseInfoVO warehouseInfoVO);
	
	//ɾ���ֿ���Ϣ
	public boolean removeWarehouseInfo(int warehouseId);
	
	//�޸Ĳֿ���Ϣ
	boolean updateWarehouseInfo(int warehouseId,String warehouseName);
	
	//��ѯ�ֿ���Ϣ
	public List<WarehouseInfoVO> queryWarehouseInfo();

}
