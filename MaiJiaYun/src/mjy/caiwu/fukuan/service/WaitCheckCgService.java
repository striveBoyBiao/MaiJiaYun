package mjy.caiwu.fukuan.service;
import java.util.List;
import mjy.caiwu.fukuan.beans.WaitCheckCgPO;
/**
 * 采购
 * @author student
 *
 */
public interface WaitCheckCgService {

	public abstract List<WaitCheckCgPO> query(String code);//获取所有数据
}
