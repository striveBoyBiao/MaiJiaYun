package mjy.caiwu.fukuan.service.impl;
import java.util.List;
import mjy.caiwu.fukuan.beans.WaitCheckCgPO;
import mjy.caiwu.fukuan.dao.WaitCheckCgDao;
import mjy.caiwu.fukuan.service.WaitCheckCgService;
/**
 * 采购
 * @author student
 *
 */
public class WaitCheckCgServiceImpl implements WaitCheckCgService {
	//通过注入获取
	private WaitCheckCgDao wccDao;
	public void setWccDao(WaitCheckCgDao wccDao) {
		this.wccDao = wccDao;
	}
	/**
	 *获取所有数据
	 */
	@Override
	public List<WaitCheckCgPO> query(String code) {
		
		return wccDao.query(code);
	}

}
