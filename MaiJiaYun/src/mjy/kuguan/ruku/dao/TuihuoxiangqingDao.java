package mjy.kuguan.ruku.dao;

import java.util.List;

import mjy.kuguan.ruku.po.TuihuoxiangqingPO;

public interface TuihuoxiangqingDao {
	/**
	 * 插入数据
	 * @param tuihuorukuPO
	 */
	public void getInsert(int tuihuoxiangqingBossId, TuihuoxiangqingPO tuihuoxiangqingPO);
	/**
	 * 依据入库单号获取本单所有数据
	 * @param tuihuoxiangqingCode
	 * @return
	 */
	public List<TuihuoxiangqingPO> getSelectByCode(int tuihuoxiangqingBossId, String tuihuoxiangqingCode);
	/**
	 * (编辑表用)获取某单某商品需入库数量
	 * @param tuihuoxiangqingCode
	 * @param tuihuoxiangqingSku
	 * @return
	 */
	public int getInNeed(int tuihuoxiangqingBossId, String tuihuoxiangqingCode, String tuihuoxiangqingSku);
	/**
	 * (编辑表用)设置某单某商品的1.可入库数量 2.损坏数量 3.遗失数量
	 * @param tuihuoxiangqingCode
	 * @param tuihuoxiangqingSku
	 * @param tuihuoxiangqingInOk
	 * @param tuihuoxiangqingInBroken
	 * @param tuihuoxiangqingInLost
	 */
	public void setInNumber(int tuihuoxiangqingBossId, String tuihuoxiangqingCode, String tuihuoxiangqingSku, int tuihuoxiangqingInOk, int tuihuoxiangqingInBroken, int tuihuoxiangqingInLost);
	/**
	 * (编辑表用)设置某单某商品的备注
	 * @param tuihuoxiangqingCode
	 * @param tuihuoxiangqingSku
	 * @param tuihuoxiangqingNote
	 */
	public void setNote(int tuihuoxiangqingBossId, String tuihuoxiangqingCode, String tuihuoxiangqingSku, String tuihuoxiangqingNote);
}
