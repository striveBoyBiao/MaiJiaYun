package mjy.caiwu.kucunchengben.service;

import java.util.List;

public interface KucunmxService {
	<T> List<T> query(Class<T> cla,int goodId,String wareHouseName); 
	int getWareHouseId(String wareHouseName);
}
