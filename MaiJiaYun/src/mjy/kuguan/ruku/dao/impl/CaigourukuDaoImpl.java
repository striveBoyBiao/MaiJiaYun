package mjy.kuguan.ruku.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import mjy.caigou.dao.WarehouseDao;
import mjy.caigou.dao.impl.WarehouseDaoImpl;
import mjy.common.util.jdbc.BaseDao;
import mjy.kuguan.ruku.dao.CaigourukuDao;
import mjy.kuguan.ruku.factory.DaoImplFactory;
import mjy.kuguan.ruku.factory.PersistentObjectFactory;
import mjy.kuguan.ruku.po.CaigourukuPO;
import mjy.login.dao.UserDao;
import mjy.login.dao.impl.UserDaoImpl;

public class CaigourukuDaoImpl extends BaseDao<CaigourukuPO> implements CaigourukuDao{
	private WarehouseDao warehouseDao = new WarehouseDaoImpl();
	private UserDao userDao = new UserDaoImpl();
	
	//Insert备注：唯一id使用线程哈希值+当前毫秒生成；仓库、用户名改使用id进行存储
	@Override
	public void getInsert(int caigouBossId, CaigourukuPO caigourukuPO) {
		String sql = "insert into kuguan_caigouruku values(?,?,?,?,?,?,?,?,?,?)";
		List<Object> list = new ArrayList<Object>();
		list.add(Thread.currentThread().hashCode() + "-" + System.currentTimeMillis());
		list.add(caigouBossId);
		list.add(caigourukuPO.getCaigouCode());
		list.add(caigourukuPO.getCaigouCaigoudanCode());
		list.add(Integer.parseInt(caigourukuPO.getCaigouWarehouse()));		list.add(caigourukuPO.getCaigouInCount());
		list.add(caigourukuPO.getCaigouInFinish());
		list.add(caigourukuPO.getCaigouSetTime());
		list.add(Integer.parseInt(caigourukuPO.getCaigouAuthor()));
		list.add(caigourukuPO.getCaigouNote());
		this.SaveOrUpdate(sql, list);
	}

	@Override
	public void getDelete(int caigouBossId, String caigouCode) {
		// TODO Auto-generated method stub
		String sql = "delete from kuguan_caigouruku where caigouBossId = ? and caigouCode = ?";
		List<Object> list = new ArrayList<Object>();
		list.add(caigouBossId);
		list.add(caigouCode);
		this.SaveOrUpdate(sql, list);
	}

	@Override
	public List<CaigourukuPO> getSelectByCode(int caigouBossId, String caigouCode, int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		String sql = "select * from kuguan_caigouruku where caigouBossId = ? and caigouCode like ? limit ?,?";
		List<Object> list = new ArrayList<Object>();
		list.add(caigouBossId);
		list.add("%" + caigouCode + "%");
		list.add((pageNumber - 1) * pageSize);
		list.add(pageSize);
		List<CaigourukuPO> poList = new ArrayList<CaigourukuPO>();
		poList = this.queryForList(sql, list); 
		
		for (CaigourukuPO po : poList) {
			po.setCaigouWarehouse(warehouseDao.queryNameById(Integer.parseInt(po.getCaigouWarehouse())));
			po.setCaigouAuthor(userDao.getUserInfo(Integer.parseInt(po.getCaigouAuthor())).getUserNickname());
		}
		
		return poList;
	}

	@Override
	public List<CaigourukuPO> getSelectByCaigoudanCode(int caigouBossId, String caigouCaigoudanCode, int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		String sql = "select * from kuguan_caigouruku where caigouBossId = ? and caigouCaigoudanCode like ? limit ?,?";
		List<Object> list = new ArrayList<Object>();
		list.add(caigouBossId);
		list.add("%" + caigouCaigoudanCode + "%");
		list.add((pageNumber - 1) * pageSize);
		list.add(pageSize);
		List<CaigourukuPO> poList = new ArrayList<CaigourukuPO>();
		poList = this.queryForList(sql, list);
		
		for (CaigourukuPO po : poList) {
			po.setCaigouWarehouse(warehouseDao.queryNameById(Integer.parseInt(po.getCaigouWarehouse())));
			po.setCaigouAuthor(userDao.getUserInfo(Integer.parseInt(po.getCaigouAuthor())).getUserNickname());
		}
		
		return poList;
	}

