package mjy.kuguan.diaobo.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import mjy.kuguan.diaobo.dao.DiaobodanDao;
import mjy.kuguan.diaobo.dao.DiaobodanstateDao;
import mjy.kuguan.diaobo.po.DiaobodanPO;
import mjy.kuguan.diaobo.po.DiaobodanstatePO;
import mjy.kuguan.diaobo.po.PageInfo;
import mjy.kuguan.diaobo.vo.DiaobodanstateVO;

public class DiaobodanstateDaoImpl extends BaseDao<DiaobodanstateVO> implements DiaobodanstateDao {

	/**
	 * diaobodanState保存插入操作
	 */
	@Override
	public boolean insert(List<DiaobodanstatePO> diaobodanstatePOs) {
		boolean result = true;
		for (int i = 0; i < diaobodanstatePOs.size(); i++) {
			String sql = "insert into kuguan_diaobodanstate(diaobodanCode,diaobodanCreater,diaobodanOutStore,diaobodanInStore,diaoboState,diaoboBeizhu) value(?,?,?,?,?,?)";

			List<Object> params = new ArrayList<Object>();
			params.add((diaobodanstatePOs.get(i)).getDiaobodanCode());
			params.add((diaobodanstatePOs.get(i)).getDiaobodanCreater());
			params.add((diaobodanstatePOs.get(i)).getDiaobodanOutStore());
			params.add((diaobodanstatePOs.get(i)).getDiaobodanInStore());
			params.add((diaobodanstatePOs.get(i)).getDiaoboState());
			params.add((diaobodanstatePOs.get(i)).getDiaoboBeizhu());
			if (this.SaveOrUpdate(sql, params) == false) {
				result = false;
			}

			// result= this.SaveOrUpdate(sql, params);
		}
		return result;

	}

	@Override
	public List<DiaobodanstateVO> listBy(DiaobodanPO diaobodanPO, PageInfo pageInfo) {
		// 参数集合
		List<Object> params = new ArrayList<>();
						

				//准备sql语句
				String sql = "select * from kuguan_diaobodanstate  where";

	
				if (diaobodanPO != null && diaobodanPO.getDiaobodanCode() != null && !diaobodanPO.getDiaobodanCode().equals("")) {
					sql = sql +" diaoboState !=0"+ " and diaobodanCode like ?";
					params.add("%"+diaobodanPO.getDiaobodanCode()+"%");
				}
				if (diaobodanPO != null && diaobodanPO.getDiaobodanOutStore() != null && !diaobodanPO.getDiaobodanOutStore().equals("")) {
					sql = sql + " or diaoboState !=0"+" and diaobodanOutStore like ?";
					params.add("%"+diaobodanPO.getDiaobodanOutStore()+"%");
				}
				if (diaobodanPO != null && diaobodanPO.getDiaobodanInStore() != null && !diaobodanPO.getDiaobodanInStore().equals("")) {
					sql = sql + " or diaoboState !=0"+" and diaobodanInStore like ?";
					params.add("%"+diaobodanPO.getDiaobodanInStore()+"%");
				}else{
					sql = sql +" diaoboState !=0";
				}
				
					sql = sql + " LIMIT " + (Integer.parseInt(pageInfo.getPageNo())-1)*pageInfo.getPageSize()+ "," +  pageInfo.getPageSize();
				
					return this.queryForList(sql, params);

	}



	@Override
	public int getCount(DiaobodanPO diaobodanPO) {
		// 参数集合
		List<Object> params = new ArrayList<>();

		// 准备sql语句
		String sql = "select count(*) from kuguan_diaobodanstate  where";

		if (diaobodanPO != null && diaobodanPO.getDiaobodanCode() != null
				&& !diaobodanPO.getDiaobodanCode().equals("")) {
			
			sql = sql +" diaoboState !=0"+ " and diaobodanCode like ?";
			params.add("%" + diaobodanPO.getDiaobodanCode() + "%");
		}
		if (diaobodanPO != null && diaobodanPO.getDiaobodanOutStore() != null
				&& !diaobodanPO.getDiaobodanOutStore().equals("")) {
			sql = sql + " or diaoboState !=0"+" and diaobodanOutStore like ?";
			params.add("%" + diaobodanPO.getDiaobodanOutStore() + "%");
		}
		if (diaobodanPO != null && diaobodanPO.getDiaobodanInStore() != null
				&& !diaobodanPO.getDiaobodanInStore().equals("")) {
			sql = sql + " or diaoboState !=0"+" and diaobodanInStore like ?";
			params.add("%" + diaobodanPO.getDiaobodanInStore() + "%");
		}else{
		
			sql = sql +" diaoboState !=0";
		}

		
		return  super.getCount(sql, params);


	}

	@Override
	public List<DiaobodanstateVO> mapRow(ResultSet rs) throws Exception {
		List<DiaobodanstateVO> diaobodanstates = new ArrayList<DiaobodanstateVO>();
		DiaobodanstateVO diaobodanstate = null;

		while (rs.next()) {
			diaobodanstate = new DiaobodanstateVO();
			diaobodanstate.setDiaobodanCode(rs.getString("diaobodanCode"));
			diaobodanstate.setDiaobodanSetTime(rs.getString("diaobodanSetTime"));
			diaobodanstate.setDiaobodanCreater(rs.getString("diaobodanCreater"));
			diaobodanstate.setDiaobodanAuditor(rs.getString("diaobodanAuditor"));
			diaobodanstate.setDiaobodanAudittime(rs.getString("diaobodanAudittime"));
			diaobodanstate.setDiaobodanOutStore(rs.getString("diaobodanOutStore"));
			diaobodanstate.setDiaobodanInStore(rs.getString("diaobodanInStore"));
			diaobodanstate.setDiaoboState(rs.getString("diaoboState"));
			diaobodanstate.setDiaoboBeizhu(rs.getString("diaoboBeizhu"));
			diaobodanstates.add(diaobodanstate);
		}
		return diaobodanstates;
	}

