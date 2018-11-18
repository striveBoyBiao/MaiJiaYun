package mjy.caigou.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.caigou.beans.PageInfo;
import mjy.caigou.dao.BaseDao;
import mjy.caigou.dao.KCCBDao;
import mjy.caigou.vo.KCCBMXVO;
import mjy.caigou.vo.KCCBVO;

public class KCCBDaoImpl extends BaseDao<KCCBVO> implements KCCBDao {

	//查询总记录数
	
	public List<KCCBVO> getCount(String querytext,int userid) {
		String sql="select caigou_goods.goodId ,caigou_goods.goodPicture ,caigou_goods.goodName ,caigou_goods.goodInventoryCost,caigou_goods.sku,caigou_goodwarehouse.warehouseId ,caigou_goodwarehouse.goodCount , caigou_warehouse.wareHouseName from caigou_warehouse,  caigou_goodwarehouse,  caigou_goods where  caigou_goods.goodId in(select goodId from caigou_goodwarehouse where caigou_goodwarehouse.warehouseId in(select  wareHouseId from caigou_warehouse where  caigou_warehouse.userId=?)) and caigou_goods.goodId=caigou_goodwarehouse.goodId and caigou_goodwarehouse.warehouseId=caigou_warehouse.wareHouseId ";
		if(!querytext.equals("")){
			sql+=" and   concat(caigou_goods.goodName, caigou_goods.sku)   like ? ";
		
			List<Object> params=new ArrayList<>();
			params.add(userid);
			params.add("%"+querytext+"%");
			return	this.queryForList(sql, params);
		
		
		}else{
			
			List<Object> params=new ArrayList<>();
			params.add(userid);
			
			return	this.queryForList(sql, params);
		}
		
		
	}

	//每个页面显示的内容
	@Override
	public List<KCCBVO> queryKccb(String querytext,int userid,int pagebegin) {
		String sql="select caigou_goods.goodId ,caigou_goods.goodPicture ,caigou_goods.goodName ,caigou_goods.goodInventoryCost,caigou_goods.sku,caigou_goodwarehouse.warehouseId ,caigou_goodwarehouse.goodCount , caigou_warehouse.wareHouseName from caigou_warehouse,  caigou_goodwarehouse,  caigou_goods where  caigou_goods.goodId in(select goodId from caigou_goodwarehouse where caigou_goodwarehouse.warehouseId in(select  wareHouseId from caigou_warehouse where  caigou_warehouse.userId=?)) and caigou_goods.goodId=caigou_goodwarehouse.goodId and caigou_goodwarehouse.warehouseId=caigou_warehouse.wareHouseId ";
		if(!querytext.equals("")){
			sql+=" and   concat(caigou_goods.goodName, caigou_goods.sku)   like ? ";
		
			 sql+=" limit "+pagebegin+","+PageInfo.pageSize;
			List<Object> params=new ArrayList<>();
			params.add(userid);
			params.add("%"+querytext+"%");
			return	this.queryForList(sql, params);
		
		
		}else{
			
			 sql+=" limit "+pagebegin+","+PageInfo.pageSize;
			List<Object> params=new ArrayList<>();
			params.add(userid);
			
			return	this.queryForList(sql, params);
		}
		
		
	}
	
	
	
	
	@Override
	public List<KCCBVO> mapRow(ResultSet rs) throws Exception {
		List<KCCBVO> kccbs=new ArrayList<>();
		KCCBVO kccb=null;
		while(rs.next()){
			boolean a=true;
			kccb=new KCCBVO();
			kccb.setGoodId(rs.getInt("goodId"));
			kccb.setGoodPicture(rs.getString("goodPicture"));
			kccb.setGoodName(rs.getString("goodName"));
			kccb.setSku(rs.getString("sku"));
			kccb.setWareHouseName(rs.getString("wareHouseName"));
			kccb.setGoodInventoryCost(rs.getDouble("goodInventoryCost"));
			kccb.setGoodCount(rs.getInt("goodCount"));
			kccb.setWarehouseId(rs.getInt("warehouseId"));
			kccbs.add(kccb);
			
			
			
		}
		
		
		
		return kccbs;
	}

	/**
	 * 根据搜索框内容查询
	 */
	@Override
	public List<KCCBVO> queryBySkuOrGoodsName(String querytext,int userid) {
		String sql="select caigou_goods.goodId ,caigou_goods.goodPicture ,caigou_goods.goodName ,caigou_goods.goodInventoryCost,caigou_goods.sku,caigou_goodwarehouse.warehouseId ,caigou_goodwarehouse.goodCount , caigou_warehouse.wareHouseName from caigou_warehouse,  caigou_goodwarehouse,  caigou_goods where  caigou_goods.goodId in(select goodId from caigou_goodwarehouse where caigou_goodwarehouse.warehouseId in(select  wareHouseId from caigou_warehouse where  caigou_warehouse.userId=?)) and caigou_goods.goodId=caigou_goodwarehouse.goodId and caigou_goodwarehouse.warehouseId=caigou_warehouse.wareHouseId and   concat(caigou_goods.goodName, caigou_goods.sku)   like ? ";
		List<Object> params=new ArrayList<>();
		params.add(userid);
		params.add("%"+querytext+"%");
		
		return	this.queryForList(sql, params);
		
	}
	
	
	//获得页面内容
	
	public PageInfo<KCCBVO> getpageinfo(int userId  ,PageInfo<KCCBVO> pageinfo){
		
		List  list=getCount(pageinfo.getQueryParam(),userId);		
		pageinfo.setRowCount(list.size());
		System.out.println("rowcount"+list.size());
		int pagesum=0;
		if(list.size()%PageInfo.pageSize==0){
			pagesum=list.size()/PageInfo.pageSize;
		}else{
			pagesum=list.size()/PageInfo.pageSize+1;
		}
		pageinfo.setPageCount(pagesum);		
		List list1=queryKccb(PageInfo.queryParam,userId,pageinfo.getPageBegin());
		pageinfo.setPageDate(list1);
		return pageinfo;
		
	}

	//更新明细表
	@Override
	public void updateKccbMx(KCCBMXVO kccbmxvo) {
		String sql="insert into caigou_kccbmx (goodId,warehouseId,businessName,billsName,changeTime,firstInventory,firstCost,lastInventory,lastCost) values(?,?,?,?,?,?,?,?,?)";
		List<Object> params=new ArrayList<>();
		params.add(kccbmxvo.getGoodId());
		params.add(kccbmxvo.getWarehouseId());
		params.add(kccbmxvo.getBusinessName());
		params.add(kccbmxvo.getBillsName());
		params.add(kccbmxvo.getChangeTime());
		params.add(kccbmxvo.getFirstInventory());
		
		params.add(kccbmxvo.getFirstCost());
		params.add(kccbmxvo.getLastInventory());
		params.add(kccbmxvo.getLastCost());
		
		this.SaveOrUpdate(sql, params);
		
	}

	
	
	
	
	
	

}
