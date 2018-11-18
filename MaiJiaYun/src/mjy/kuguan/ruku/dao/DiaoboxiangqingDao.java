package mjy.kuguan.ruku.dao;

import java.util.List;

import mjy.kuguan.ruku.po.DiaoboxiangqingPO;

public interface DiaoboxiangqingDao {
	/**
	 * 插入数据
	 * @param diaoboxiangqingPO
	 */
	public void getInsert(int diaoboxiangqingBossId, DiaoboxiangqingPO diaoboxiangqingPO);
	/**
	 * 依据入库单号获取本单所有数据
	 * @param diaoboxiangqingCode
	 * @return
	 */
	public List<DiaoboxiangqingPO> getSelectByCode(int diaoboxiangqingBossId, String diaoboxiangqingCode);
	/**
	 * (编辑表用)设置某单某商品已入库数量
	 * @param diaoboxiangqingCode
	 * @param diaoboxiangqingSku
	 * @param diaoboxiangqingInFinish
	 */
	public void setInFinish(int diaoboxiangqingBossId, String diaoboxiangqingCode, String diaoboxiangqingSku, int diaoboxiangqingInFinish);
	/**
	 * (编辑表用)设置某单某商品备注
	 * @param diaoboxiangqingCode
	 * @param diaoboxiangqingSku
	 * @param diaoboxiangqingNote
	 */
	public void setNote(int diaoboxiangqingBossId, String diaoboxiangqingCode, String diaoboxiangqingSku, String diaoboxiangqingNote);
}
