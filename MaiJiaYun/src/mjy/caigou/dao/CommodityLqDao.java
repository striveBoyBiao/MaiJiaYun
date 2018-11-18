package mjy.caigou.dao;

import java.util.List;

import mjy.caigou.po.GoodsPO;
import mjy.caigou.vo.GoodsVO;

/**
 * Ä£ºý²éÑ¯
 * @author student
 *
 */
public interface CommodityLqDao {
	
	public List<GoodsVO> listBy(GoodsPO goodsPO);

}
