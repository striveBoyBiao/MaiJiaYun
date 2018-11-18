package mjy.order.dao;

import java.util.List;

import mjy.order.bean.po.ShopPO;
import mjy.order.bean.vo.Shop;

public interface ShopDao {

	List<Shop> shopQuery(ShopPO shopPO);
}
