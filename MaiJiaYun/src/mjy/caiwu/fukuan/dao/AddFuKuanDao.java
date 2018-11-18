package mjy.caiwu.fukuan.dao;

import java.util.List;

import mjy.caiwu.fukuan.beans.FuKuanVo;
/*
 * 添加应付单的Dao
 */
public interface AddFuKuanDao {
	/*
	 * 向数据库提交
	 */
	void addFuKuan(FuKuanVo fuKuanVo);
}
