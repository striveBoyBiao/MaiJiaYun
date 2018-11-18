package mjy.kuguan.ruku.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mjy.caigou.dao.GoodsDao;
import mjy.caigou.dao.WarehouseDao;
import mjy.caigou.dao.impl.GoodsDaoImpl;
import mjy.caigou.dao.impl.WarehouseDaoImpl;
import mjy.common.util.jdbc.BaseDao;
import mjy.kuguan.ruku.dao.CaigouxiangqingDao;
import mjy.kuguan.ruku.factory.PersistentObjectFactory;
import mjy.kuguan.ruku.po.CaigouxiangqingPO;

public class CaigouxiangqingDaoImpl extends BaseDao<CaigouxiangqingPO> implements CaigouxiangqingDao{
	private GoodsDao goodsDao = new GoodsDaoImpl();
	private WarehouseDao warehouseDao = new WarehouseDaoImpl();

	@Override
	public void getInsert(int caigouxiangqingBossId, CaigouxiangqingPO caigouxiangqingPO) {
		// TODO Auto-generated method stub
		String sql = "insert into kuguan_caigourukuinfo values(?,?,?,?,?,?,?,?,?,?)";
		List<Object> list = new ArrayList<Object>();
		list.add(Thread.currentThread().hashCode() + "-" +System.currentTimeMillis());
		list.add(caigouxiangqingBossId);
		list.add(caigouxiangqingPO.getCaigouxiangqingCode());
		list.add(caigouxiangqingPO.getCaigouxiangqingSku());
		list.add(Integer.parseInt(caigouxiangqingPO.getCaigouxiangqingName()));
		list.add(caigouxiangqingPO.getCaigouxiangqingAttribute());
		list.add(Integer.parseInt(caigouxiangqingPO.getCaigouxiangqingWarehouse()));
		list.add(caigouxiangqingPO.getCaigouxiangqingInNeed());
		list.add(caigouxiangqingPO.getCaigouxiangqingInFinish());
		list.add(caigouxiangqingPO.getCaigouxiangqingNote());
		this.SaveOrUpdate(sql, list);
	}

	@Override
	public List<CaigouxiangqingPO> getSelectByCode(int caigouxiangqingBossId, String caigouxiangqingCode) {
		// TODO Auto-generated method stub
		String sql = "select * from kuguan_caigourukuinfo where caigouxiangqingBossId = ? and caigouxiangqingCode = ?";
		List<Object> list = new ArrayList<Object>();
		list.add(caigouxiangqingBossId);
		list.add(caigouxiangqingCode);
		List<CaigouxiangqingPO> poList = new ArrayList<CaigouxiangqingPO>();
		poList = this.queryForList(sql, list);
		
		for (CaigouxiangqingPO po : poList) {
			po.setCaigouxiangqingName(goodsDao.queryGoodInfoById(Integer.parseInt(po.getCaigouxiangqingName())).getGoodName());
			po.setCaigouxiangqingWarehouse(warehouseDao.queryNameById(Integer.parseInt(po.getCaigouxiangqingWarehouse())));
		}
		
		return poList;
	}

	@Override
	public int getInAllow(int caigouxiangqingBossId, String caigouxiangqingCode, String caigouxiangqingSku) {
		// TODO Auto-generated method stub
		String sql = "select * from kuguan_caigourukuinfo where caigouxiangqingBossId = ? and caigouxiangqingCode = ? and caigouxiangqingSku = ?";
		List<Object> list = new ArrayList<Object>();
		list.add(caigouxiangqingBossId);
		list.add(caigouxiangqingCode);
		list.add(caigouxiangqingSku);
		List<CaigouxiangqingPO> poList = new ArrayList<CaigouxiangqingPO>();
		poList = this.queryForList(sql, list);
		
		if(poList == null || poList.size() == 0){
			return 0;
		}
		
		return poList.get(0).getCaigouxiangqingInNeed() - poList.get(0).getCaigouxiangqingInFinish();
	}

	@Override
	public void setInFinish(int caigouxiangqingBossId, String caigouxiangqingCode, String caigouxiangqingSku, int caigouxiangqingInFinish) {
		// TODO Auto-generated method stub
		String sql = "update kuguan_caigourukuinfo set caigouxiangqingInFinish = ? where caigouxiangqingBossId = ? and caigouxiangqingCode = ? and caigouxiangqingSku = ?";
		List<Object> list = new ArrayList<Object>();
		list.add(caigouxiangqingInFinish);
		list.add(caigouxiangqingBossId);
		list.add(caigouxiangqingCode);
		list.add(caigouxiangqingSku);
		
		this.SaveOrUpdate(sql, list);
	}

	@Override
	public void setNote(int caigouxiangqingBossId, String caigouxiangqingCode, String caigouxiangqingSku, String caigouxiangqingNote) {
		// TODO Auto-generated method stub
		String sql = "update kuguan_caigourukuinfo set caigouxiangqingNote = ? where caigouxiangqingBossId = ? and caigouxiangqingCode = ? and caigouxiangqingSku = ?";
		List<Object> list = new ArrayList<Object>();
		list.add(caigouxiangqingNote);
		list.add(caigouxiangqingBossId);
		list.add(caigouxiangqingCode);
		list.add(caigouxiangqingSku);
		
		this.SaveOrUpdate(sql, list);
	}

	@Override
	public void getDelete(int caigouxiangqingBossId, String caigouxiangqingCode) {
		// TODO Auto-generated method stub
		String sql = "delete from kuguan_caigourukuinfo where caigouxiangqingBossId = ? and caigouxiangqingCode = ?";
		List<Object> list = new ArrayList<Object>();
		list.add(caigouxiangqingBossId);
		list.add(caigouxiangqingCode);
		
		this.SaveOrUpdate(sql, list);
	}

	@Override
	public List<CaigouxiangqingPO> mapRow(ResultSet rs) throws Exception {
		List<CaigouxiangqingPO> list = new ArrayList<CaigouxiangqingPO>();
		CaigouxiangqingPO po = null;
		try {
			while(rs.next()){
				po = PersistentObjectFactory.getCaigouxiangqingPO();
				po.setCaigouxiangqingCode(rs.getString("caigouxiangqingCode"));
				po.setCaigouxiangqingSku(rs.getString("caigouxiangqingSku"));
				po.setCaigouxiangqingName(rs.getString("caigouxiangqingName"));
				po.setCaigouxiangqingAttribute(rs.getString("caigouxiangqingAttribute"));
				po.setCaigouxiangqingWarehouse(rs.getString("caigouxiangqingWarehouse"));
				po.setCaigouxiangqingInNeed(rs.getInt("caigouxiangqingInNeed"));
				po.setCaigouxiangqingInFinish(rs.getInt("caigouxiangqingInFinish"));
				po.setCaigouxiangqingNote(rs.getString("caigouxiangqingNote"));
				list.add(po);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
}
