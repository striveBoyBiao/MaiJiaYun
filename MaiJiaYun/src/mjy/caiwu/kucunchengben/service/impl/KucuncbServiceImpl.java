package mjy.caiwu.kucunchengben.service.impl;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.caiwu.kucunchengben.dao.KucuncbDao;
import mjy.caiwu.kucunchengben.dao.KucunmxDao;
import mjy.caiwu.kucunchengben.dao.impl.KucuncbDaoImpl;
import mjy.caiwu.kucunchengben.dao.impl.KucunmxDaoImpl;
import mjy.caiwu.kucunchengben.po.PageInfo;
import mjy.caiwu.kucunchengben.service.KucuncbService;

public class KucuncbServiceImpl implements KucuncbService {
	private KucuncbDao kccbDao = new KucuncbDaoImpl();
	private KucunmxDao kcmxDao=new KucunmxDaoImpl();
	@SuppressWarnings("unchecked")
	@Override
	public <T> List<T> query(Class<T> cla, int pageNum, int pageSize,Object obj) {
		// TODO Auto-generated method stub
		return kccbDao.query(cla, pageNum, pageSize,obj);
	}

	@Override
	public void operate(double kucunCost, int goodId, String wareHouseName) {
		// TODO Auto-generated method stub
		kccbDao.operate(kucunCost, goodId, wareHouseName);
	}

	@Override
	public <T> List<T> show(Class<T> cla, int goodId, int wareHouseId) {
		// TODO Auto-generated method stub
		return kccbDao.show(cla, goodId, wareHouseId);
	}

	@Override
	public <T> int getTotalFromDB(Class<T> cla,Object searchCondition) {
		// TODO Auto-generated method stub
		return kccbDao.getTotalFromDB(cla, searchCondition);
	}

	@Override
	public boolean fenyeMethod(PageInfo<?> pageInfo, Object searchCondition, HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		return kccbDao.fenyeMethod(pageInfo, searchCondition, request, response);
	}

}
