package mjy.caiwu.jichuziliao.dao;

import java.util.List;

import mjy.caiwu.jichuziliao.po.ShopPO;
import mjy.caiwu.jichuziliao.vo.FukuanzhVO;
import mjy.caiwu.jichuziliao.vo.ShopVO;

public interface FindShopDao {
	List<ShopVO> listBy(ShopPO params);
	List<ShopVO> listBy1(String param);
	void insertFK(FukuanzhVO fukuan);
}