	@Override
	public List<CaigourukuPO> getSelectByAuthor(int caigouBossId, String caigouAuthor, int pageNumber, int pageSize) {
		// 首先根据昵称在User表进行模糊查询，搜索符合条件的昵称的对应Id列表，将列表中的id与库中id匹配
		List<Integer> idList = DaoImplFactory.getRukuUserDaoImpl().getSelectIdByName(caigouAuthor);
		int idIndex = 0;
		
		if(idList.size() == 0){
			return null;
		}
		
		List<CaigourukuPO> poList = null;
		while(poList == null || poList.size() == 0){
			String caigouAuthorId = idList.get(idIndex) + "";
			
			String sql = "select * from kuguan_caigouruku where caigouBossId = ? and caigouAuthor = ? limit ?,?";
			List<Object> list = new ArrayList<Object>();
			list.add(caigouBossId);
			list.add(caigouAuthorId);
			list.add((pageNumber - 1) * pageSize);
			list.add(pageSize);
			poList = this.queryForList(sql, list);
		}
		
		for (CaigourukuPO po : poList) {
			po.setCaigouWarehouse(warehouseDao.queryNameById(Integer.parseInt(po.getCaigouWarehouse())));
			po.setCaigouAuthor(userDao.getUserInfo(Integer.parseInt(po.getCaigouAuthor())).getUserNickname());
		}
		
		return poList;
	}

	@Override
	public List<CaigourukuPO> getSelectByWarehouse(int caigouBossId, String caigouWarehouse, int pageNumber, int pageSize) {
		// 首先根据仓库名在Warehouse表进行模糊查询，搜索符合条件的仓库名的对应Id列表，将列表中的id与库中id匹配
		List<Integer> idList = DaoImplFactory.getRukuWarehouseDaoImpl().getSelectIdByName(caigouWarehouse);
		int idIndex = 0;
		
		if(idList.size() == 0){
			return null;
		}
		
		List<CaigourukuPO> poList = null;
		while(poList == null || poList.size() == 0){
			String caigouWarehouseId = idList.get(idIndex) + "";
			
			String sql = "select * from kuguan_caigouruku where caigouBossId = ? and caigouWarehouse = ? limit ?,?";
			List<Object> list = new ArrayList<Object>();
			list.add(caigouBossId);
			list.add(caigouWarehouseId);
			list.add((pageNumber - 1) * pageSize);
			list.add(pageSize);
			poList = new ArrayList<CaigourukuPO>();
			poList = this.queryForList(sql, list);
		}
		
		for (CaigourukuPO po : poList) {
			po.setCaigouWarehouse(warehouseDao.queryNameById(Integer.parseInt(po.getCaigouWarehouse())));
			po.setCaigouAuthor(userDao.getUserInfo(Integer.parseInt(po.getCaigouAuthor())).getUserNickname());
		}
		
		return poList;
	}

	@Override
	public int getAllCount(int caigouBossId) {
		// TODO Auto-generated method stub
		String sql = "select * from kuguan_caigouruku where caigouBossId = ?";
		List<Object> list = new ArrayList<Object>();
		list.add(caigouBossId);
		List<CaigourukuPO> poList = new ArrayList<CaigourukuPO>();
		poList = this.queryForList(sql, list);

		return poList.size();
	}

