package mjy.kuguan.cangkuxinxi.dao;

import java.util.List;

import mjy.kuguan.cangkuxinxi.vo.ReservoirInfoVO;

/*
 * ����
 */
public interface IReservoirDAO {
	
	//���ӿ�����Ϣ
	boolean saveReservoirInfo(ReservoirInfoVO reservoir);
	
	//ɾ���ֿ���Ϣ
	boolean removeReservoirInfo(int reservoirId);
	
	//�޸Ĳֿ���Ϣ
	boolean updateReservoirInfo(int reservoirId,String reservoirName);
	
	//��ѯ������Ϣ
	public List<ReservoirInfoVO> queryReservoirInfo(int warehouseId);
	
}
