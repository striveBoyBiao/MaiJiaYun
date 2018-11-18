package mjy.caiwu.fukuan.service;
import java.util.List;
import mjy.caiwu.fukuan.beans.WaitCheckShopPO;
/**
 * 商品
 * @author student
 *
 */
public interface WaitCheckShopService {
	List<WaitCheckShopPO> query(String code);//获取所有数据
}
