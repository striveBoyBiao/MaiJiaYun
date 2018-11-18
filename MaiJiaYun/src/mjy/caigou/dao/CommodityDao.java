package mjy.caigou.dao;

import java.util.List;

import mjy.caigou.vo.GoodsVO;
/**
 * ÆÕÍ¨ÔöÉ¾¸Ä
 * @author student
 *
 */
public interface CommodityDao {
	public void updateStore(int goodid,int store);
	public List<GoodsVO> queryAllGoods(int userId);

}
