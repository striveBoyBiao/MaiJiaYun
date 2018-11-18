package mjy.caigou.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.caigou.dao.BaseDao;
import mjy.caigou.dao.GoodsDao;
import mjy.caigou.dao.ShopGoodsDao;
import mjy.caigou.po.ShopGoodsPO;
import mjy.caigou.vo.GoodsVO;
import mjy.caigou.vo.ShopGoodsVO;

/**
 * 网店的Dao层
 * @author student
 *
 */
public class ShopGoodsDaoImpl extends BaseDao<ShopGoodsVO> implements ShopGoodsDao {
	/**
	 * 根据店铺id和是否导入查询shopgoods
	 * @author student 李彦杰
	 */
	private static int renameGoodId;
	@Override
	public List<ShopGoodsVO> getShopGoods(int shopId,int isImport) {
		String sql="select * from caigou_shopgoods where shopId=? and isImport=?";
		List<Object> params=new ArrayList<>();
		params.add(shopId);
		params.add(isImport);
		List<ShopGoodsVO> shopGoodss=this.queryForList(sql, params);
		return shopGoodss;
	}

	@Override
	public void updateShopGoods(ShopGoodsPO shopGoodsPO) {
		
	}
	
	@Override
	public List<ShopGoodsVO> mapRow(ResultSet rs) throws Exception {
		List<ShopGoodsVO> shopGoodss=new ArrayList<>();
		ShopGoodsVO shopGoods=null;
		while(rs.next()){
			shopGoods=new ShopGoodsVO();
			shopGoods.setGoodId(rs.getInt("goodId"));
			shopGoods.setShopId(rs.getInt("shopId"));
			shopGoods.setGoodImage(rs.getString("picture"));
			shopGoods.setGoodName(rs.getString("goodName"));
			shopGoods.setGoodPrice(rs.getDouble("goodPrice"));
			shopGoods.setGoodWeight(rs.getDouble("goodWeight"));
			shopGoods.setGoodRepertory(rs.getInt("goodRepertory"));
			shopGoods.setIsOnShelf(rs.getInt("isOnShelf"));
			shopGoods.setIsCorrespond(rs.getInt("isCorrespond"));
			shopGoodss.add(shopGoods);
		}
		return shopGoodss;
	}
	
