package mjy.caigou.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.caigou.dao.BaseDao;
import mjy.caigou.dao.KCCBMXDao;
import mjy.caigou.vo.KCCBMXVO;

public class KCCBMXDaoImpl extends BaseDao<KCCBMXVO> implements KCCBMXDao {

	@Override
	public List<KCCBMXVO> querykccbmx(int goodId, int warehouseId) {
		String sql="select * from caigou_kccbmx where goodId=? and warehouseId=?";
		List<Object> params=new ArrayList<>();
		params.add(goodId);
		params.add(warehouseId);
		
		return this.queryForList(sql, params);

		
	}

	@Override
	public List<KCCBMXVO> mapRow(ResultSet rs) throws Exception {
		List<KCCBMXVO> list=new ArrayList<>();
		KCCBMXVO kccbmxvo=null;
		while(rs.next()){
			kccbmxvo=new KCCBMXVO();
			kccbmxvo.setChangeTime(rs.getObject("changeTime").toString());
			kccbmxvo.setBusinessName(rs.getString("businessName"));
			kccbmxvo.setBillsName(rs.getString("billsName"));
			kccbmxvo.setFirstCost(rs.getDouble("firstCost"));
			kccbmxvo.setFirstInventory(rs.getInt("firstInventory"));
			kccbmxvo.setLastCost(rs.getDouble("lastCost"));
			kccbmxvo.setLastInventory(rs.getInt("lastInventory"));
			list.add(kccbmxvo);
		}
		
		return list;
	}

}
