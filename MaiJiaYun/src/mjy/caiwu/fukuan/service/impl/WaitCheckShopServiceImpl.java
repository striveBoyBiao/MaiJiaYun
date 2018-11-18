package mjy.caiwu.fukuan.service.impl;
import java.util.List;
import mjy.caiwu.fukuan.beans.WaitCheckShopPO;
import mjy.caiwu.fukuan.dao.WaitCheckShopDao;
import mjy.caiwu.fukuan.service.WaitCheckShopService;
/**
 * 商品
 * @author student
 *
 */
public class WaitCheckShopServiceImpl implements WaitCheckShopService {
	//通过注入获取
	private WaitCheckShopDao wcsDao;
	public void setWcsDao(WaitCheckShopDao wcsDao) {
		this.wcsDao = wcsDao;
	}
	/**
	 *获取所有数据
	 */
	@Override
	public List<WaitCheckShopPO> query(String code) {
		return wcsDao.query(code);
	}

}
