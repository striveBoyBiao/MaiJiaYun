package mjy.caigou.dao;

import java.util.List;

import mjy.caigou.po.GoodsPO;
import mjy.caigou.vo.GoodsVO;

/**
 * ģ����ѯ
 * @author student
 *
 */
public interface CommodityLqDao {
	
	public List<GoodsVO> listBy(GoodsPO goodsPO);

}
