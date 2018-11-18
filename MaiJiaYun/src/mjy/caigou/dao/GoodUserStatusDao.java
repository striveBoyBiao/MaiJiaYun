package mjy.caigou.dao;

import java.util.List;

import mjy.caigou.beans.PageInfo;
import mjy.caigou.vo.GoodUserStatusVO;

public interface GoodUserStatusDao {
	public List<Integer> getGoodIds(int userId);//�õ���ǰ�û���������Ʒid
	
	public int getCount(int userId);//�õ���ǰ�û�����Ʒ����
	
	
	public void updateGoodsStatus(int goodId,int userId);//�޸���Ʒ״̬
	public void addGoodUser(GoodUserStatusVO gusvo);//������Ʒ�û�
	
	public String getGoodNameById(int goodId,int userId);//ͨ��goodId�õ���Ʒ���
	public void updateGoodNameById(int goodId,String updateVal,int userId);//ͨ��goodId�޸���Ʒ���

	public List<Integer> queryGoodsLikeName(GoodUserStatusVO goodUserstatusVO);//ͨ�����ģ���ѯ��Ʒ�б�
	public int getNameCount(GoodUserStatusVO goodUserStatusVO);
	//ͨ��goodId����GoodUserStatus��
		public void updateGoodUserStatus(String goodId,GoodUserStatusVO gusvo);

		public int queryLengthLikeName(int userId, String name);
}
