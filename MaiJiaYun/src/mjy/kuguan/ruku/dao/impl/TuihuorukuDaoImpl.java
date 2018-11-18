package mjy.kuguan.ruku.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mjy.caigou.dao.WarehouseDao;
import mjy.caigou.dao.impl.WarehouseDaoImpl;
import mjy.common.util.jdbc.BaseDao;
import mjy.kuguan.ruku.dao.TuihuorukuDao;
import mjy.kuguan.ruku.factory.DaoImplFactory;
import mjy.kuguan.ruku.factory.PersistentObjectFactory;
import mjy.kuguan.ruku.po.TuihuorukuPO;
import mjy.login.dao.UserDao;
import mjy.login.dao.impl.UserDaoImpl;

public class TuihuorukuDaoImpl extends BaseDao<TuihuorukuPO> implements TuihuorukuDao{
	WarehouseDao warehouseDao = new WarehouseDaoImpl();
	UserDao userDao = new UserDaoImpl();

	@Override
	public void getInsert(int tuihuoBossId, TuihuorukuPO tuihuorukuPO) {
		// TODO Auto-generated method stub
		String sql = "insert into kuguan_tuihuoruku values(?,?,?,?,?,?,?,?,?,?)";
		List<Object> list = new ArrayList<Object>();
		list.add(Thread.currentThread().hashCode() + "-" +System.currentTimeMillis());
		list.add(tuihuoBossId);
		list.add(tuihuorukuPO.getTuihuoCode());
		list.add(tuihuorukuPO.getTuihuoTuihuodanCode());
		list.add(Integer.parseInt(tuihuorukuPO.getTuihuoWarehouse()));
		list.add(tuihuorukuPO.getTuihuoInCount());
		list.add(tuihuorukuPO.getTuihuoInFinish());
		list.add(tuihuorukuPO.getTuihuoSetTime());
		list.add(Integer.parseInt(tuihuorukuPO.getTuihuoAuthor()));
		list.add(tuihuorukuPO.getTuihuoNote());
		this.queryForList(sql, list);
	}

	@Override
	public List<TuihuorukuPO> getSelectByCode(int tuihuoBossId, String tuihuoCode, int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		String sql = "select * from kuguan_tuihuoruku where tuihuoBossId = ? and tuihuoCode like ? limit ?,?";
		List<Object> list = new ArrayList<Object>();
		list.add(tuihuoBossId);
		list.add("%" + tuihuoCode + "%");
		list.add((pageNumber - 1) * pageSize);	//开始
		list.add(pageSize);
		List<TuihuorukuPO> poList = new ArrayList<TuihuorukuPO>();
		poList = this.queryForList(sql, list);
		
		for (TuihuorukuPO po : poList) {
			po.setTuihuoWarehouse(warehouseDao.queryNameById(Integer.parseInt(po.getTuihuoWarehouse())));
			po.setTuihuoAuthor(userDao.getUserInfo(Integer.parseInt(po.getTuihuoAuthor())).getUserNickname());
		}
		
		return poList;
	}

	@Override
	public List<TuihuorukuPO> getSelectByTuihuodanCode(int tuihuoBossId, String tuihuoTuihuodanCode, int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		String sql = "select * from kuguan_tuihuoruku where tuihuoBossId = ? and tuihuoTuihuodanCode like ? limit ?,?";
		List<Object> list = new ArrayList<Object>();
		list.add(tuihuoBossId);
		list.add("%" + tuihuoTuihuodanCode + "%");
		list.add((pageNumber - 1) * pageSize);	//开始
		list.add(pageSize);
		List<TuihuorukuPO> poList = new ArrayList<TuihuorukuPO>();
		poList = this.queryForList(sql, list);
		
		for (TuihuorukuPO po : poList) {
			po.setTuihuoWarehouse(warehouseDao.queryNameById(Integer.parseInt(po.getTuihuoWarehouse())));
			po.setTuihuoAuthor(userDao.getUserInfo(Integer.parseInt(po.getTuihuoAuthor())).getUserNickname());
		}
		
		return poList;
	}

	@Override
	public List<TuihuorukuPO> getSelectByAuthor(int tuihuoBossId, String tuihuoAuthor, int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		List<Integer> idList = DaoImplFactory.getRukuUserDaoImpl().getSelectIdByName(tuihuoAuthor);
		int idIndex = 0;

		if(idList.size() == 0){
			return null;
		}
		
		List<TuihuorukuPO> poList = null;
		while(poList == null || poList.size() == 0){
			int tuihuoAuthorId = idList.get(idIndex);
			
			String sql = "select * from kuguan_tuihuoruku where tuihuoBossId = ? and tuihuoAuthor = ? limit ?,?";
			List<Object> list = new ArrayList<Object>();
			list.add(tuihuoBossId);
			list.add(tuihuoAuthorId);
			list.add((pageNumber - 1) * pageSize);	//开始
			list.add(pageSize);
			poList = this.queryForList(sql, list);
		}
		
		for (TuihuorukuPO po : poList) {
			po.setTuihuoWarehouse(warehouseDao.queryNameById(Integer.parseInt(po.getTuihuoWarehouse())));
			po.setTuihuoAuthor(userDao.getUserInfo(Integer.parseInt(po.getTuihuoAuthor())).getUserNickname());
		}

		return poList;
	}

