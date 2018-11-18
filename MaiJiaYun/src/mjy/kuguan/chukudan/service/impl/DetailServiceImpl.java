package mjy.kuguan.chukudan.service.impl;

import java.util.List;

import mjy.kuguan.chukudan.dao.IBianJiDao;
import mjy.kuguan.chukudan.dao.IChuKuDanDao;
import mjy.kuguan.chukudan.dao.impl.BianJiDaoImpl;
import mjy.kuguan.chukudan.dao.impl.ChuKuDanImpl;
import mjy.kuguan.chukudan.po.BianJiPO;
import mjy.kuguan.chukudan.service.IDetailService;

public class DetailServiceImpl implements IDetailService {

	private IBianJiDao bianji=new BianJiDaoImpl();
	private IChuKuDanDao chukudan=new ChuKuDanImpl();
	
	@Override
	public List<BianJiPO> queryDetail(int chukudanId) {
		
		return bianji.listBy(chukudanId);
	}
	@Override
	public String getType(int chukudanId) {
		
		return chukudan.getTypeById(chukudanId);
	}

}
