package mjy.caigou.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import mjy.caigou.beans.PageInfo;
import mjy.caigou.dao.GoodGroupDao;
import mjy.caigou.dao.GoodUserStatusDao;
import mjy.caigou.dao.GoodWarehouseDao;
import mjy.caigou.dao.GoodsDao;
import mjy.caigou.dao.PurchaseDao;
import mjy.caigou.dao.WarehouseDao;
import mjy.caigou.dao.impl.GoodGroupDaoImpl;
import mjy.caigou.dao.impl.GoodUserStatusDaoImpl;
import mjy.caigou.dao.impl.GoodWarehouseDaoImpl;
import mjy.caigou.dao.impl.GoodsDaoImpl;
import mjy.caigou.dao.impl.PurchaseDaoImpl;
import mjy.caigou.dao.impl.WarehouseDaoImpl;
import mjy.caigou.po.GoodsPO;
import mjy.caigou.service.SPService;
import mjy.caigou.vo.GoodGroupVO;
import mjy.caigou.vo.GoodUserStatusVO;
import mjy.caigou.vo.GoodsVO;

public class SPServiceImpl implements SPService {
private GoodGroupDao goodGroupDao=new GoodGroupDaoImpl();

private GoodsDao goodsDao=new GoodsDaoImpl();
private WarehouseDao warehouseDao=new WarehouseDaoImpl();
private GoodWarehouseDao goodWarehouseDao=new GoodWarehouseDaoImpl();
private PurchaseDao purchaseDao=new PurchaseDaoImpl();
private GoodUserStatusDao goodUserStatusDao=new GoodUserStatusDaoImpl();
	/**
	 * 得到所有商品信息
	 */

	@Override
	public List<GoodsPO> getAllGoods(int userId) {
		List<GoodsPO> goodPOs=new ArrayList<GoodsPO>();
		List<Integer> goodIds=goodUserStatusDao.getGoodIds(userId);
		GoodsPO goodPO=null;
		for (Integer goodId : goodIds) {
			GoodsVO goodsVO=goodsDao.queryGoodInfoById(goodId);
			goodPO=new GoodsPO();
			goodPO.setGoodId(goodsVO.getGoodId());
			goodPO.setSku(goodsVO.getSku());
			goodPO.setGoodGroupId(goodsVO.getGoodGroupId());
			goodPO.setGoodGroupName(goodGroupDao.getNameById(goodsVO.getGoodGroupId()));
			goodPO.setGoodName(goodUserStatusDao.getGoodNameById(goodsVO.getGoodId(), userId));
			goodPO.setGoodPrice(goodsVO.getGoodPrice());
			goodPO.setGoodWeight(goodsVO.getGoodWeight());
			goodPO.setGoodRepertory(goodsVO.getGoodRepertory());
			
			goodPO.setGoodVirtualInventories(goodsVO.getGoodVirtualInventories());
			goodPO.setGoodInventoryCost(goodsVO.getGoodInventoryCost());
			goodPO.setGoodPicture(goodsVO.getGoodPicture());
			goodPO.setGoodwarehouse(goodWarehouseDao.getGoodWarehouseVOs(goodsVO.getGoodId()));
			//goodPO.setGoodWarehouseName(warehouseDao.queryNameById(goodsVO.getGoodWarehouseId()));
			System.out.println(goodPO);
			goodPOs.add(goodPO);
		}

		return goodPOs;
	}

	//得到商品分类信息
	@Override
	public List<String> getGoodGroupName() {
		List<GoodGroupVO> list= goodGroupDao.QueryGoodGroupName();
		List<String> goodGroupNames=new ArrayList<>();
		for (GoodGroupVO goodGroupVO : list) {
			goodGroupNames.add(goodGroupVO.getGoodGroupName())	;
		}
		return goodGroupNames;
	}
	
	//添加商品分类
	@Override
	public void addNodeName(String GroupName) {
		
		goodGroupDao.addGoodGroup(GroupName);
	}
	/**
	 * 获得商品所有分类集合
	 */
	@Override
	public List<GoodGroupVO> getGoodGroups() {
		
		return goodGroupDao.QueryGoodGroupName();
	}
	/**
	 * 得到商品总数目
	 */
	@Override
	public int getGoodsNum(int userId) {
		
		return goodUserStatusDao.getCount( userId);
	}
	
	/**
	 * 通过商品id删除该商品所有信息
	 */
	@Override
	public void deleteGoodsInfo(int goodId,int userId) {
		goodUserStatusDao.updateGoodsStatus(goodId, userId);
		
		
	}

