package mjy.kefu.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.common.util.jdbc.BaseDao;
import mjy.kefu.beans.LieshezhiInitBeanVO;

public class LieshezhiInsert extends BaseDao<LieshezhiInitBeanVO> {
	public boolean lieshezhiInit(int userId){
		boolean flag = true;
		String sqlQuery = "select lszinfoId,lieTitle,ddcxDefaultState,ddcxDefaultSequence,dfkddDefaultState,dfkddDefaultSequence,shenHeDefaultState,shenHeDefaultSequence,fsDefaultState,fsDefaultSequence,ddfhDefaultState,ddfhDefaultSequence "
				+"from kefu_lszinfo order by lszinfoId";
		ArrayList<Object> params1 = new ArrayList<Object>();
		ArrayList<LieshezhiInitBeanVO> lieshezhiInit = new ArrayList<LieshezhiInitBeanVO>();
		lieshezhiInit = (ArrayList<LieshezhiInitBeanVO>) queryForList(sqlQuery, params1);
		ArrayList<Object> params2;
		LieshezhiInitBeanVO lieshezhiInfo = null;
		for(int i=0;i<lieshezhiInit.size();i++){
			params2 = new ArrayList<Object>();
			lieshezhiInfo = lieshezhiInit.get(i);
			String sql = "insert into kefu_lieshezhi";
			String sqlNames = "(userId,lszinfoId,ddcxSequence,dfkddSequence,shenHeSequence,fsSequence,ddfhSequence";
			String sqlValues = "values(?,?,?,?,?,?,?";
			params2.add(userId);
			params2.add(lieshezhiInfo.getLszInfoId());
			params2.add(lieshezhiInfo.getDdcxDefaultSequence());
			params2.add(lieshezhiInfo.getDfkddDefaultSequence());
			params2.add(lieshezhiInfo.getShenHeDefaultSequence());
			params2.add(lieshezhiInfo.getFsDefaultSequence());
			params2.add(lieshezhiInfo.getDdfhDefaultSequence());
			
			if(lieshezhiInfo.getDdcxDefaultSequence()!=null){
				sqlNames +=",ddcxState,ddcxShowName";
				sqlValues +=",?,?";
				params2.add(lieshezhiInfo.getDdcxDefaultState());
				params2.add(lieshezhiInfo.getLieTitle());
			}
			if(lieshezhiInfo.getDfkddDefaultSequence()!=null){
				sqlNames +=",dfkddState,dfkddShowName";
				sqlValues +=",?,?";
				params2.add(lieshezhiInfo.getDfkddDefaultState());
				params2.add(lieshezhiInfo.getLieTitle());
			}
			if(lieshezhiInfo.getShenHeDefaultSequence()!=null){
				sqlNames +=",shenHeState,shenHeShowName";
				sqlValues +=",?,?";
				params2.add(lieshezhiInfo.getShenHeDefaultState());
				params2.add(lieshezhiInfo.getLieTitle());
			}
			if(lieshezhiInfo.getFsDefaultSequence()!=null){
				sqlNames +=",fsState,fsShowName";
				sqlValues +=",?,?";
				params2.add(lieshezhiInfo.getFsDefaultState());
				params2.add(lieshezhiInfo.getLieTitle());
			}
			if(lieshezhiInfo.getDdfhDefaultSequence()!=null){
				sqlNames +=",ddfhState,ddfhShowName";
				sqlValues +=",?,?";
				params2.add(lieshezhiInfo.getDdfhDefaultState());
				params2.add(lieshezhiInfo.getLieTitle());
			}
			sqlNames +=") ";
			sqlValues +=")";
			sql=sql+sqlNames+sqlValues;
			flag = flag&&SaveOrUpdate(sql, params2);
		}
		return flag;
	}

	@Override
	public List<LieshezhiInitBeanVO> mapRow(ResultSet rs) throws Exception {
		List<LieshezhiInitBeanVO> list = new ArrayList<LieshezhiInitBeanVO>();
		LieshezhiInitBeanVO lieshezhiInfo = null;
		while(rs.next()){
			lieshezhiInfo = new LieshezhiInitBeanVO();
			lieshezhiInfo.setLszInfoId(rs.getInt("lszinfoId"));
			lieshezhiInfo.setLieTitle(rs.getString("lieTitle"));
			lieshezhiInfo.setDdcxDefaultState(rs.getBoolean("ddcxDefaultState"));
			lieshezhiInfo.setDdcxDefaultSequence(rs.getString("ddcxDefaultSequence"));
			lieshezhiInfo.setDfkddDefaultState(rs.getBoolean("dfkddDefaultState"));
			lieshezhiInfo.setDfkddDefaultSequence(rs.getString("dfkddDefaultSequence"));
			lieshezhiInfo.setShenHeDefaultState(rs.getBoolean("shenHeDefaultState"));
			lieshezhiInfo.setShenHeDefaultSequence(rs.getString("shenHeDefaultSequence"));
			lieshezhiInfo.setFsDefaultState(rs.getBoolean("fsDefaultState"));
			lieshezhiInfo.setFsDefaultSequence(rs.getString("fsDefaultSequence"));
			lieshezhiInfo.setDdfhDefaultState(rs.getBoolean("ddfhDefaultState"));
			lieshezhiInfo.setDdfhDefaultSequence(rs.getString("ddfhDefaultSequence"));
			list.add(lieshezhiInfo);
		}
		return list;
	}

}
