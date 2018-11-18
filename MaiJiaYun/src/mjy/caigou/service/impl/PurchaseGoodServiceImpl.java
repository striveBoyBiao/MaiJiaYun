package mjy.caigou.service.impl;

import java.util.List;

import mjy.caigou.dao.PurchaseGoodDao;
import mjy.caigou.dao.impl.PurchaseGoodDaoImpl;
import mjy.caigou.po.PurchaseGoodPO;
import mjy.caigou.service.PurchaseGoodService;
import mjy.caigou.vo.PurchaseGoodVO;
import mjy.caigou.vo.PurchaseVO;

public class PurchaseGoodServiceImpl implements PurchaseGoodService {

	PurchaseGoodDao pgd = new PurchaseGoodDaoImpl();

	@Override
	public void insert(List<PurchaseGoodVO> array) {
		pgd.insert(array);

	}

	@Override
	public void insert1(PurchaseGoodVO purchase) {
		pgd.insert1(purchase);

	}

	@Override
	public void update(PurchaseGoodVO purchaseGoodVo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int purchaseGoodId) {
		pgd.delete(purchaseGoodId);

	}

	@Override
	public List<PurchaseGoodVO> listBy(PurchaseGoodPO purchaseGoodPo) {

		return pgd.listBy(purchaseGoodPo);

	}

}
