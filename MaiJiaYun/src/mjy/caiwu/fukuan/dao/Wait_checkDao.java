package mjy.caiwu.fukuan.dao;
import java.util.List;
import mjy.caiwu.fukuan.beans.FuKuanVo;
/**
 * 待财务审核
 * @author student
 *
 */
public interface Wait_checkDao {
	public abstract List<FuKuanVo> queryFk(List<Integer> allId);//从付款中查询数据
	public abstract List<FuKuanVo> queryCg(String purchaseCode);//从采购中查询数据
	public abstract void insert(List<FuKuanVo> waitCheck);//将数据插入到付款单中
	public abstract int queryCount(List<Integer> allId);//查询有多少条数据
	public abstract int queryCount(String str,List<Integer> allId);//模糊查询有多少条数据
	public abstract void update(String id);//修改付款单的状态为2
	public abstract void updataCgState(String id);//修改采购单的状态为3
	public abstract void delete(String id);//删除数据
	public abstract List<FuKuanVo> querySelect(String str,List<Integer> allId);//模糊查询数据
	public abstract List<Integer> queryfkzhBankId(int bossId);//获取银行卡ID
	public abstract void updataCaoGou(String id);//修改采购单的状态为1
	public abstract void updateTime(String str);//修改创建时间
	public abstract List<Integer> selectEmployeeBossID(int bossID);//找到所有ID
}
