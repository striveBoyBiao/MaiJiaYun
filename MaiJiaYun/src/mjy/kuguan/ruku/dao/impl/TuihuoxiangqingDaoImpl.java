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
import mjy.kuguan.ruku.dao.TuihuoxiangqingDao;
import mjy.kuguan.ruku.factory.PersistentObjectFactory;
import mjy.kuguan.ruku.po.TuihuoxiangqingPO;

public class TuihuoxiangqingDaoImpl extends BaseDao<TuihuoxiangqingPO> implements TuihuoxiangqingDao{
	private GoodsDao goodsDao = new GoodsDaoImpl();
	private WarehouseDao warehouseDao = new WarehouseDaoImpl();

	@Override
	public void getInsert(int tuihuoxiangqingBossId, TuihuoxiangqingPO tuihuoxiangqingPO) {
		// TODO Auto-generated method stub
		String sql = "insert into kuguan_tuihuorukuinfo values(?,?,?,?,?,?,?,?,?,?,?,?)";
		List<Object> list = new ArrayList<Object>();
		list.add(Thread.currentThread().hashCode() + "-" + System.currentTimeMillis());
		list.add(tuihuoxiangqingBossId);
		list.add(tuihuoxiangqingPO.getTuihuoxiangqingCode());
		list.add(tuihuoxiangqingPO.getTuihuoxiangqingSku());
		list.add(Integer.parseInt(tuihuoxiangqingPO.getTuihuoxiangqingName()));
		list.add(tuihuoxiangqingPO.getTuihuoxiangqingAttribute());
		list.add(Integer.parseInt(tuihuoxiangqingPO.getTuihuoxiangqingWarehouse()));
		list.add(tuihuoxiangqingPO.getTuihuoxiangqingInNeed());
		list.add(tuihuoxiangqingPO.getTuihuoxiangqingInOk());
		list.add(tuihuoxiangqingPO.getTuihuoxiangqingInBroken());
		list.add(tuihuoxiangqingPO.getTuihuoxiangqingInLost());
		list.add(tuihuoxiangqingPO.getTuihuoxiangqingNote());
		this.SaveOrUpdate(sql, list);
	}

	@Override
	public List<TuihuoxiangqingPO> getSelectByCode(int tuihuoxiangqingBossId, String tuihuoxiangqingCode) {
		// TODO Auto-generated method stub
		String sql = "select * from kuguan_tuihuorukuinfo where tuihuoxiangqingBossId = ? and tuihuoxiangqingCode = ?";
	//	String sql = "select * from kuguan_tuihuorukuinfo where tuihuoxiangqingCode = ?";
		List<Object> list = new ArrayList<Object>();
		list.add(tuihuoxiangqingBossId);
		list.add(tuihuoxiangqingCode);
		List<TuihuoxiangqingPO> poList = new ArrayList<TuihuoxiangqingPO>();
		poList = this.queryForList(sql, list);
		
		for (TuihuoxiangqingPO po : poList) {
			po.setTuihuoxiangqingName(goodsDao.queryGoodInfoById(Integer.parseInt(po.getTuihuoxiangqingName())).getGoodName());
			po.setTuihuoxiangqingWarehouse(warehouseDao.queryNameById(Integer.parseInt(po.getTuihuoxiangqingWarehouse())));
		}
		
		return poList;
	}

	@Override
	public int getInNeed(int tuihuoxiangqingBossId, String tuihuoxiangqingCode, String tuihuoxiangqingSku) {
		// TODO Auto-generated method stub
		String sql = "select * from kuguan_tuihuorukuinfo where tuihuoxiangqingBossId = ? and tuihuoxiangqingCode = ? and tuihuoxiangqingSku = ?";
		List<Object> list = new ArrayList<Object>();
		list.add(tuihuoxiangqingBossId);
		list.add(tuihuoxiangqingCode);
		list.add(tuihuoxiangqingSku);
		List<TuihuoxiangqingPO> poList = new ArrayList<TuihuoxiangqingPO>();
		poList = this.queryForList(sql, list);
		
		if(poList == null || poList.size() == 0){
			return 0;
		}
		
		return poList.get(0).getTuihuoxiangqingInNeed();
	}

	@Override
	public void setInNumber(int tuihuoxiangqingBossId, String tuihuoxiangqingCode, String tuihuoxiangqingSku, int tuihuoxiangqingInOk,
			int tuihuoxiangqingInBroken, int tuihuoxiangqingInLost) {
		// TODO Auto-generated method stub
		String sql = "update kuguan_tuihuorukuinfo set tuihuoxiangqingInOk = ? , tuihuoxiangqingInBroken = ? , tuihuoxiangqingInLost = ? where tuihuoxiangqingCode = ? and tuihuoxiangqingSku = ?";
		List<Object> list = new ArrayList<Object>();
		list.add(tuihuoxiangqingInOk);
		list.add(tuihuoxiangqingInBroken);
		list.add(tuihuoxiangqingInLost);
		list.add(tuihuoxiangqingCode);
		list.add(tuihuoxiangqingSku);
		this.SaveOrUpdate(sql, list);
	}

	@Override
	public void setNote(int tuihuoxiangqingBossId, String tuihuoxiangqingCode, String tuihuoxiangqingSku, String tuihuoxiangqingNote) {
		// TODO Auto-generated method stub
		String sql = "update kuguan_tuihuorukuinfo set tuihuoxiangqingNote = ? where tuihuoxiangqingCode = ? and tuihuoxiangqingSku = ?";
		List<Object> list = new ArrayList<Object>();
		list.add(tuihuoxiangqingNote);
		list.add(tuihuoxiangqingCode);
		list.add(tuihuoxiangqingSku);
		this.SaveOrUpdate(sql, list);
	}


	@Override
	public List<TuihuoxiangqingPO> mapRow(ResultSet rs){
		// TODO Auto-generated method stub
		List<TuihuoxiangqingPO> list = new ArrayList<TuihuoxiangqingPO>();
		TuihuoxiangqingPO po = null;
		try {
			while(rs.next()){
				po = PersistentObjectFactory.getTuihuoxiangqingPO();
				po.setTuihuoxiangqingCode(rs.getString("tuihuoxiangqingCode"));
				po.setTuihuoxiangqingSku(rs.getString("tuihuoxiangqingSku"));
				po.setTuihuoxiangqingName(rs.getString("tuihuoxiangqingName"));
				po.setTuihuoxiangqingAttribute(rs.getString("tuihuoxiangqingAttribute"));
				po.setTuihuoxiangqingWarehouse(rs.getString("tuihuoxiangqingWarehouse"));
				po.setTuihuoxiangqingInNeed(rs.getInt("tuihuoxiangqingInNeed"));
				po.setTuihuoxiangqingInOk(rs.getInt("tuihuoxiangqingInOk"));
				po.setTuihuoxiangqingInBroken(rs.getInt("tuihuoxiangqingInBroken"));
				po.setTuihuoxiangqingInLost(rs.getInt("tuihuoxiangqingInLost"));
				po.setTuihuoxiangqingNote(rs.getString("tuihuoxiangqingNote"));
				list.add(po);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
