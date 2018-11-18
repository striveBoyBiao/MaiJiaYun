package mjy.kuguan.ruku.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mjy.caigou.dao.WarehouseDao;
import mjy.caigou.dao.impl.WarehouseDaoImpl;
import mjy.common.util.jdbc.BaseDao;
import mjy.kuguan.ruku.dao.DiaoborukuDao;
import mjy.kuguan.ruku.factory.DaoImplFactory;
import mjy.kuguan.ruku.factory.PersistentObjectFactory;
import mjy.kuguan.ruku.po.DiaoborukuPO;
import mjy.login.dao.UserDao;
import mjy.login.dao.impl.UserDaoImpl;

public class DiaoborukuDaoImpl extends BaseDao<DiaoborukuPO> implements DiaoborukuDao{
	private WarehouseDao warehouseDao = new WarehouseDaoImpl();
	private UserDao userDao = new UserDaoImpl();
	
	@Override
	public void getInsert(int diaoboBossId, DiaoborukuPO diaoborukuPO) {
		// TODO Auto-generated method stub
		String sql = "insert into kuguan_diaoboruku values(?,?,?,?,?,?,?,?,?,?)";
		List<Object> list = new ArrayList<Object>();
		list.add(Thread.currentThread().hashCode() + "-" + System.currentTimeMillis());
		list.add(diaoboBossId);
		list.add(diaoborukuPO.getDiaoboCode());
		list.add(diaoborukuPO.getDiaoboDiaobodanCode());
		list.add(Integer.parseInt(diaoborukuPO.getDiaoboWarehouse()));
		list.add(diaoborukuPO.getDiaoboInCount());
		list.add(diaoborukuPO.getDiaoboInFinish());
		list.add(diaoborukuPO.getDiaoboSetTime());
		list.add(Integer.parseInt(diaoborukuPO.getDiaoboAuthor()));
		list.add(diaoborukuPO.getDiaoboNote());
		this.SaveOrUpdate(sql, list);
	}

	@Override
	public List<DiaoborukuPO> getSelectByCode(int diaoboBossId, String diaoboCode, int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		String sql = "select * from kuguan_diaoboruku where diaoboBossId = ? and diaoboCode like ? limit ?,?";
		List<Object> list = new ArrayList<Object>();
		list.add(diaoboBossId);
		list.add("%" + diaoboCode + "%");
		list.add((pageNumber - 1) * pageSize);
		list.add(pageSize);
		List<DiaoborukuPO> poList = new ArrayList<DiaoborukuPO>();
		poList = this.queryForList(sql, list);
			
		for (DiaoborukuPO po : poList) {
			po.setDiaoboWarehouse(warehouseDao.queryNameById(Integer.parseInt(po.getDiaoboWarehouse())));
			po.setDiaoboAuthor(userDao.getUserInfo(Integer.parseInt(po.getDiaoboAuthor())).getUserNickname());
		}
		
		return poList;
	}

	@Override
	public List<DiaoborukuPO> getSelectByDiaobodanCode(int diaoboBossId, String diaoboDiaobodanCode, int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		String sql = "select * from kuguan_diaoboruku where diaoboBossId = ? and diaoboDiaobodanCode like ? limit ?,?";
		List<Object> list = new ArrayList<Object>();
		list.add(diaoboBossId);
		list.add("%" + diaoboDiaobodanCode + "%");
		list.add((pageNumber - 1) * pageSize);
		list.add(pageSize);
		List<DiaoborukuPO> poList = new ArrayList<DiaoborukuPO>();
		poList = this.queryForList(sql, list);
		
		for (DiaoborukuPO po : poList) {
			po.setDiaoboWarehouse(warehouseDao.queryNameById(Integer.parseInt(po.getDiaoboWarehouse())));
			po.setDiaoboAuthor(userDao.getUserInfo(Integer.parseInt(po.getDiaoboAuthor())).getUserNickname());
		}
		
		return poList;
	}

