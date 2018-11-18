package mjy.caiwu.kucunchengben.dao;

import java.util.List;

public interface KucunmxDao {
	<T> List<T> query(Class<T> cla,int goodId,String wareHouseName); 
	int getWareHouseId(String wareHouseName);
}
