package mjy.kuguan.cangkuxinxi.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.kuguan.cangkuxinxi.dao.BaseDAO;
import mjy.kuguan.cangkuxinxi.dao.GoodKuCunDao;
import mjy.kuguan.cangkuxinxi.po.GoodKuCunPO;
import mjy.kuguan.cangkuxinxi.vo.GoodKuCunVO;

public class GoodKuCunDaoImpl extends BaseDAO<GoodKuCunVO> implements GoodKuCunDao {

	@Override
	public List<GoodKuCunVO> listBy(GoodKuCunPO gPO) {
		String sql = "select gh.goodId,sku,goodName,goodAttribute,goodCount,wareHouseName,wareHouseId from caigou_goods gs join caigou_goodwarehouse gh on gs.goodId=gh.goodId where sku=? or goodName=?";
		List<Object> list = new ArrayList<>();
		list.add(gPO.getSku());
		list.add(gPO.getGoodName());
		if(gPO.getWareHouseId()==0){
			sql = sql + " or wareHouseId=?";
			list.add(gPO.getWareHouseId());
		}
		return this.queryForList(sql, list);
	}
	
	@Override
	public List<GoodKuCunVO> listGood(GoodKuCunPO gPO) {
		String sql = "select gh.goodId,sku,goodName,goodAttribute,goodCount,wareHouseName,wareHouseId from caigou_goods gs join caigou_goodwarehouse gh on gs.goodId=gh.goodId where 1=1";
		List<Object> list = new ArrayList<>();
		if(gPO.getWareHouseId()!=0){
			sql = sql + " and wareHouseId=?";
			list.add(gPO.getWareHouseId());
		}
		return this.queryForList(sql, list);
	}

	@Override
	public List<GoodKuCunVO> mapRow(ResultSet rs) throws Exception {
		List<GoodKuCunVO> list = new ArrayList<>();
		while (rs.next()) {
			GoodKuCunVO goodVO = new GoodKuCunVO();
			goodVO.setGoodId(rs.getInt("goodId"));
			goodVO.setSku(rs.getString("sku"));
			goodVO.setGoodName(rs.getString("goodName"));
			goodVO.setGoodCount(rs.getInt("goodCount"));
			goodVO.setWareHouseId(rs.getInt("wareHouseId"));
			goodVO.setWareHouseName(rs.getString("wareHouseName"));
			list.add(goodVO);
		}
		return list;
	}

}
