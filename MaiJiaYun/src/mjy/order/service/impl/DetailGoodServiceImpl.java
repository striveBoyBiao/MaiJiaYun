package mjy.order.service.impl;

import java.util.List;

import mjy.order.bean.po.DetailGoodPO;
import mjy.order.bean.vo.DetailGood;
import mjy.order.dao.DetailGoodDao;
import mjy.order.dao.impl.DetailGoodDaoImpl;
import mjy.order.service.DetailGoodService;

public class DetailGoodServiceImpl implements DetailGoodService {
	DetailGoodDao detailGooDao = new DetailGoodDaoImpl();
	@Override
	public List<DetailGood> detailGoodQueryAll(DetailGoodPO detailGoodPO) {
		
		return detailGooDao.detailGoodQuery(detailGoodPO);
	}
	@Override
	public DetailGood detailGoodQuery(DetailGoodPO detailGoodPO) {
		if (detailGooDao.detailGoodQuery(detailGoodPO)!=null) {
			return detailGooDao.detailGoodQuery(detailGoodPO).get(0);
		}
		return null;
	}

}
