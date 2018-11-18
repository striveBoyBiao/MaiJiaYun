package mjy.order.dao;

import java.sql.ResultSet;
import java.util.List;

public interface RowMap<T> {
	/**
	 * ���ڱ���������������Ŀ��Կ���BuyerDao��Ĵ��룬
	 * ���ڲ������ʽ���������������ҿ��ĳ��󷽷���mapROwsһ��
	 * @param res
	 * @return
	 */
	List<T> mapRows(ResultSet res);
	int mapRowCounts(ResultSet res);
}