	@Override
	public List<DiaoborukuPO> getSelectByAuthor(int diaoboBossId, String diaoboAuthor, int pageNumber, int pageSize) {
		List<Integer> idList = DaoImplFactory.getRukuUserDaoImpl().getSelectIdByName(diaoboAuthor);
		int idIndex = 0;
		
		if(idList.size() == 0){
			return null;
		}
		
		List<DiaoborukuPO> poList = null;
		while(poList == null || poList.size() == 0){
			int diaoboAuthorId = idList.get(idIndex);
			
			String sql = "select * from kuguan_diaoboruku where diaoboBossId = ? and diaoboAuthor = ? limit ?,?";
			List<Object> list = new ArrayList<Object>();
			list.add(diaoboBossId);
			list.add(diaoboAuthorId);
			list.add((pageNumber - 1) * pageSize);
			list.add(pageSize);
			poList = this.queryForList(sql, list);	
		}
		
		for (DiaoborukuPO po : poList) {
			po.setDiaoboWarehouse(warehouseDao.queryNameById(Integer.parseInt(po.getDiaoboWarehouse())));
			po.setDiaoboAuthor(userDao.getUserInfo(Integer.parseInt(po.getDiaoboAuthor())).getUserNickname());
		}
		
		return poList;
	}

	@Override
	public List<DiaoborukuPO> getSelectByWarehouse(int diaoboBossId, String diaoboWarehouse, int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		List<Integer> idList = DaoImplFactory.getRukuWarehouseDaoImpl().getSelectIdByName(diaoboWarehouse);
		int idIndex = 0;
		
		if(idList == null || idList.size() == 0){
			return null;
		}
		
		List<DiaoborukuPO> poList = null;
		while(poList == null || poList.size() == 0){
			int diaoboWarehouseId = idList.get(idIndex);
			
			String sql = "select * from kuguan_diaoboruku where diaoboBossId = ? and diaoboWarehouse = ? limit ?,?";
			List<Object> list = new ArrayList<Object>();
			list.add(diaoboBossId);
			list.add(diaoboWarehouseId);
			list.add((pageNumber - 1) * pageSize);
			list.add(pageSize);
			poList = new ArrayList<DiaoborukuPO>();
			poList = this.queryForList(sql, list);
		}
		
		for (DiaoborukuPO po : poList) {
			po.setDiaoboWarehouse(warehouseDao.queryNameById(Integer.parseInt(po.getDiaoboWarehouse())));
			po.setDiaoboAuthor(userDao.getUserInfo(Integer.parseInt(po.getDiaoboAuthor())).getUserNickname());
		}
		
		return poList;
	}

	@Override
	public List<DiaoborukuPO> getSelectAll(int diaoboBossId, int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		String sql = "select * from kuguan_diaoboruku where diaoboBossId = ? limit ?,?";
		List<Object> list = new ArrayList<Object>();
		list.add(diaoboBossId);
		list.add((pageNumber - 1) * pageSize);
		list.add(pageSize);
		List<DiaoborukuPO> poList = new ArrayList<DiaoborukuPO>();
		poList = this.queryForList(sql, list);		
		
		for (DiaoborukuPO po : poList) {
			po.setDiaoboWarehouse(warehouseDao.queryNameById(Integer.parseInt(po.getDiaoboWarehouse())));
			po.setDiaoboAuthor(userDao.getUserInfo(Integer.parseInt(po.getDiaoboAuthor())).getUserNickname());
		}
		
		return poList;
	}

	@Override
	public int getAllCount(int diaoboBossId) {
		// TODO Auto-generated method stub;
		String sql = "select * from kuguan_diaoboruku where diaoboBossId = ?";
		List<Object> list = new ArrayList<Object>();
		list.add(diaoboBossId);
		List<DiaoborukuPO> poList = new ArrayList<DiaoborukuPO>();
		poList = this.queryForList(sql, list);
		
		if(poList == null){
			return 0;
		}
		
		return poList.size();
	}
	
	@Override 
	public List<String> getAllWarehouse(int diaoboBossId) {
		// TODO Auto-generated method stub
		String sql = "select * from kuguan_diaoboruku where diaoboBossId = ? group by diaoboWarehouse";
		List<Object> list = new ArrayList<Object>();
		list.add(diaoboBossId);
		List<DiaoborukuPO> poList = new ArrayList<DiaoborukuPO>();
		poList = this.queryForList(sql, list);
		
		List<String> resultList = new ArrayList<String>();
		for (DiaoborukuPO po : poList) {
			resultList.add(warehouseDao.queryNameById(Integer.parseInt(po.getDiaoboWarehouse())));
		}
		
		return resultList;
	}

	@Override
	public void setInFinish(int diaoboBossId, String diaoboCode, int diaoboInFinish) {
		// TODO Auto-generated method stub
		String sql = "update kuguan_diaoboruku set diaoboInFinish = ? where diaoboBossId = ? and diaoboCode = ?";
		List<Object> list = new ArrayList<Object>();
		list.add(diaoboInFinish);
		list.add(diaoboBossId);
		list.add(diaoboCode);
		this.SaveOrUpdate(sql, list);
	}

