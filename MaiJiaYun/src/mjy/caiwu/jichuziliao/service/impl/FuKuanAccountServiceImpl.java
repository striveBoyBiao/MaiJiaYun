package mjy.caiwu.jichuziliao.service.impl;

import java.util.List;

import mjy.caiwu.jichuziliao.dao.FuKuanAccountDao;
import mjy.caiwu.jichuziliao.dao.impl.FuKuanAccountDaoImpl;
import mjy.caiwu.jichuziliao.service.FuKuanAccountService;
import mjy.caiwu.jichuziliao.vo.FuKuanAccountVO;

public class FuKuanAccountServiceImpl implements FuKuanAccountService{
	
	FuKuanAccountDao fkDao=new FuKuanAccountDaoImpl();
	
//	public List<FuKuanAccountVO> list() {
//		
//		FuKuanAccountPO fkPO=new FuKuanAccountPO();
//		
//		List<FuKuanAccountVO> fkDao.listBy(fkPO);
//		
//		List<String> shops=new ArrayList<String>();
//		
//		shops.add("shop1");
//		shops.add("shop2");
//		shops.add("shop3");
//		
//		return shops;
//	}

	@Override
	public List<FuKuanAccountVO> listBy() {
		return fkDao.listBy();
	}

	@Override
	public void addFuKuanAccount(FuKuanAccountVO fkVO) {
		fkDao.addFuKuanAccount(fkVO);
		
	}
	
	
}