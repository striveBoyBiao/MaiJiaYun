package mjy.kuguan.ruku.dao;

import java.util.List;

import mjy.kuguan.ruku.po.WanchengPO;






public interface WanchengDao {
	
	
	
	//��ⵥ��Ų�
	public List<WanchengPO> listByRkd(int wanchengBossId,String rkd,int pageNumber,int pageSize);
	//��ص��ݺŲ�ѯ
	public List<WanchengPO> listByDjh(int wanchengBossId,String djh,int pageNumber,int pageSize);
	//�Ƶ��˲�ѯ
	public List<WanchengPO> listByZdr(int wanchengBossId,String zdr,int pageNumber,int pageSize);
	//��������ѯ
	public int getTotalCount(int wanchengBossId);
	//���ݲɹ����Ų�ѯ�����
	

}
