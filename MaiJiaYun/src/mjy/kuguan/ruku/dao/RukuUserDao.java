package mjy.kuguan.ruku.dao;

import java.util.List;
/**
 * 入库单查询用User扩展Dao
 * @author student
 *
 */
public interface RukuUserDao {
	/**
	 * 依据昵称模糊查询对应的userId列表
	 * @param userNickName
	 * @return
	 */
	public List<Integer> getSelectIdByName(String userNickName);
}
