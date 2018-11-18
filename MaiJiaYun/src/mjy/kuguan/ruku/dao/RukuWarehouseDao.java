package mjy.kuguan.ruku.dao;

import java.util.List;
/**
 * 入库单用仓库扩展Dao
 * @author student
 *
 */
public interface RukuWarehouseDao {
	/**
	 * 依据仓库名查找对应仓库ID
	 * @param warehouseName
	 * @return
	 */
	public List<Integer> getSelectIdByName(String warehouseName);
}
