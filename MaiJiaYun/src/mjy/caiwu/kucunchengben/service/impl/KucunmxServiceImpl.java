package mjy.caiwu.kucunchengben.service.impl;

import java.util.List;

import mjy.caiwu.kucunchengben.dao.KucunmxDao;
import mjy.caiwu.kucunchengben.dao.impl.KucunmxDaoImpl;
import mjy.caiwu.kucunchengben.service.KucunmxService;

public class KucunmxServiceImpl implements KucunmxService {
	private KucunmxDao kcmxDao = new KucunmxDaoImpl();

	@Override
	public <T> List<T> query(Class<T> cla, int goodId, String wareHouseName) {
		// TODO Auto-generated method stub
		return kcmxDao.query(cla, goodId, wareHouseName);
	}

	@Override
	public int getWareHouseId(String wareHouseName) {
		// TODO Auto-generated method stub
		return kcmxDao.getWareHouseId(wareHouseName);
	}

}
