package mjy.caigou.service;

import java.util.List;

import mjy.caigou.po.GoodsPO;
import mjy.caigou.vo.GoodsVO;

public interface KuCunTongBuService {
	public void updateStore(int goodid,int store);//更新虚拟库存
	public List<GoodsVO> queryAllGoods(int userId);//商品清单
	public List<GoodsVO> listBy(GoodsPO goodsPO);//条件查询

}