	/**
	 * 已完成的查询模糊查询
	 */
	@Override
	public List<DiaobodanstateVO> listByCheck(DiaobodanstatePO diaobodanstatePO, PageInfo<DiaobodanstateVO> pageInfo) {
		List<Object> params = new ArrayList<>();

		String sql = "select * from kuguan_diaobodanstate where";

		if (diaobodanstatePO != null && diaobodanstatePO.getDiaoboState() != null
				&& !diaobodanstatePO.getDiaoboState().equals("")) {
			sql = sql + " diaoboState = ?";
			params.add(diaobodanstatePO.getDiaoboState());
		}
		if (diaobodanstatePO != null && diaobodanstatePO.getDiaobodanCode() != null
				&& !diaobodanstatePO.getDiaobodanCode().equals("")) {
			sql = sql + " and diaobodanCode like ?";
			params.add("%" + diaobodanstatePO.getDiaobodanCode() + "%");
		}
		if (diaobodanstatePO != null && diaobodanstatePO.getDiaoboState() != null
				&& !diaobodanstatePO.getDiaoboState().equals("")) {
			sql = sql + " or diaoboState = ?";
			params.add(diaobodanstatePO.getDiaoboState());
		}
		if (diaobodanstatePO != null && diaobodanstatePO.getDiaobodanOutStore() != null
				&& !diaobodanstatePO.getDiaobodanOutStore().equals("")) {
			sql = sql + " and diaobodanOutStore like ?";
			params.add("%" + diaobodanstatePO.getDiaobodanOutStore() + "%");
		}
		if (diaobodanstatePO != null && diaobodanstatePO.getDiaoboState() != null
				&& !diaobodanstatePO.getDiaoboState().equals("")) {
			sql = sql + " or diaoboState = ?";
			params.add(diaobodanstatePO.getDiaoboState());
		}
		if (diaobodanstatePO != null && diaobodanstatePO.getDiaobodanInStore() != null
				&& !diaobodanstatePO.getDiaobodanInStore().equals("")) {
			sql = sql + " and diaobodanInStore like ?";
			params.add("%" + diaobodanstatePO.getDiaobodanInStore() + "%");
		}

		sql = sql + " LIMIT " + pageInfo.getPageBegin() + "," + pageInfo.getPageSize();

		return queryForList(sql, params);
	}

	/**
	 * 已完成
	 */
	@Override
	public int getCount(DiaobodanstatePO diaobodanstatePO) {
		List<Object> params = new ArrayList<>();
		String sql = "select count(*) from kuguan_diaobodanstate where";

		if (diaobodanstatePO != null && diaobodanstatePO.getDiaoboState() != null
				&& !diaobodanstatePO.getDiaoboState().equals("")) {
			sql = sql + " diaoboState = ?";
			params.add(diaobodanstatePO.getDiaoboState());
		}
		if (diaobodanstatePO != null && diaobodanstatePO.getDiaobodanCode() != null
				&& !diaobodanstatePO.getDiaobodanCode().equals("")) {
			sql = sql + " and diaobodanCode like ?";
			params.add("%" + diaobodanstatePO.getDiaobodanCode() + "%");
		}
		if (diaobodanstatePO != null && diaobodanstatePO.getDiaoboState() != null
				&& !diaobodanstatePO.getDiaoboState().equals("")) {
			sql = sql + " or diaoboState = ?";
			params.add(diaobodanstatePO.getDiaoboState());
		}
		if (diaobodanstatePO != null && diaobodanstatePO.getDiaobodanOutStore() != null
				&& !diaobodanstatePO.getDiaobodanOutStore().equals("")) {
			sql = sql + " and diaobodanOutStore like ?";
			params.add("%" + diaobodanstatePO.getDiaobodanOutStore() + "%");
		}
		if (diaobodanstatePO != null && diaobodanstatePO.getDiaoboState() != null
				&& !diaobodanstatePO.getDiaoboState().equals("")) {
			sql = sql + " or diaoboState = ?";
			params.add(diaobodanstatePO.getDiaoboState());
		}
		if (diaobodanstatePO != null && diaobodanstatePO.getDiaobodanInStore() != null
				&& !diaobodanstatePO.getDiaobodanInStore().equals("")) {
			sql = sql + " and diaobodanInStore like ?";
			params.add("%" + diaobodanstatePO.getDiaobodanInStore() + "%");
		}

		return super.getCount(sql, params);
	}


	@Override
	public boolean updateAsState(String diaobodanCode, String diaobodanAuditor, String diaobodanAudittime, String diaoboState) {
		String sql="update kuguan_diaobodanstate set diaobodanAuditor=?,diaobodanAudittime=?,diaoboState=? WHERE diaobodanCode=? ";
		List<Object> params=new ArrayList<>();
		params.add(diaobodanAuditor);
		params.add(diaobodanAudittime);
		params.add(diaoboState);
		params.add(diaobodanCode);
		
		return this.SaveOrUpdate(sql, params);
	}


	@Override
	public List<DiaobodanstateVO> queryByCode(String diaobodanCode) {
		String sql="select * from kuguan_diaobodanstate where diaobodanCode=?";
		List<Object> params=new ArrayList<>();
		params.add(diaobodanCode);
		return this.queryForList(sql, params);
	}

}
