package mjy.kuguan.ruku.dao;

import java.util.List;

import mjy.kuguan.ruku.po.CaigourukuPO;

public interface CaigourukuDao {
	/**
	 * 新增采购入库单
	 * @param caigourukuPO
	 */
	public void getInsert(int caigouBossId, CaigourukuPO caigourukuPO);
	/**
	 * (驳回采购单用)依据入库单编号删除采购入库单
	 * @param caigouCode
	 */
	public void getDelete(int caigouBossId, String caigouCode);
	/**
	 * 依据入库单编号查找数据(模糊查询)
	 * 依据 页码 与 每页显示记录条数 返回当页数据
	 * @param caigouCode
	 * @return
	 */
	public List<CaigourukuPO> getSelectByCode(int caigouBossId, String caigouCode, int pageNumber, int pageSize);
	/**
	 * 依据相关采购单号查找数据(模糊查询)
	 * 依据 页码 与 每页显示记录条数 返回当页数据
	 * @param caigouCaigoudanCode
	 * @return
	 */
	public List<CaigourukuPO> getSelectByCaigoudanCode(int caigouBossId, String caigouCaigoudanCode, int pageNumber, int pageSize);
	/**
	 * 依据制单人查找数据(模糊查询)
	 * 依据 页码 与 每页显示记录条数 返回当页数据
	 * @param caigouAuthor
	 * @return
	 */
	public List<CaigourukuPO> getSelectByAuthor(int caigouBossId, String caigouAuthor, int pageNumber, int pageSize);
	/**
	 * 依据仓库名查找数据
	 * 依据 页码 与 每页显示记录条数 返回当页数据
	 * @param caigouWarehouse
	 * @return
	 */
	public List<CaigourukuPO> getSelectByWarehouse(int caigouBossId, String caigouWarehouse, int pageNumber, int pageSize);
	/**
	 * 依据入库单获取所在仓库名
	 * @param caigouCode
	 * @return
	 */
	public String getWarehouseByCode(int caigouBossId, String caigouCode);
	/**
	 * 获取无条件查询的所有数据
	 * 依据 页码 与 每页显示记录条数 返回当页数据
	 * @param pageNumber
	 * @param pageSize
	 * @return
	 */
	public List<CaigourukuPO> getSelectAll(int caigouBossId, int pageNumber, int pageSize);
	/**
	 * 获取全部采购入库单数量
	 * @return
	 */
	public int getAllCount(int caigouBossId);
	/**
	 * 获取所有仓库名
	 * @return
	 */
	public List<String> getAllWarehouse(int caigouBossId);
	/**
	 * 设置已入库数量
	 * @param caigouCode
	 * @param caigouInFinish
	 */
	public void setInFinish(int caigouBossId, String caigouCode, int caigouInFinish);
	/**
	 * 设置入本单库备注
	 * @param caigouCode
	 * @param caigouNote
	 */
	public void setNote(int caigouBossId, String caigouCode, String caigouNote);
}
