package mjy.caigou.dao;

import java.util.List;

import mjy.caigou.vo.GoodsVO;
/**
 * ��ͨ��ɾ��
 * @author student
 *
 */
public interface CommodityDao {
	public void updateStore(int goodid,int store);
	public List<GoodsVO> queryAllGoods(int userId);

}
