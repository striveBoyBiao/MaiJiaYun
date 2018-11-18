package mjy.kuguan.ruku.dao;

import java.util.List;

import mjy.kuguan.ruku.po.TuihuorukuPO;

public interface TuihuorukuDao {
	/**
	 * 新增退货入库单
	 * @param TuihuorukuPO
	 */
	public void getInsert(int tuihuoBossId, TuihuorukuPO tuihuorukuPO);
	/**
	 * 依据入库单编号查找数据(模糊查询)
	 * 依据 页码 与 每页显示记录条数 返回当页数据
	 * @param tuihuoCode
	 * @return
	 */
	public List<TuihuorukuPO> getSelectByCode(int tuihuoBossId, String tuihuoCode, int pageNumber, int pageSize);
	/**
	 * 依据相关退货单号查找数据(模糊查询)
	 * 依据 页码 与 每页显示记录条数 返回当页数据
	 * @param tuihuoCaigoudanCode
	 * @return
	 */
	public List<TuihuorukuPO> getSelectByTuihuodanCode(int tuihuoBossId, String tuihuoCaigoudanCode, int pageNumber, int pageSize);
	/**
	 * 依据制单人查找数据(模糊查询)
	 * 依据 页码 与 每页显示记录条数 返回当页数据
	 * @param tuihuoAuthor
	 * @return
	 */
	public List<TuihuorukuPO> getSelectByAuthor(int tuihuoBossId, String tuihuoAuthor, int pageNumber, int pageSize);
	/**
	 * 依据仓库名查找数据
	 * 依据 页码 与 每页显示记录条数 返回当页数据
	 * @param tuihuoWarehouse
	 * @return
	 */
	public List<TuihuorukuPO> getSelectByWarehouse(int tuihuoBossId, String tuihuoWarehouse, int pageNumber, int pageSize);
	/**
	 * 依据入库单获取所在仓库名
	 * @param tuihuoCode
	 * @return
	 */
	public String getWarehouseByCode(int tuihuoBossId, String tuihuoCode);
	/**
	 * 获取无条件查询的所有数据
	 * 依据 页码 与 每页显示记录条数 返回当页数据
	 * @param pageNumber
	 * @param pageSize
	 * @return
	 */
	public List<TuihuorukuPO> getSelectAll(int tuihuoBossId, int pageNumber, int pageSize);
	/**
	 * 获取所有退货入库单数量
	 * @return
	 */
	public int getAllCount(int tuihuoBossId);
	/**
	 * 获取所有仓库名
	 * @return
	 */
	public List<String> getAllWarehouse(int tuihuoBossId);
	/**
	 * 设置已入库数量
	 * @param tuihuoCode
	 * @param tuihuoInFinish
	 */
	public void setInFinish(int tuihuoBossId, String tuihuoCode, int tuihuoInFinish);
	/**
	 * 设置入库备注
	 * @param tuihuoCode
	 * @param tuihuoNote
	 */
	public void setNote(int tuihuoBossId, String tuihuoCode, String tuihuoNote);
}
