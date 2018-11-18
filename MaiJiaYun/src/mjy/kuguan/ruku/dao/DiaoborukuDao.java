package mjy.kuguan.ruku.dao;

import java.util.List;

import mjy.kuguan.ruku.po.DiaoborukuPO;

public interface DiaoborukuDao{
	/**
	 * 新增调拨入库单
	 * @param diaoborukuPO
	 */
	public void getInsert(int diaoboBossId, DiaoborukuPO diaoborukuPO);
	/**
	 * 依据入库单号查找数据(模糊查询)
	 * 依据页码与每页显示记录条数返回当页数据
	 * @param diaoboCode
	 * @param pageNumber
	 * @param pageSize
	 * @return
	 */
	public List<DiaoborukuPO> getSelectByCode(int diaoboBossId, String diaoboCode, int pageNumber, int pageSize);
	/**
	 * 依据相关调拨单号查找数据(模糊查询)
	 * 依据页码与每页显示记录条数返回当页数据
	 * @param diaoboDiaobodanCode
	 * @param pageNumber
	 * @param pageSize
	 * @return
	 */
	public List<DiaoborukuPO> getSelectByDiaobodanCode(int diaoboBossId, String diaoboDiaobodanCode, int pageNumber, int pageSize);
	/**
	 * 依据制单人查找数据(模糊查询)
	 * 依据页码与每页显示记录条数返回当页数据
	 * @param diaoboAuthor
	 * @param pageNumber
	 * @param pageSize
	 * @return
	 */
	public List<DiaoborukuPO> getSelectByAuthor(int diaoboBossId, String diaoboAuthor, int pageNumber, int pageSize);
	/**
	 * 依据仓库名查找数据
	 * 依据页码与每页显示记录条数返回当页数据
	 * @param diaoboWarehouse
	 * @param pageNumber
	 * @param pageSize
	 * @return
	 */
	public List<DiaoborukuPO> getSelectByWarehouse(int diaoboBossId, String diaoboWarehouse, int pageNumber, int pageSize);
	/**
	 * 获取无条件查询的所有数据
	 * 依据页码与每页显示记录条数返回当页数据
	 * @param pageNumber
	 * @param pageSize
	 * @return
	 */
	public List<DiaoborukuPO> getSelectAll(int diaoboBossId, int pageNumber, int pageSize);
	/**
	 * 获取全部调拨入库单数量
	 * @return
	 */
	public int getAllCount(int diaoboBossId);
	/**
	 * 获取所有仓库名
	 * @return
	 */
	public List<String> getAllWarehouse(int diaoboBossId);
	/**
	 * 设置已入库数量
	 * @param diaoboCode
	 * @param diaoboInFinish
	 */
	public void setInFinish(int diaoboBossId, String diaoboCode, int diaoboInFinish);
	/**
	 * 设置本单入库备注
	 * @param diaoboCode
	 * @param diaoboNote
	 */
	public void setNote(int diaoboBossId, String diaoboCode, String diaoboNote);
	/**
	 * 获取依据入库单查询的数据总数
	 * @param diaoboCode
	 * @return
	 */
	public int getCountByCode(int diaoboBossId, String diaoboCode);
	/**
	 * 获取依据相关调拨单查询的数据总数
	 * @param diaoboDiaobodanCode
	 * @return
	 */
	public int getCountByDiaobodanCode(int diaoboBossId, String diaoboDiaobodanCode);
	/**
	 * 获取依据制单人查询的数据总数
	 * @param diaoboAuthor
	 * @return
	 */
	public int getCountByAuthor(int diaoboBossId, String diaoboAuthor);
	/**
	 * 获取依据仓库名查询的数据总数
	 * @param diaoboWarehouse
	 * @return
	 */
	public int getCountByWarehouse(int diaoboBossId, String diaoboWarehouse);
}
