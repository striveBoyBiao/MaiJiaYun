package mjy.caigou.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.caigou.dao.BaseDao;
import mjy.caigou.dao.PurchaseGoodDao;
import mjy.caigou.po.PurchaseGoodPO;
import mjy.caigou.vo.GoodsVO;
import mjy.caigou.vo.PurchaseGoodVO;
import mjy.caigou.vo.PurchaseVO;


public class PurchaseGoodDaoImpl extends BaseDao<PurchaseGoodVO> implements PurchaseGoodDao {

	@Override
	public void insert(List<PurchaseGoodVO> array) {
		for(int i=0;i<array.size();i++){
			String sql="insert into caigou_purchasegood (purchaseId,goodId,purchaseNum,quantity,purchasePrice,remark_1,purchaseSum) values(?,?,?,?,?,?,?)";
			List<Object> params=new ArrayList<Object>();
//			System.out.println(((PurchaseGoodVO)array.get(i)).getPurchaseId());
			params.add(((PurchaseGoodVO)array.get(i)).getPurchaseId());
			params.add(((PurchaseGoodVO)array.get(i)).getGoodId());
			params.add(((PurchaseGoodVO)array.get(i)).getPurchaseNum());
			params.add(((PurchaseGoodVO)array.get(i)).getQuantity());
			params.add(((PurchaseGoodVO)array.get(i)).getPurchasePrice());
			
			params.add(((PurchaseGoodVO)array.get(i)).getRemark_1());
			
			params.add(((PurchaseGoodVO)array.get(i)).getPurchaseSum());
			this.SaveOrUpdate(sql, params);
		}
		
				
		
	}
	
	@Override
	public void insert1(PurchaseGoodVO purchase) {
		String sql="insert into caigou_purchasegood (purchaseId,goodId,purchaseNum,quantity,purchasePrice,remark_1,purchaseSum) values(?,?,?,?,?,?,?)";
		List<Object> params=new ArrayList<Object>();
//		System.out.println(((PurchaseGoodVO)array.get(i)).getPurchaseId());
		params.add(purchase.getPurchaseId());
		params.add(purchase.getGoodId());
		params.add(purchase.getPurchaseNum());
		params.add(purchase.getQuantity());
		params.add(purchase.getPurchasePrice());
		
		params.add(purchase.getRemark_1());
		
		params.add(purchase.getPurchaseSum());
		this.SaveOrUpdate(sql, params);
		
	}

	@Override
	public void update(PurchaseGoodVO purchaseGoodVo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int purchaseId) {
		String sql="delete from caigou_purchasegood where purchaseId=?";
		List<Object> params = new ArrayList<Object>();
		params.add(purchaseId);
		
		
		this.SaveOrUpdate(sql, params);
		
	}

	@Override
	public List<PurchaseGoodVO> listBy(PurchaseGoodPO purchaseGoodPo) {
		List<Object> params = new ArrayList<Object>();
		int pId =purchaseGoodPo.getPurchaseId();
	

		String sql = "select purchaseId,purchaseGoodId,a.goodId,sku,goodName,goodPrice,goodRepertory,goodPicture,purchaseNum,quantity,purchasePrice,purchaseSum,remark_1 from caigou_purchasegood a left join caigou_goods b on a.goodId=b.goodId where purchaseId= ?";
		params.add(purchaseGoodPo.getPurchaseId())	;

		return this.queryForList(sql, params);
	
	}

	@Override
	public List<PurchaseGoodVO> mapRow(ResultSet rs) throws Exception {
		List<PurchaseGoodVO> list=new ArrayList<>();		
		PurchaseGoodVO purchaseGoodVo=null;
		GoodsVO goodsVo=null;
		while(rs.next()){
			purchaseGoodVo=new PurchaseGoodVO();
			goodsVo=new GoodsVO();
			purchaseGoodVo.setPurchaseGoodId(rs.getInt("purchaseGoodId"));
			purchaseGoodVo.setPurchaseId(rs.getInt("purchaseId"));
			purchaseGoodVo.setGoodId(rs.getInt("goodId"));
			purchaseGoodVo.setPurchaseNum(rs.getString("purchaseNum"));
			purchaseGoodVo.setQuantity(rs.getInt("quantity"));
			purchaseGoodVo.setPurchasePrice(rs.getDouble("purchasePrice"));
			purchaseGoodVo.setRemark_1(rs.getString("remark_1"));

			purchaseGoodVo.setPurchaseSum(rs.getDouble("purchaseSum"));
			purchaseGoodVo.setGoodName(rs.getString("goodName"));
			purchaseGoodVo.setSku(rs.getString("sku"));
			purchaseGoodVo.setGoodPrice(rs.getDouble("goodPrice"));
			purchaseGoodVo.setGoodRepertory(rs.getInt("goodRepertory"));
			purchaseGoodVo.setGoodPicture(rs.getString("goodPicture"));
			list.add(purchaseGoodVo);
		}
		return list;
	}

	@Override
	public List<GoodsVO> getGoodByPurchaseId(int purchaseId) {
		// TODO Auto-generated method stub
		return null;
	}

	

	
}
