package mjy.caigou.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import mjy.caigou.dao.BaseDao;
import mjy.caigou.dao.GoodsDao;
import mjy.caigou.po.GoodsPO;
import mjy.caigou.vo.GoodsVO;


public class GoodsDaoImpl extends BaseDao<GoodsVO> implements GoodsDao {
	
	/**
	 * ��ѯ��ǰ�û������е���Ʒ
	 * @author �ھ�С����Ա�ſ�
	 * 
	 */
	@Override
	public List<GoodsVO> queryAllGoodsById(int userId) {
		String sql="select * from caigou_goods where goodId in( select goodId from caigou_gooduserstatus where userId=?)"; 
		
		List<Object> params = new ArrayList<>();
		params.add(userId);
		
		return this.queryForList(sql, params);
	
	}
	
	
	
	/**
	 * 设置商品的总库存
	 * @author 第九小组组员张俊
	 */
	@Override
	public void goodRepertory(int goodId){
		String sql="update caigou_goods set goodRepertory = (select sum(goodCount) from caigou_goodwarehouse where goodId=?) where goodId = ?";
		List<Object> params = new ArrayList<>(); 
		params.add(goodId);
		params.add(goodId);
		this.SaveOrUpdate(sql, params);
		
	}
	
	
	
	//��ѯ������Ʒ��Ϣ
	@Override
	public List<GoodsVO> queryAllGoods() {
		String sql="select * from caigou_goods where 1=1"; 
		
		List<Object> params = new ArrayList<>();
		return this.queryForList(sql, params);
	}

	
	@Override
	public int getCount() {
		String sql="select * from caigou_goods where 1=1 ";
		List<Object> params = new ArrayList<>();
		return this.queryForList(sql, params).size();
	}
	
	
	
	@Override
	public List<GoodsVO> mapRow(ResultSet rs) throws Exception {
		List<GoodsVO> goodVOs=new ArrayList<GoodsVO>();
		GoodsVO goodVO=null;
		while(rs.next()){
			goodVO=new GoodsVO();
			goodVO.setGoodId(rs.getInt("goodId"));
			goodVO.setSku(rs.getString("sku"));
			goodVO.setGoodGroupId(rs.getInt("goodGroupId"));
			
			goodVO.setGoodName(rs.getString("goodName"));
			goodVO.setGoodPrice(rs.getDouble("goodPrice"));
			goodVO.setGoodWeight(rs.getDouble("goodWeight"));
			goodVO.setGoodRepertory(rs.getInt("goodRepertory"));
			
			goodVO.setGoodVirtualInventories(rs.getInt("goodVirtualInventories"));
			goodVO.setGoodInventoryCost(rs.getDouble("goodInventoryCost"));
			goodVO.setGoodPicture(rs.getString("goodPicture"));
			goodVOs.add(goodVO);
		}
		
		return goodVOs;
	}



	/**
	 * �����Ʒ
	 */
	

	//ͨ��goodIdɾ��goods������Ϣ
	@Override
	public void deleteGoodInfoById(int goodId) {
		String sql="delete from caigou_goods where goodId=?";
		List<Object> params = new ArrayList<>(); 
		params.add(goodId);
		this.SaveOrUpdate(sql, params);
	}

	//ͨ��goodId��ѯgoods������Ϣ
	@Override
	public GoodsVO queryGoodInfoById(int goodId) {
		String sql="select * from caigou_goods where goodId=?";
		List<Object> params = new ArrayList<>();
		params.add(goodId);
		return this.queryForSingle(sql, params);
	}

	/**
	 * �����Ʒ
	 */
	@Override
	public void addGood(GoodsVO good) {
		// TODO Auto-generated method stub
		String sql="insert into caigou_goods(goodId,sku,goodGroupId,goodName,goodPrice,goodWeight,goodPicture) values(?,?,?,?,?,?,?)";
		List<Object> params=new ArrayList<>();
		params.add(good.getGoodId());
		params.add(good.getSku());
		params.add(good.getGoodGroupId());
		params.add(good.getGoodName());
		params.add(good.getGoodPrice());
		params.add(good.getGoodWeight());
		params.add(good.getGoodPicture());
		
		this.SaveOrUpdate(sql, params);
		
	}





	@Override
	public int queryBySku(String sku) {
		String sql="select goodId from caigou_goods where sku=?";
		List<Object> params=new ArrayList<>();
		params.add(sku);
		return this.getCount(sql, params);
	}
//	public static void main(String[] args) {
//		GoodsDaoImpl gd=new GoodsDaoImpl();
//		System.out.println(gd.queryBySku("100001-1"));
//	}




	//ͨ��sku����goods����Ŀ��ɱ�
	@Override
	public void updateGoodInventCost(String sku, double goodInventCost) {
		
		String sql="update caigou_goods set goodInventoryCost=? where sku=?";
		List<Object> params=new ArrayList<>();
		params.add(goodInventCost);
		params.add(sku);
		this.SaveOrUpdate(sql, params);
		
	}





	@Override
	public void updateGoods(String sku, GoodsVO goods) {
		String sql="update caigou_goods set goodId=? ,sku=?,goodGroupId=? ,goodName=?,goodPrice=?,goodWeight=?,goodPicture=? where sku=?";
		List<Object> params=new ArrayList<>();
		params.add(goods.getGoodId());
		params.add(goods.getSku());
		params.add(goods.getGoodGroupId());
		params.add(goods.getGoodName());
		params.add(goods.getGoodPrice());
		params.add(goods.getGoodWeight());
		params.add(goods.getGoodPicture());
		params.add(sku);		
		this.SaveOrUpdate(sql, params);
		
	}




	@Override
	public List<GoodsVO> listByGoodId(int goodId) {
		String sql="select * from caigou_goods where goodId=?";
		List<Object> params=new ArrayList<>();
		params.add(goodId);
		return this.queryForList(sql, params);
	
	}







}
