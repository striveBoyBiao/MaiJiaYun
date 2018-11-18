package mjy.caiwu.kucunchengben.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.caiwu.kucunchengben.po.PageInfo;

public interface KucuncbService {
	<T> List<T> query(Class<T> cla, int pageNum, int pageSize,Object obj);
	void operate(double kucunCost, int goodId, String wareHouseName);
	<T> List<T> show(Class<T> cla,int goodId, int wareHouseId);
	<T> int getTotalFromDB(Class<T> cla,Object searchCondition);
	boolean fenyeMethod(PageInfo<?> pageInfo, Object searchCondition, HttpServletRequest request,
			HttpServletResponse response);
}
