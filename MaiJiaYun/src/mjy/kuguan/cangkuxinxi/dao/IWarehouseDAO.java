package mjy.kuguan.cangkuxinxi.dao;

import java.util.List;

import mjy.kuguan.cangkuxinxi.vo.WarehouseInfoVO;

/*
 * ²Ö¿â
 */
public interface IWarehouseDAO {

	//Ìí¼Ó²Ö¿âÐÅÏ¢
	boolean saveWarehouseInfo(WarehouseInfoVO warehouseInfoVO);
	
	//É¾³ý²Ö¿âÐÅÏ¢
	boolean removeWarehouseInfo(int warehouseId);
	
	//ÐÞ¸Ä²Ö¿âÐÅÏ¢
	boolean updateWarehouseInfo(int warehouseId,String warehouseName);

	//²éÑ¯²Ö¿âÐÅÏ¢
	public List<WarehouseInfoVO> queryWarehouseInfo();

}
