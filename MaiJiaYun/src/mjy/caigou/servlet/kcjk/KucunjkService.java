package mjy.caigou.servlet.kcjk;

import java.util.List;

public interface KucunjkService {
	<T> List<T> query(Class<T> cla, int pageNum, int pageSize,Object obj);
	void operate(double kucunCost, int goodId, String wareHouseName);
	<T> List<T> show(Class<T> cla,int goodId, int wareHouseId);
	int getWareHouseId(String wareHouseName);
}
