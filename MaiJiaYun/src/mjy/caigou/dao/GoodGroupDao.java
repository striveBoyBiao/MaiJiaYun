package mjy.caigou.dao;

import java.util.List;

import mjy.caigou.vo.GoodGroupVO;

public interface GoodGroupDao {
	public List<GoodGroupVO> QueryGoodGroupName();//��ѯ��Ʒ���������Ƽ���
	
	public void addGoodGroup(String GroupName);//�����Ʒ����
	
	public String  getNameById(int groupId);//ͨ��id����Ʒ��������
	
}
