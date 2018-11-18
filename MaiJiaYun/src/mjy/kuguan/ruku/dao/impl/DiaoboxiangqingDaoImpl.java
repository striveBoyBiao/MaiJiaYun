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
import mjy.kuguan.ruku.dao.DiaoboxiangqingDao;
import mjy.kuguan.ruku.factory.PersistentObjectFactory;
import mjy.kuguan.ruku.po.DiaoboxiangqingPO;

public class DiaoboxiangqingDaoImpl extends BaseDao<DiaoboxiangqingPO> implements DiaoboxiangqingDao{
	private GoodsDao goodsDao = new GoodsDaoImpl();
	private WarehouseDao warehouseDao = new WarehouseDaoImpl();
	
	@Override
	public void getInsert(int diaoboxiangqingBossId, DiaoboxiangqingPO diaoboxiangqingPO) {
		// TODO Auto-generated method stub
		String sql = "insert into kuguan_diaoborukuinfo values(?,?,?,?,?,?,?,?,?,?)";
		List<Object> list = new ArrayList<Object>();
		list.add(Thread.currentThread().hashCode() + "-" + System.currentTimeMillis());
		list.add(diaoboxiangqingBossId);
		list.add(diaoboxiangqingPO.getDiaoboxiangqingCode());
		list.add(diaoboxiangqingPO.getDiaoboxiangqingSku());
		list.add(Integer.parseInt(diaoboxiangqingPO.getDiaoboxiangqingName()));
		list.add(diaoboxiangqingPO.getDiaoboxiangqingAttribute());
		list.add(Integer.parseInt(diaoboxiangqingPO.getDiaoboxiangqingWarehouse()));
		list.add(diaoboxiangqingPO.getDiaoboxiangqingInNeed());
		list.add(diaoboxiangqingPO.getDiaoboxiangqingInFinish());
		list.add(diaoboxiangqingPO.getDiaoboxiangqingNote());
		this.SaveOrUpdate(sql, list);
	}

	@Override
	public List<DiaoboxiangqingPO> getSelectByCode(int diaoboxiangqingBossId, String diaoboxiangqingCode) {
		// TODO Auto-generated method stub
		String sql = "select * from kuguan_diaoborukuinfo where diaoboxiangqingBossId = ? and diaoboxiangqingCode = ?";
		List<Object> list = new ArrayList<Object>();
		list.add(diaoboxiangqingBossId);
		list.add(diaoboxiangqingCode);
		List<DiaoboxiangqingPO> poList = new ArrayList<DiaoboxiangqingPO>();
		poList = this.queryForList(sql, list);
		
		for (DiaoboxiangqingPO po : poList) {
			po.setDiaoboxiangqingName(goodsDao.queryGoodInfoById(Integer.parseInt(po.getDiaoboxiangqingName())).getGoodName());
			po.setDiaoboxiangqingWarehouse(warehouseDao.queryNameById(Integer.parseInt(po.getDiaoboxiangqingWarehouse())));
		}
		
		return poList;
	}

	@Override
	public void setInFinish(int diaoboxiangqingBossId, String diaoboxiangqingCode, String diaoboxiangqingSku, int diaoboxiangqingInFinish) {
		// TODO Auto-generated method stub
		String sql = "update kuguan_diaoborukuinfo set diaoboxiangqingInFinish = ? where diaoboxiangqingBossId = ? and diaoboxiangqingCode = ? and diaoboxiangqingSku = ?";
		List<Object> list = new ArrayList<Object>();
		list.add(diaoboxiangqingInFinish);
		list.add(diaoboxiangqingBossId);
		list.add(diaoboxiangqingCode);
		list.add(diaoboxiangqingSku);
		this.SaveOrUpdate(sql, list);
	}

	@Override
	public void setNote(int diaoboxiangqingBossId, String diaoboxiangqingCode, String diaoboxiangqingSku, String diaoboxiangqingNote) {
		// TODO Auto-generated method stub
		String sql = "update kuguan_diaoborukuinfo set diaoboxiangqingNote = ? where diaoboxiangqingBossId = ? and diaoboxiangqingCode = ? and diaoboxiangqingSku = ?";
		List<Object> list = new ArrayList<Object>();
		list.add(diaoboxiangqingNote);
		list.add(diaoboxiangqingBossId);
		list.add(diaoboxiangqingCode);
		list.add(diaoboxiangqingSku);
		this.SaveOrUpdate(sql, list);
	}

	@Override
	public List<DiaoboxiangqingPO> mapRow(ResultSet rs){
		List<DiaoboxiangqingPO> list = new ArrayList<DiaoboxiangqingPO>();
		DiaoboxiangqingPO po = null;
		try {
			while(rs.next()){
				po = PersistentObjectFactory.getDiaoboxiangqingPO();
				po.setDiaoboxiangqingId(rs.getString("diaoboxiangqingId"));
				po.setDiaoboxiangqingCode(rs.getString("diaoboxiangqingCode"));
				po.setDiaoboxiangqingSku(rs.getString("diaoboxiangqingSku"));
				po.setDiaoboxiangqingName(rs.getString("diaoboxiangqingName"));
				po.setDiaoboxiangqingAttribute(rs.getString("diaoboxiangqingAttribute"));
				po.setDiaoboxiangqingWarehouse(rs.getString("diaoboxiangqingWarehouse"));
				po.setDiaoboxiangqingInNeed(rs.getInt("diaoboxiangqingInNeed"));
				po.setDiaoboxiangqingInFinish(rs.getInt("diaoboxiangqingInFinish"));
				po.setDiaoboxiangqingNote(rs.getString("diaoboxiangqingNote"));
				list.add(po);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