	@Override
	public void setNote(int diaoboBossId, String diaoboCode, String diaoboNote) {
		// TODO Auto-generated method stub
		String sql = "update kuguan_diaoboruku set diaoboNote = ? where diaoboBossId = ? and diaoboCode = ?";
		List<Object> list = new ArrayList<Object>();
		list.add(diaoboNote);
		list.add(diaoboBossId);
		list.add(diaoboCode);
		this.SaveOrUpdate(sql, list);
	}
	
	@Override
	public int getCountByCode(int diaoboBossId, String diaoboCode) {
		// TODO Auto-generated method stub
		String sql = "select * from kuguan_diaoboruku where diaoboBossId = ? and diaoboCode like ?";
		List<Object> list = new ArrayList<Object>();
		list.add(diaoboBossId);
		list.add("%" + diaoboCode + "%");
		List<DiaoborukuPO> poList = new ArrayList<DiaoborukuPO>();
		poList = this.queryForList(sql, list);
		
		if(poList == null){
			return 0;
		}
		
		return poList.size();
	}

	@Override
	public int getCountByDiaobodanCode(int diaoboBossId, String diaoboDiaobodanCode) {
		// TODO Auto-generated method stub
		String sql = "select * from kuguan_diaoboruku where diaoboBossId = ? and diaoboDiaobodanCode like ?";
		List<Object> list = new ArrayList<Object>();
		list.add(diaoboBossId);
		list.add("%" + diaoboDiaobodanCode + "%");
		List<DiaoborukuPO> poList = new ArrayList<DiaoborukuPO>();
		poList = this.queryForList(sql, list);
		
		if(poList == null){
			return 0;
		}
		
		return poList.size();
	}

	@Override
	public int getCountByAuthor(int diaoboBossId, String diaoboAuthor) {
		// TODO Auto-generated method stub
		List<Integer> idList = DaoImplFactory.getRukuUserDaoImpl().getSelectIdByName(diaoboAuthor);
		int idIndex = 0;
		
		if(idList.size() == 0){
			return 0;
		}
		
		List<DiaoborukuPO> poList = null;
		while(poList == null || poList.size() == 0){
			int diaoboAuthorId = idList.get(idIndex);
		
			String sql = "select * from kuguan_diaoboruku where diaoboBossId = ? and diaoboAuthor = ?";
			List<Object> list = new ArrayList<Object>();
			list.add(diaoboBossId);
			list.add(diaoboAuthorId);
			poList = this.queryForList(sql, list);
		}
		
		if(poList == null){
			return 0;
		}
		
		return poList.size();
	}

	@Override
	public int getCountByWarehouse(int diaoboBossId, String diaoboWarehouse) {
		// TODO Auto-generated method stub
		List<Integer> idList = DaoImplFactory.getRukuWarehouseDaoImpl().getSelectIdByName(diaoboWarehouse);
		int idIndex = 0;
		
		if(idList == null || idList.size() == 0){
			return 0;
		}
		
		List<DiaoborukuPO> poList = null;
		while(poList == null || poList.size() == 0){
			int diaoboWarehouseId = idList.get(idIndex);
		
			String sql = "select * from kuguan_diaoboruku where diaoboBossId = ? and diaoboWarehouse = ?";
			List<Object> list = new ArrayList<Object>();
			list.add(diaoboBossId);
			list.add(diaoboWarehouseId);
			poList = this.queryForList(sql, list);
		}
		
		if(poList == null){
			return 0;
		}
		
		return poList.size();
	}

	@Override
	public List<DiaoborukuPO> mapRow(ResultSet rs){
		// TODO Auto-generated method stub
		List<DiaoborukuPO> list = new ArrayList<DiaoborukuPO>();
		DiaoborukuPO po = null;
		try {
			while(rs.next()){
				po = PersistentObjectFactory.getDiaoborukuPO();
				po.setDiaoboCode(rs.getString("diaoboCode"));
				po.setDiaoboDiaobodanCode(rs.getString("diaoboDiaobodanCode"));
				po.setDiaoboWarehouse(rs.getString("diaoboWarehouse"));
				po.setDiaoboInCount(rs.getInt("diaoboInCount"));
				po.setDiaoboInFinish(rs.getInt("diaoboInFinish"));
				po.setDiaoboSetTime(rs.getString("diaoboSetTime"));
				po.setDiaoboAuthor(rs.getString("diaoboAuthor"));
				po.setDiaoboNote(rs.getString("diaoboNote"));
				list.add(po);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
