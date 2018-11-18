package mjy.kuguan.ruku.dao;

import java.util.List;

import mjy.caigou.vo.PurchaseGoodVO;

public interface RuKuCaigoudanDao {
	/**
	 * 依据采购单号获取旗下商品信息
	 * 
	 * @param bossId
	 * @param purchaseCode
	 * @return
	 */
	public List<PurchaseGoodVO> getPurchaseGoodsInfo(int bossId, String purchaseCode);
}
