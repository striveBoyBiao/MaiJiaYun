package mjy.kuguan.ruku.service;

import java.util.List;

import mjy.kuguan.ruku.po.WanchengPO;





public interface WanchengService {
	//������ⵥ��ţ���ص��ݺţ��Ƶ��˲�ѯ
	List<WanchengPO> listBy(int wanchengBossId,String temp,int pageNumber,int pageSize);
	//���ݲ�ѯ������ѯ������
	public int getCount(int wanchengBossId);
}
