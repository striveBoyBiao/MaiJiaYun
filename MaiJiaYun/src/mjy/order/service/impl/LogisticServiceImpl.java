package mjy.order.service.impl;

import java.util.List;

import mjy.order.bean.po.LogisticPO;
import mjy.order.bean.vo.Logistic;
import mjy.order.dao.LogisticDao;
import mjy.order.dao.impl.LogisticDaoImpl;
import mjy.order.service.LogisticService;

public class LogisticServiceImpl implements LogisticService {
	
	LogisticDao logisticDao = new LogisticDaoImpl();
	@Override
	public Logistic logisticQuery(LogisticPO logisticPO) {
		if (logisticDao.logisticQuery(logisticPO)!=null) {
			
			return logisticDao.logisticQuery(logisticPO).get(0);
		}
		return null;
	}
	@Override
	public List<Logistic> logisticQueryAll() {
		
		return logisticDao.logisticQuery(null);
	}
	

}
