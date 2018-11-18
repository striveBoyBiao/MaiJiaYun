package mjy.caiwu.fukuan.dao;
import java.util.List;
import mjy.caiwu.fukuan.beans.WaitCheckShopPO;
/**
 * 商品
 * @author student
 *
 */
public interface WaitCheckShopDao {
	List<WaitCheckShopPO> query(String code);//获取所有数据
}
