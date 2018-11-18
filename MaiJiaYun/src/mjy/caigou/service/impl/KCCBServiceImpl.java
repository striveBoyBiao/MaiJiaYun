package mjy.caigou.service.impl;

import java.util.List;

import mjy.caigou.beans.PageInfo;
import mjy.caigou.dao.KCCBDao;
import mjy.caigou.dao.KCCBMXDao;
import mjy.caigou.dao.impl.KCCBDaoImpl;
import mjy.caigou.dao.impl.KCCBMXDaoImpl;
import mjy.caigou.service.KCCBService;
import mjy.caigou.vo.KCCBMXVO;
import mjy.caigou.vo.KCCBVO;

public class KCCBServiceImpl implements KCCBService{

	KCCBDao kccbdao=new KCCBDaoImpl();
	@Override
	public List<KCCBVO> queryKccb(String querytext,int userid,int pagebegin) {
		// TODO Auto-generated method stub
		return kccbdao.queryKccb(querytext,userid, pagebegin);
	}
	@Override
	public List<KCCBVO> queryBySkuOrGoodsName(String querytext, int userid) {
		// TODO Auto-generated method stub
		return kccbdao.queryBySkuOrGoodsName(querytext, userid);
	}
	@Override
	public PageInfo<KCCBVO> getpageinfo(int userId, PageInfo<KCCBVO> pageinfo) {
		// TODO Auto-generated method stub
		return kccbdao.getpageinfo(userId, pageinfo);
	}
	public void updateKccbMx(KCCBMXVO kccbmxvo) {
		kccbdao.updateKccbMx(kccbmxvo);
		
	}

	public List<KCCBMXVO> querykccbmx(int goodId, int warehouseId) {
		// TODO Auto-generated method stub
		KCCBMXDao kccbmxdao=new KCCBMXDaoImpl();
		return kccbmxdao.querykccbmx(goodId, warehouseId);
		
	}

}
