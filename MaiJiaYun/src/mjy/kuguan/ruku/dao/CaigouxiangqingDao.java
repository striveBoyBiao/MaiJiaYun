package mjy.kuguan.ruku.dao;

import java.util.List;

import mjy.kuguan.ruku.po.CaigouxiangqingPO;

public interface CaigouxiangqingDao {
	/**
	 * 插入数据
	 * @param caigouxiangqingPO
	 */
	public void getInsert(int caigouxiangqingBossId, CaigouxiangqingPO caigouxiangqingPO);
	/**
	 * (编辑表驳回用)依据入库单编号删除数据
	 * @param caigouxiangqingCode
	 */
	public void getDelete(int caigouxiangqingBossId, String caigouxiangqingCode);
	/**
	 * 依据入库单号获取本单所有数据
	 * @param caigouxiangqingCode
	 * @return
	 */
	public List<CaigouxiangqingPO> getSelectByCode(int caigouxiangqingBossId, String caigouxiangqingCode);
	/**
	 * (编辑表用)计算获取某单某商品的允许入库数量：允许入库数量=需入库数量-已入库数量 
	 * @param caigouxiangqingCode
	 * @param caigouxiangqingSku
	 * @return
	 */
	public int getInAllow(int caigouxiangqingBossId, String caigouxiangqingCode, String caigouxiangqingSku);
	/**
	 * (编辑表用)设置某单某商品 已入库数量
	 * @param caigouxiangqingCode
	 * @param caigouxiangqingSku
	 * @param caigouxiangqingInFinish
	 */
	public void setInFinish(int caigouxiangqingBossId, String caigouxiangqingCode, String caigouxiangqingSku, int caigouxiangqingInFinish);
	/**
	 * (编辑表用)设置某单某商品 备注
	 * @param caigouxiangqingCode
	 * @param caigouxiangqingSku
	 * @param caigouxiangqingNote
	 */
	public void setNote(int caigouxiangqingBossId, String caigouxiangqingCode, String caigouxiangqingSku, String caigouxiangqingNote);
}