	@Override
	public List<String> getAllWarehouse(int caigouBossId) {
		// TODO Auto-generated method stub
		String sql = "select * from kuguan_caigouruku where caigouBossId = ? group by caigouWarehouse";
		List<Object> list = new ArrayList<Object>();
		list.add(caigouBossId);
		List<CaigourukuPO> poList = new ArrayList<CaigourukuPO>();
		poList = this.queryForList(sql, list);
		
		WarehouseDaoImpl warehouseDaoImpl = new WarehouseDaoImpl();
		List<String> resultList = new ArrayList<String>();
		for (CaigourukuPO po : poList) {
			resultList.add(warehouseDaoImpl.queryNameById(Integer.parseInt(po.getCaigouWarehouse())));
		}
		
		return resultList;
	}

	@Override
	public void setInFinish(int caigouBossId, String caigouCode, int caigouInFinish) {
		// TODO Auto-generated method stub
		String sql = "update kuguan_caigouruku set caigouInFinish = ? where caigouBossId = ? and caigouCode = ?";
		List<Object> list = new ArrayList<Object>();
		list.add(caigouInFinish);
		list.add(caigouBossId);
		list.add(caigouCode);
		this.SaveOrUpdate(sql, list);
	}

	@Override
	public void setNote(int caigouBossId, String caigouCode, String caigouNote) {
		// TODO Auto-generated method stub
		String sql = "update kuguan_caigouruku set caigouNote = ? where caigouBossId = ? and caigouCode = ?";
		List<Object> list = new ArrayList<Object>();
		list.add(caigouNote);
		list.add(caigouBossId);
		list.add(caigouCode);
		this.SaveOrUpdate(sql, list);
	}

	@Override
	public String getWarehouseByCode(int caigouBossId, String caigouCode) {
		// TODO Auto-generated method stub
		String sql = "select caigouWarehouse from kuguan_caigouruku where caigouBossId = ? and caigouCode = ?";
		List<Object> list = new ArrayList<Object>();
		list.add(caigouBossId);
		list.add(caigouCode);
		List<CaigourukuPO> resultList = new ArrayList<CaigourukuPO>();
		resultList = this.queryForList(sql, list);
		
		if(resultList == null || resultList.size() == 0){
			return null;
		}
		
		return warehouseDao.queryNameById(Integer.parseInt(resultList.get(0).getCaigouWarehouse()));
	}

	@Override
	public List<CaigourukuPO> getSelectAll(int caigouBossId, int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		String sql = "select * from kuguan_caigouruku where caigouBossId = ? limit ?,?";
		List<Object> list = new ArrayList<Object>();
		list.add(caigouBossId);
		list.add((pageNumber - 1) * pageSize);	//开始
		list.add(pageSize);		//结束
		List<CaigourukuPO> poList = new ArrayList<CaigourukuPO>();
		poList = this.queryForList(sql, list);
		
		for (CaigourukuPO po : poList) {
			po.setCaigouWarehouse(warehouseDao.queryNameById(Integer.parseInt(po.getCaigouWarehouse())));
			po.setCaigouAuthor(userDao.getUserInfo(Integer.parseInt(po.getCaigouAuthor())).getUserNickname());
		}
		
		return poList;
	}

	@Override
	public List<CaigourukuPO> mapRow(ResultSet rs){

		// TODO Auto-generated method stub
		List<CaigourukuPO> list = new ArrayList<CaigourukuPO>();
		CaigourukuPO po = null;
		try {
			while(rs.next()){
				po = PersistentObjectFactory.getCaigourukuPO();
				po.setCaigouCode(rs.getString("caigouCode"));
				po.setCaigouCaigoudanCode(rs.getString("caigouCaigoudanCode"));
				po.setCaigouWarehouse(rs.getString("caigouWarehouse"));
				po.setCaigouInCount(rs.getInt("caigouInCount"));
				po.setCaigouInFinish(rs.getInt("caigouInFinish"));
				po.setCaigouSetTime(rs.getString("caigouSetTime"));
				po.setCaigouAuthor(rs.getString("caigouAuthor"));
				po.setCaigouNote(rs.getString("caigouNote"));
				list.add(po);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
		
}