	//增加商品
	@Override
	public void addGood(GoodsVO good) {
		goodsDao.addGood(good);
		
	}

	
	//将所有该用户的商品状态改为0
	@Override
	public void deleteAllGoods(int userId) {
		List<Integer> goodIds=	goodUserStatusDao.getGoodIds(userId);
		for (Integer id : goodIds) {
			goodUserStatusDao.updateGoodsStatus(id, userId);
		}
		
	}


	/**
	 * 增加商品用户
	 */
	@Override
	public void addGoodUser(GoodUserStatusVO gusvo) {
		goodUserStatusDao.addGoodUser(gusvo);
		
	}
	//修改该用户的商品名称
	@Override
	public void updateGoodName(int updateGoodId, String updateVal, int userId) {
		goodUserStatusDao.updateGoodNameById(updateGoodId, updateVal, userId);
		
	}


	@Override
	public int queryBySku(String sku) {
		
		return goodsDao.queryBySku(sku);
	}


	
	//通过名称模糊查询商品列表
	@Override
	public List<GoodsPO> searchGoodsLikeName(GoodUserStatusVO goodUserstatusVO) {
		List<GoodsPO> goodPOs=new ArrayList<GoodsPO>();
		List<Integer> goodIds= goodUserStatusDao.queryGoodsLikeName(goodUserstatusVO);
		GoodsPO goodPO=null;
		for (Integer goodId : goodIds) {
			GoodsVO goodsVO=goodsDao.queryGoodInfoById(goodId);
			goodPO=new GoodsPO();
			goodPO.setGoodId(goodsVO.getGoodId());
			goodPO.setSku(goodsVO.getSku());
			goodPO.setGoodGroupId(goodsVO.getGoodGroupId());
			goodPO.setGoodGroupName(goodGroupDao.getNameById(goodsVO.getGoodGroupId()));
			goodPO.setGoodName(goodUserStatusDao.getGoodNameById(goodsVO.getGoodId(), goodUserstatusVO.getUserId()));
			goodPO.setGoodPrice(goodsVO.getGoodPrice());
			goodPO.setGoodWeight(goodsVO.getGoodWeight());
			goodPO.setGoodRepertory(goodsVO.getGoodRepertory());
			
			goodPO.setGoodVirtualInventories(goodsVO.getGoodVirtualInventories());
			goodPO.setGoodInventoryCost(goodsVO.getGoodInventoryCost());
			goodPO.setGoodPicture(goodsVO.getGoodPicture());
			goodPO.setGoodwarehouse(goodWarehouseDao.getGoodWarehouseVOs(goodsVO.getGoodId()));
			//goodPO.setGoodWarehouseName(warehouseDao.queryNameById(goodsVO.getGoodWarehouseId()));
			
			goodPOs.add(goodPO);
		}

		return goodPOs;
	}

	
	@Test
	public void test1(){
		
		
	}

	//通过sku更新库存成本
	@Override
	public void updateGoodInventCost(String sku, double goodInventCost) {
		goodsDao.updateGoodInventCost(sku, goodInventCost);
		
	}

	//更新商品表
	@Override
	public void updateGoods(String sku, GoodsVO goods) {
		goodsDao.updateGoods(sku, goods);
		
	}

	//更新GoodUserStatus表
	@Override
	public void updateGoodUserStatus(String goodId, GoodUserStatusVO gusvo) {
		
		goodUserStatusDao.updateGoodUserStatus(goodId, gusvo);
		
	}
	

	
	
	
	
	public PageInfo<GoodsPO> listByPage(GoodUserStatusVO goodUserStatusVO,PageInfo<GoodsPO> page) {
		
		//设置请求参数
		/*page.setQueryParam(goodUserStatusVO.getQueryUrl());*/
		
		//计算总页数
		int rowCount=goodUserStatusDao.getNameCount(goodUserStatusVO);
		int pageCount=0;
		int pageSize=page.getPageSize();
		
		
		if(rowCount%pageSize==0){
			pageCount=rowCount/pageSize;
		}else{
			pageCount=rowCount/pageSize+1;
		}
		page.setPageCount(pageCount);

		//获取当前页数据
		List<GoodsPO> employees=searchGoodsLikeName(goodUserStatusVO);
		page.setPageDate(employees);
		
		return page ;
	}
	
	@Override
	public int getNameLikeLength(int userId, String name) {
		
		return goodUserStatusDao.queryLengthLikeName(userId, name);
	}
}
