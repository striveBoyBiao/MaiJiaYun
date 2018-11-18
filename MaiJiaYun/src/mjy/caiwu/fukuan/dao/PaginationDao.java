package mjy.caiwu.fukuan.dao;

import mjy.caiwu.fukuan.beans.FuKuanPO;

public interface PaginationDao {

	/**
	 * 获得总条数
	 * @return
	 */
	public int getCount(FuKuanPO fkp,int fkState,int bossId);
}
