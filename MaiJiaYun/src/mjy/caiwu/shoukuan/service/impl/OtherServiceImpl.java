package mjy.caiwu.shoukuan.service.impl;

import java.util.List;

import mjy.caigou.vo.ShopVO;
import mjy.caiwu.jichuziliao.vo.FuKuanAccountVO;
import mjy.caiwu.shoukuan.beans.CwShouKuanVO;
import mjy.caiwu.shoukuan.dao.CaiWuAddBankId;
import mjy.caiwu.shoukuan.dao.OtherDao;
import mjy.caiwu.shoukuan.dao.impl.CaiWuAddBankIdImpl;
import mjy.caiwu.shoukuan.dao.impl.OtherDaoImpl;
import mjy.caiwu.shoukuan.service.OtherService;

public class OtherServiceImpl implements OtherService {



	@Override
	public Integer select(String userId) {
	OtherDao  otherDao = new OtherDaoImpl();
		Integer bankId = null;
		String userType = otherDao.getType(userId);
		List<ShopVO> list;
		if (!userType.equals("boss" )) {
			userId = otherDao.getBossId(userId);
		}
		list = otherDao.getShopId(userId);

		// 把每一个商店的银行卡找出来

		CaiWuAddBankId caiWuAddBankId = new CaiWuAddBankIdImpl();
		for (ShopVO shopVO : list) {

			List<FuKuanAccountVO> ListFuKuanAccountVO = caiWuAddBankId.listBy1(String.valueOf(shopVO.getShopId()));
			for (FuKuanAccountVO fuKuanAccountVO : ListFuKuanAccountVO) {
				if (fuKuanAccountVO.isDafaultBankId()) {
					bankId = fuKuanAccountVO.getFkzhDafaultId();
					break;
				}
			}
			if (bankId != null) {
				break;
			}
		}
		return bankId;
	}


	@Override
	public CwShouKuanVO CwCaiGouTuiHuoSelect(int returnId) {
		// TODO Auto-generated method stub
		return null;
	}
	
		


}
