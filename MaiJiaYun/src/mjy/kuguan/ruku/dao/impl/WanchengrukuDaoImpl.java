package mjy.kuguan.ruku.dao.impl;

import java.util.List;
import java.sql.ResultSet;
import java.util.ArrayList;

import mjy.common.util.jdbc.BaseDao;
import mjy.kuguan.ruku.dao.WanchengrukuDao;
import mjy.kuguan.ruku.po.WanchengPO;

public class WanchengrukuDaoImpl extends BaseDao<WanchengPO> implements WanchengrukuDao{

	@Override
	public void getInsert(int wanchengBossId, WanchengPO wanchengPO) {
		// TODO Auto-generated method stub
		String sql = "insert into kuguan_rukuwancheng values(?,?,?,?,?,?,?,?,?,?,?)";
		List<Object> list = new ArrayList<Object>();
		list.add(Thread.currentThread().hashCode() + "-" + System.currentTimeMillis());
		list.add(wanchengBossId);
		list.add(wanchengPO.getWanchengCode());
		list.add(wanchengPO.getWanchengXiangguanCode());
		list.add(wanchengPO.getWanchengType());
		list.add(wanchengPO.getWanchengInCount());
		list.add(wanchengPO.getWanchengSetTime());
		list.add(wanchengPO.getWanchengAuthor());
		list.add(wanchengPO.getWanchengChecker());
		list.add(wanchengPO.getWanchengCheckTime());
		list.add(wanchengPO.getWanchengNote());
		this.SaveOrUpdate(sql, list);
	}

	@Override
	public List<WanchengPO> mapRow(ResultSet rs) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
