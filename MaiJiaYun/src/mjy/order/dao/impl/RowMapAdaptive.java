package mjy.order.dao.impl;

import java.sql.ResultSet;
import java.util.List;

import mjy.order.dao.RowMap;

public class RowMapAdaptive<T> implements RowMap<T> {

	@Override
	public List<T> mapRows(ResultSet res) {
		
		return null;
	}

	@Override
	public int mapRowCounts(ResultSet res) {
		
		return 0;
	}

}
