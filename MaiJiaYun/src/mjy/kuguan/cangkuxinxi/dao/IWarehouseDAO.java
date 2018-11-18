package mjy.kuguan.cangkuxinxi.dao;

import java.util.List;

import mjy.kuguan.cangkuxinxi.vo.WarehouseInfoVO;

/*
 * �ֿ�
 */
public interface IWarehouseDAO {

	//��Ӳֿ���Ϣ
	boolean saveWarehouseInfo(WarehouseInfoVO warehouseInfoVO);
	
	//ɾ���ֿ���Ϣ
	boolean removeWarehouseInfo(int warehouseId);
	
	//�޸Ĳֿ���Ϣ
	boolean updateWarehouseInfo(int warehouseId,String warehouseName);

	//��ѯ�ֿ���Ϣ
	public List<WarehouseInfoVO> queryWarehouseInfo();

}