	@Override
	public void updateShopGoodss(List<ShopGoodsVO> shopGoodss) {
		int id;
		for (ShopGoodsVO shopGoodsVO : shopGoodss) {
			id=shopGoodsVO.getGoodId();
			String sql="update caigou_shopgoods set isImport='1' where goodId=?";
			List<Object> params=new ArrayList<>();
			params.add(id);
			this.SaveOrUpdate(sql, params);
		}
	}
	/**
	 * 根据商品id查询shopgoods
	 * @author student 李彦杰
	 */
	@Override
	public List<ShopGoodsVO> getShopGoods(int goodId) {
		List<Object> params=new ArrayList<>();
		String sql="select * from caigou_shopgoods where goodId=?";
		params.add(goodId);
		return this.queryForList(sql, params);	
	}
	/**
	 * 根据shopId和isOnSelf查询shopGoods
	 */
	@Override
	public List<ShopGoodsVO> queryShopGoods(int shopId, int isOnSelf) {
		String sql="select * from caigou_shopgoods where shopId=? and isOnShelf=?";
		List<Object> params=new ArrayList<>();
		params.add(shopId);
		params.add(isOnSelf);
		List<ShopGoodsVO> shopGoodss=this.queryForList(sql, params);
		return shopGoodss;
		
	}
	/**
	 * 根据店铺id和是否上架和文本输入进行三条件搜索
	 * @author student 李彦杰
	 */
	@Override
	public List<ShopGoodsVO> query(ShopGoodsPO shopGoodsPo) {
		List<Object> params=new ArrayList<>();
		String sql="select * from caigou_shopgoods ";
		
		if(shopGoodsPo == null){
			sql = sql + " where 1=1 ";
		}
		if (shopGoodsPo != null && shopGoodsPo.getGoodName() != null && !shopGoodsPo.getGoodName().equals("")) {
			sql = sql + " where (goodName like ? or goodId like ?)";
			params.add("%" + shopGoodsPo.getGoodName() + "%");
			params.add("%" + shopGoodsPo.getGoodName() + "%");
		}
		if (shopGoodsPo != null && shopGoodsPo.getIsOnShelf() != 2) {
			sql = sql + " and isOnShelf = ? ";
			params.add(shopGoodsPo.getIsOnShelf());
		}
		if (shopGoodsPo != null && shopGoodsPo.getShopId() != 0) {
			sql = sql + " and shopId = ? ";
			params.add(shopGoodsPo.getShopId());
		}
		
		return this.queryForList(sql, params);
	}
	/**
	 * 根据店铺id和是否对应查询shopgoods
	 * 已对应商品
	 * @author student 李彦杰
	 */
	@Override
	public List<ShopGoodsVO> getAllDuiYingGoods(int shopId, int iscorrespond) {
		List<Object> params=new ArrayList<>();
		String sql="select * from caigou_shopgoods where shopId=? and iscorrespond=? and isOnShelf=1 ";
		params.add(shopId);
		params.add(iscorrespond);
		return this.queryForList(sql, params);
	}
	/**
	 * 未对应shopGoods插入到goods表和gooduserstatus表，并将isCorrespond改为1
	 * 1.将未对应的商品插入到goods表 (注意id可能会重复插入失败)
	 * @author student 李彦杰
	 */
	@Override
	public void insertToGoods(int goodId,int userId){
		String sql="insert into caigou_goods(goodId,goodPicture,goodName,goodPrice,goodWeight,goodRepertory) values(?,?,?,?,?,?)";
		List<Object> params=new ArrayList<>();
		List<ShopGoodsVO> goodsVO=getShopGoods(goodId);
		System.out.println(goodsVO);
		//判断goodId是否重复
		 renameGoodId=renameGoodId(goodId,userId);
//		 System.out.println("renameGoodId"+renameGoodId);
		for (ShopGoodsVO shop : goodsVO) {
			params.add(renameGoodId);
			params.add(shop.getGoodImage());
			params.add(shop.getGoodName());
			params.add(shop.getGoodPrice());
			params.add(shop.getGoodWeight());
			params.add(shop.getGoodRepertory());	
		}
		this.SaveOrUpdate(sql, params);
	}
	/**
	 * 2.将未对应的商品插入到gooduserstatus表 (注意id可能会不存在插入失败)
	 * gooduserstatus是goods表和user的中间表
	 * @author student 李彦杰
	 */
	@Override
	public void insertToUserStatus(int goodId,int userId){
		String sql="insert into caigou_gooduserstatus(goodId,userId,goodName) values(?,?,?)";
		List<Object> params=new ArrayList<>();
		List<ShopGoodsVO> goodsVO=getShopGoods(goodId);
		
		params.add(renameGoodId);
		params.add(userId);
		params.add(goodsVO.get(0).getGoodName());		
		
		this.SaveOrUpdate(sql, params);
	}
	
	/**
	 * 3.根据商品id将isCorrespond改为1
	 * @author student 李彦杰
	 */
	@Override
	public void updateShopTable(int goodId) {
		String sql="update caigou_shopgoods set isCorrespond='1' where goodId=?";
		List<Object> params=new ArrayList<>();
		params.add(goodId);
		this.SaveOrUpdate(sql, params);
	}
	/**
	 * 将重复的goodId随机生成新的goodId
	 */
	private int renameGoodId(int goodId,int userId){
		List<GoodsVO> list=new GoodsDaoImpl().queryAllGoodsById(userId);
		
		for (GoodsVO goods : list) {
			if(goods.getGoodId()==goodId){
				goodId=(int) (goodId+goodId*Math.random()*53*7);
			}
		}
		return goodId;
	}
}
