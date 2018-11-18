package mjy.order.dao;

import java.sql.ResultSet;
import java.util.List;

public interface RowMap<T> {
	/**
	 * 用于遍历结果集，不懂的可以看看BuyerDao里的代码，
	 * 以内部类的形式遍历结果集，跟大家看的抽象方法的mapROws一样
	 * @param res
	 * @return
	 */
	List<T> mapRows(ResultSet res);
	int mapRowCounts(ResultSet res);
}
