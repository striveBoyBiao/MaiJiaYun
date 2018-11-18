package mjy.caigou.dao;

import java.util.List;

import mjy.caigou.vo.ShopVO;

/**
 * 
 * @author student
 *
 */
public interface ShopDao {

	public List<ShopVO> getShop(int userId);
	public String getShopNamesById(int shopId);

}
