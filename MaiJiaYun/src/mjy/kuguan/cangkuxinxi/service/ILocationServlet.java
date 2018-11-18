package mjy.kuguan.cangkuxinxi.service;

import java.util.List;

import mjy.kuguan.cangkuxinxi.vo.LocationInfoVO;

/*
 * ��λ
 */
public interface ILocationServlet {
	
	//��ӿ�λ��Ϣ
	public boolean saveLocationDao(LocationInfoVO location);

	//ɾ���ֿ���Ϣ
	boolean removeLocationInfo(int locationId);
	
	//�޸Ĳֿ���Ϣ
	boolean updateLocationInfo(int locationId,String locationName);
	
	//��ѯ��λ��Ϣ
	public List<LocationInfoVO> queryLocationInfo(int reservoirId);

}
