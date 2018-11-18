package mjy.kuguan.ruku.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.common.util.jdbc.BaseDao;
import mjy.kuguan.ruku.dao.WanchengDao;
import mjy.kuguan.ruku.po.WanchengPO;
import mjy.login.dao.UserDao;
import mjy.login.dao.impl.UserDaoImpl;

public class WanchengDaoImpl extends BaseDao<WanchengPO> implements WanchengDao {

	@Override
	public List<WanchengPO> mapRow(ResultSet rs) throws Exception {
		List<WanchengPO> wanchengs = new ArrayList<>();
		WanchengPO wanchengss = null;
		while (rs.next()) {
			wanchengss = new WanchengPO();
			wanchengss.setWanchengCode(rs.getString("wanchengCode"));
			wanchengss.setWanchengXiangguanCode(rs.getString("wanchengXiangguanCode"));
			wanchengss.setWanchengType(rs.getString("wanchengType"));
			wanchengss.setWanchengInCount(rs.getInt("wanchengInCount"));
			wanchengss.setWanchengSetTime(rs.getString("wanchengSetTime"));
			wanchengss.setWanchengAuthor(rs.getString("wanchengAuthor"));
			wanchengss.setWanchengChecker(rs.getString("wanchengChecker"));
			wanchengss.setWanchengCheckTime(rs.getString("wanchengCheckTime"));
			wanchengss.setWanchengNote(rs.getString("wanchengNote"));
			wanchengs.add(wanchengss);
		}
		return wanchengs;
	}

	// ��ⵥ��Ų�ѯ
	@Override
	public List<WanchengPO> listByRkd(int wanchengBossId, String rkd, int pageNumber, int pageSize) {
		// ���sql���ִ�еĲ���
		List<Object> params = new ArrayList<Object>();
		if (rkd == null || rkd.equals("")) {

			String sql = "select * from kuguan_rukuwancheng where wanchengBossId = ?  limit ?,?";
			params.add(wanchengBossId);
			params.add((pageNumber - 1) * pageSize);// ��ǰҳ�濪ʼ������
			params.add(pageSize);// ��ǰҳ��
			return this.queryForList(sql, params);
		} else {

			// ���ݲ�ѯ����д��Ҫִ�е�sql���

			String sql = "select * from kuguan_rukuwancheng where wanchengBossId = ? and wanchengCode like ? limit ?,? ";
			params.add(wanchengBossId);
			params.add("%" + rkd + "%");
			params.add((pageNumber - 1) * pageSize);// ��ǰҳ�濪ʼ������
			params.add(pageSize);// ��ǰҳ��

			return this.queryForList(sql, params);
		}
	}

	// ��ص��ݺŲ�ѯ
	@Override
	public List<WanchengPO> listByDjh(int wanchengBossId, String djh, int pageNumber, int pageSize) {
		// ���sql���ִ�еĲ���
		List<Object> params = new ArrayList<Object>();
		if (djh == null || djh.equals("")) {

			String sql = "select * from kuguan_rukuwancheng where wanchengBossId = ? limit ?,?";
			params.add(wanchengBossId);
			params.add((pageNumber - 1) * pageSize);// ��ǰҳ�濪ʼ������
			params.add(pageSize);// ��ǰҳ��

			return this.queryForList(sql, params);
		} else

		{
			// ���ݲ�ѯ����д��Ҫִ�е�sql���
			String sql = "select * from kuguan_rukuwancheng where wanchengBossId = ? and wanchengXiangguanCode like ? limit ?,? ";
			params.add(wanchengBossId);
			params.add("%" + djh + "%");
			params.add((pageNumber - 1) * pageSize);
			params.add(pageSize);
			return this.queryForList(sql, params);
		}
	}

	// �Ƶ��˲�ѯ
	@Override
	public List<WanchengPO> listByZdr(int wanchengBossId, String zdr, int pageNumber, int pageSize) {

		// ���sql���ִ�еĲ���
		List<Object> params = new ArrayList<Object>();
		if (zdr == null || zdr.equals("")) {

			String sql = "select * from kuguan_rukuwancheng where wanchengBossId = ? limit ?,?";
			params.add(wanchengBossId);
			params.add((pageNumber - 1) * pageSize);// ��ǰҳ�濪ʼ������
			params.add(pageSize);// ��ǰҳ��
			this.queryForList(sql, params);

		} else {
			RukuUserDaoImpl userDaoImpl = new RukuUserDaoImpl();
			List<Integer> idList = userDaoImpl.getSelectIdByName(zdr);
			int index = 0;
			if (idList.size() == 0 || idList == null) {
				return null;
			}
			List<WanchengPO> poList = new ArrayList<>();
			for (Integer integer : idList) {
				String sql = "select * from kuguan_rukuwancheng where wanchengBossId = ? and wanchengAuthor like ? limit ?,? ";
				params.add(wanchengBossId);
				params.add(integer);
				params.add((pageNumber - 1) * pageSize);// ��ǰҳ�濪ʼ������
				params.add(pageSize);// ��ǰҳ��

				poList.addAll(this.queryForList(sql, params));

			}
			
			return poList.subList(0, poList.size()<pageSize?poList.size():pageSize);

		}
		List<WanchengPO> wcList = null;
		// ���ݲ�ѯ����д��Ҫִ�е�sql���

		return null;

	}

	@Override
	public int getTotalCount(int wanchengBossId) {
		// ���sql���ִ�еĲ���
		List<Object> params = new ArrayList<Object>();

		String sql = "select * from kuguan_rukuwancheng where wanchengBossId = ?";
		params.add(wanchengBossId);
		
		return this.queryForList(sql, params) == null ? 0 : this.queryForList(sql, params).size();
	}
	
	
}
