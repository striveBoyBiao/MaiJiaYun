package mjy.caigou.dao;

import java.util.List;

import mjy.caigou.po.GoodsPO;
import mjy.caigou.vo.GoodUserStatusVO;
import mjy.caigou.vo.GoodsVO;



public interface GoodsDao {
	public List<GoodsVO> queryAllGoods();//��ѯ������Ʒ��Ϣ
	public List<GoodsVO> queryAllGoodsById(int userId);
	public int getCount();//�õ���Ʒ����Ŀ
	
	public void addGood(GoodsVO good);//����������Ʒ
	

	public void deleteGoodInfoById(int goodId);//ͨ��goodIdɾ��goods������Ϣ
	public GoodsVO queryGoodInfoById(int goodId);//ͨ��goodId��ѯgoods������Ϣ
	//ͨ��sku������Ʒ�Ŀ��ɱ�
	public void updateGoodInventCost(String sku,double goodInventCost );
	
	//ͨ��sku������Ʒ��
	public void  updateGoods(String sku,GoodsVO goods);
	
	
	public int queryBySku(String sku);
	
	public void goodRepertory(int goodId);

	public List<GoodsVO> listByGoodId(int goodId);

}
