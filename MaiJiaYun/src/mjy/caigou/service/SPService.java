package mjy.caigou.service;

import java.util.List;

import mjy.caigou.beans.PageInfo;
import mjy.caigou.po.GoodsPO;

import mjy.caigou.vo.GoodGroupVO;
import mjy.caigou.vo.GoodUserStatusVO;
import mjy.caigou.vo.GoodsVO;


public interface SPService {
	public List<String> getGoodGroupName();//�õ���Ʒ������Ϣ

	public void addNodeName(String NodeName);//�����Ʒ������Ϣ
	
	public List<GoodsPO> getAllGoods(int userId);//�õ���Ʒ��Ϣ
	
	public List<GoodGroupVO> getGoodGroups();//�õ���Ʒ�������
	
	public int getGoodsNum(int userId);//�õ���Ʒ����Ŀ
	public int queryBySku(String sku); 
	public void addGood(GoodsVO good);//�����Ʒ

	public  void deleteGoodsInfo(int goodId,int userId);//ɾ����û��ĸ�id��Ʒ
	
	public void addGoodUser(GoodUserStatusVO gusvo);//������Ʒ�û�

	public void deleteAllGoods(int userId);

	public void updateGoodName(int updateGoodId, String updateVal, int userId);//�޸ĸ��û�����Ʒ���

	public List<GoodsPO> searchGoodsLikeName(GoodUserStatusVO goodUserstatusVO);//ͨ�����ģ���ѯ��Ʒ�б�

	
	//ͨ��sku������Ʒ�Ŀ��ɱ�
		public void updateGoodInventCost(String sku,double goodInventCost );
	

		//ͨ��sku������Ʒ��
		public void  updateGoods(String sku,GoodsVO goods);
		
		//ͨ��goodId����GoodUserStatus��
		public void updateGoodUserStatus(String goodId,GoodUserStatusVO gusvo);

		public PageInfo<GoodsPO> listByPage(GoodUserStatusVO goodUserStatusVO,PageInfo<GoodsPO> page);//�õ���ҳ���

		public int getNameLikeLength(int userId, String searchInfo);
		


}
