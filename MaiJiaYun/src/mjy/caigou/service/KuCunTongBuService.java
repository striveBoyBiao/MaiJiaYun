package mjy.caigou.service;

import java.util.List;

import mjy.caigou.po.GoodsPO;
import mjy.caigou.vo.GoodsVO;

public interface KuCunTongBuService {
	public void updateStore(int goodid,int store);//����������
	public List<GoodsVO> queryAllGoods(int userId);//��Ʒ�嵥
	public List<GoodsVO> listBy(GoodsPO goodsPO);//������ѯ

}
