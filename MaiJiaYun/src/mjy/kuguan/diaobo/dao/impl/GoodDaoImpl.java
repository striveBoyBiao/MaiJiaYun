package mjy.kuguan.diaobo.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import mjy.kuguan.diaobo.dao.GoodDao;
import mjy.kuguan.diaobo.po.GoodsPO;

public class GoodDaoImpl extends BaseDao<GoodsPO> implements GoodDao {

	@Override
	public List<GoodsPO> queryByGoodId(Integer goodId) {
		String sql="select * from caigou_goods where goodId=?";
		List<Object> params=new ArrayList<>();
		params.add(goodId);		
		return this.queryForList(sql, params);
	}
	
	@Test
	public void test(){
		System.out.println(queryByGoodId(100001));
	}

	@Override
	public List<GoodsPO> mapRow(ResultSet rs) throws Exception {
		List<GoodsPO> goodPOs=new ArrayList<>();
		GoodsPO goodsPO=null;
		while(rs.next()){
			goodsPO=new GoodsPO();
			goodsPO.setSku(rs.getString("sku"));
			goodsPO.setGoodName(rs.getString("goodName"));
			goodsPO.setGoodPicture(rs.getString("goodPicture"));
			goodsPO.setGoodCount(null);
			goodsPO.setProperty(null);
			goodPOs.add(goodsPO);
		}
		
		return goodPOs;
	}

}
