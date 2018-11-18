package mjy.kuguan.chukudan.dao;

import java.util.List;

import mjy.kuguan.chukudan.po.BianJiPO;





public interface IBianJiDao {

	/**
	 * 插入出库编辑单(插入一条出库单的同时插入)
	 * @param bianji
	 */
	public void insert(BianJiPO bianji);
	
	/**
	 * 更改出库编辑单，主要用于编辑出库时更改本次出库数量和备注
	 * @param bianji
	 */
	public void update(BianJiPO bianji);
	
	
	/**
	 * 删除出库编辑单，（驳回采购退货单时，删除相应出库编辑单，删除对应出库单）
	 */
	public void deleteByID(int chukuId);
	
	/**
	 * 根据chukudanId查询相应编辑单
	 * 用ajax实现，将chukudanId作为参数传到servlet中，用json
	 * @param chukudanId
	 * @return
	 */
	public List<BianJiPO> listBy(int chukudanId);
	
}
