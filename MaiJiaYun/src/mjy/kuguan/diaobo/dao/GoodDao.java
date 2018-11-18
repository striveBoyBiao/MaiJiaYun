package mjy.kuguan.diaobo.dao;

import java.util.List;

import mjy.kuguan.diaobo.po.GoodsPO;

public interface GoodDao {
	public List<GoodsPO> queryByGoodId(Integer goodID);
}