	@Override
	public List<TuihuorukuPO> getSelectByWarehouse(int tuihuoBossId, String tuihuoWarehouse, int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		List<Integer> idList = DaoImplFactory.getRukuWarehouseDaoImpl().getSelectIdByName(tuihuoWarehouse);
		int idIndex = 0;
		
		if(idList.size() == 0){
			return null;
		}
		
		List<TuihuorukuPO> poList = null;
		while(poList == null || poList.size() == 0){
			int tuihuoWarehouseId = idList.get(idIndex);

			String sql = "select * from kuguan_tuihuoruku where tuihuoBossId = ? and tuihuoWarehouse = ? limit ?,?";
			List<Object> list = new ArrayList<Object>();
			list.add(tuihuoBossId);
			list.add(tuihuoWarehouseId);
			list.add((pageNumber - 1) * pageSize);	//开始
			list.add(pageSize);
			poList = new ArrayList<TuihuorukuPO>();
			poList = this.queryForList(sql, list);			
		}
		
		for (TuihuorukuPO po : poList) {
			po.setTuihuoWarehouse(warehouseDao.queryNameById(Integer.parseInt(po.getTuihuoWarehouse())));
			po.setTuihuoAuthor(userDao.getUserInfo(Integer.parseInt(po.getTuihuoAuthor())).getUserNickname());
		}
		
		return poList;
	}

	@Override
	public String getWarehouseByCode(int tuihuoBossId, String tuihuoCode) {
		// TODO Auto-generated method stub
		String sql = "select * from kuguan_tuihuoruku where tuihuoBossId = ? and tuihuoCode = ?";
		List<Object> list = new ArrayList<Object>();
		list.add(tuihuoBossId);
		list.add(tuihuoCode);
		List<TuihuorukuPO> poList = new ArrayList<TuihuorukuPO>();
		poList = this.queryForList(sql, list);
		
		if(poList == null || poList.size() == 0){
			return null;
		}
		
		return warehouseDao.queryNameById(Integer.parseInt(poList.get(0).getTuihuoWarehouse()));
	}

	@Override
	public List<TuihuorukuPO> getSelectAll(int tuihuoBossId, int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		String sql = "select * from kuguan_tuihuoruku where tuihuoBossId = ? limit ?,?";
		List<Object> list = new ArrayList<Object>();
		list.add(tuihuoBossId);
		list.add((pageNumber - 1) * pageSize);
		list.add(pageSize);
		List<TuihuorukuPO> poList = new ArrayList<TuihuorukuPO>();
		poList = this.queryForList(sql, list);
		
		for (TuihuorukuPO po : poList) {
			po.setTuihuoWarehouse(warehouseDao.queryNameById(Integer.parseInt(po.getTuihuoWarehouse())));
			po.setTuihuoAuthor(userDao.getUserInfo(Integer.parseInt(po.getTuihuoAuthor())).getUserNickname());
		}
		
		return poList;
	}

	@Override
	public int getAllCount(int tuihuoBossId) {
		// TODO Auto-generated method stub
		String sql = "select * from kuguan_tuihuoruku where tuihuoBossId = ?";
		List<Object> list = new ArrayList<Object>();
		list.add(tuihuoBossId);
		List<TuihuorukuPO> poList = new ArrayList<TuihuorukuPO>();
		poList = this.queryForList(sql, list);
		
		return poList.size();
	}

	@Override
	public List<String> getAllWarehouse(int tuihuoBossId) {
		// TODO Auto-generated method stub
		String sql = "select * from kuguan_tuihuoruku group by tuihuoWarehouse";
		List<Object> list = new ArrayList<Object>();
		List<TuihuorukuPO> poList = new ArrayList<TuihuorukuPO>();
		poList = this.queryForList(sql, list);
		
		if(poList == null || poList.size() == 0){
			return null;
		}
		
		List<String> resultList = new ArrayList<String>();
		for (TuihuorukuPO po : poList) {
			resultList.add(warehouseDao.queryNameById(Integer.parseInt(po.getTuihuoWarehouse())));
		}
		
		return resultList;
	}

	@Override
	public void setInFinish(int tuihuoBossId, String tuihuoCode, int tuihuoInFinish) {
		// TODO Auto-generated method stub
		String sql = "update kuguan_tuihuoruku set tuihuoInFinish = ? where tuihuoBossId = ? and tuihuoCode = ?";
		List<Object> list = new ArrayList<Object>();
		list.add(tuihuoInFinish);
		list.add(tuihuoBossId);
		list.add(tuihuoCode);
		this.SaveOrUpdate(sql, list);
	}

	@Override
	public void setNote(int tuihuoBossId, String tuihuoCode, String tuihuoNote) {
		// TODO Auto-generated method stub
		String sql = "update kuguan_tuihuoruku set tuihuoNote = ? where tuihuoBossId = ? and tuihuoCode = ?";
		List<Object> list = new ArrayList<Object>();
		list.add(tuihuoNote);
		list.add(tuihuoBossId);
		list.add(tuihuoCode);
		this.SaveOrUpdate(sql, list);
	}

	@Override
	public List<TuihuorukuPO> mapRow(ResultSet rs){
		// TODO Auto-generated method stub
		List<TuihuorukuPO> list = new ArrayList<TuihuorukuPO>();
		TuihuorukuPO po = null;
		try {
			while(rs.next()){
				po = PersistentObjectFactory.getTuihuorukuPO();
				po.setTuihuoCode(rs.getString("tuihuoCode"));
				po.setTuihuoTuihuodanCode(rs.getString("tuihuoTuihuodanCode"));
				po.setTuihuoWarehouse(rs.getString("tuihuoWarehouse"));
				po.setTuihuoInCount(rs.getInt("tuihuoInCount"));
				po.setTuihuoInFinish(rs.getInt("tuihuoInFinish"));
				po.setTuihuoSetTime(rs.getString("tuihuoSetTime"));
				po.setTuihuoAuthor(rs.getString("tuihuoAuthor"));
				po.setTuihuoNote(rs.getString("tuihuoNote"));
				list.add(po);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
