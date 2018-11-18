package mjy.kuguan.diaobo.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import mjy.kuguan.diaobo.dao.DiaobodanDao;
import mjy.kuguan.diaobo.po.XiangqingDiaoboPO;
import mjy.kuguan.diaobo.vo.DiaobodanVO;
import mjy.kuguan.diaobo.vo.DiaobodanstateVO;

public class DiaobodanDaoImpl extends BaseDao<DiaobodanVO> implements DiaobodanDao {

	@Override
	public boolean insert(List<DiaobodanVO> diaobodanVOs) {
		boolean result=true;
		
		for(int i=0;i<diaobodanVOs.size();i++){
			
			String sql="insert into kuguan_diaobodan value(?,?,?,?,?,?,?)";
			List<Object> params = new ArrayList<Object>();
			params.add((diaobodanVOs.get(i)).getDiaobodanCode());
			params.add((diaobodanVOs.get(i)).getSku());
			params.add((diaobodanVOs.get(i)).getGoodName());
			params.add((diaobodanVOs.get(i)).getGoodProperty());
			params.add((diaobodanVOs.get(i)).getGoodRepertory());
			params.add((diaobodanVOs.get(i)).getOutNumber());
			params.add((diaobodanVOs.get(i)).getBeizhu());
			
			if( this.SaveOrUpdate(sql, params)== false){
				result = false;
			}
			
		}
		return result;
	}
	
	@Override
	public boolean deleteBydiaoboCode(String diaobodanCode) {
		String sql="delete from kuguan_diaobodan where diaobodanCode=?";
		
		List<Object> params=new ArrayList<>();
		params.add(diaobodanCode);
		return this.SaveOrUpdate(sql, params);
	}

	
	@Override
	public List<DiaobodanVO> mapRow(ResultSet rs) throws Exception {
		List<DiaobodanVO> diaobodanVOs = new ArrayList<DiaobodanVO>();
		DiaobodanVO diaobodanVO = null;

		while (rs.next()) {
			diaobodanVO = new DiaobodanVO();
			diaobodanVO.setDiaobodanCode(rs.getString("diaobodanCode"));
			diaobodanVO.setSku(rs.getString("sku"));
			diaobodanVO.setGoodName(rs.getString("goodName"));
			diaobodanVO.setGoodProperty(rs.getString("goodProperty"));
			diaobodanVO.setGoodRepertory(rs.getInt("goodRepertory"));
			diaobodanVO.setOutNumber(rs.getInt("outNumber"));
			diaobodanVO.setBeizhu(rs.getString("beizhu"));
			diaobodanVOs.add(diaobodanVO);
		}
		return diaobodanVOs;
	}

	@Override
	public List<DiaobodanVO> querydiaobo(String diaobodanCode) {
		String sql="select * from kuguan_diaobodan where diaobodanCode=?";
		List<Object> params=new ArrayList<>();
		params.add(diaobodanCode);
		return this.queryForList(sql, params);
	}
	
	@Test
	public void test(){
		//System.out.print(querydiaobo("DB201612090859001"));
	}

}
