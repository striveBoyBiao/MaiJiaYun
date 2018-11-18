package mjy.caigou.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import mjy.caigou.dao.BaseDao;
import mjy.caigou.dao.GoodsDao;
import mjy.caigou.dao.KuCunCSHQueryDao;
import mjy.caigou.po.KuCunCSHGoods2PO;
import mjy.caigou.po.KuCunCSHGoodsPO;
import mjy.caigou.vo.GoodsVO;
import mjy.common.util.jdbc.JdbcUtil;


/**
 * 库存初始化界面查询dao层
 * @author 第九小组组员张俊
 *
 */

public class KuCunCSHQueryDaoImpl extends BaseDao<KuCunCSHGoodsPO> implements KuCunCSHQueryDao {

	
	
	

	
	
	/**
	 * condition:所在仓库，是否显示未设置数量的商品，搜索框的：商品名称和商品货号
	 * return:当前用户的商品商品
	 */
	@Override
	public List<KuCunCSHGoodsPO> MultiQuery(String buttonValue, String searchValue, String stockStatus, int userId) {
		
		int warehouseId=getWarehouseId(buttonValue, userId);
		String sql="";
		
		//参数
		List<Object> params = new  ArrayList<>();
		
		List<Object> params1 = new ArrayList<>();
		List<Object> params2 = new ArrayList<>();
		
		//sql查询出来的数值
		List<KuCunCSHGoodsPO> queryGoods=new ArrayList<KuCunCSHGoodsPO>();
		//最终结果
		List<KuCunCSHGoodsPO> resultGoods=new ArrayList<KuCunCSHGoodsPO>();
		
		List<KuCunCSHGoodsPO> queryGoods1=new ArrayList<KuCunCSHGoodsPO>();
		List<KuCunCSHGoods2PO> queryGoods2=new ArrayList<KuCunCSHGoods2PO>();
		
		
		if(stockStatus.equals("1")){
			//表示只显示未设置数量的商品 （某个仓库）
			sql="select * from caigou_goods where goodId in( select goodId from caigou_gooduserstatus where userId=?) and goodId not in(select goodId from caigou_goodwarehouse where warehouseId=?)";
			params.add(userId);
			params.add(warehouseId);
			queryGoods=this.queryForList(sql, params);
				
				if(searchValue==""){
					//搜索框无条件
					resultGoods.addAll(queryGoods);
					//System.out.println("无搜索条件");
				}else{
					//搜索框有条件:商品名称 或商品货号（int） 模糊查询
					for (KuCunCSHGoodsPO goods : queryGoods) {
						if(goods.getGoodName()!=null&&(goods.getGoodId()+"")!=null&&(goods.getGoodName().indexOf(searchValue)!=-1||(goods.getGoodId()+"").indexOf(searchValue)!=-1)){
							resultGoods.add(goods);
							//System.out.println("有搜索条件");
						}
					}
				}
			
	
		}else{
		    //显示所有商品的数量（设置和未设置的）
			//查询当前用户所有的商品
			sql="select * from caigou_goods where goodId in(select goodId from caigou_gooduserstatus where userId=?)";
			params1.add(userId);
			//当前用户的所有的商品
			queryGoods1=this.queryForList(sql, params1);
			
			//当前仓库的已设置库存商品
			queryGoods2=getGoodIdById(warehouseId);
			
			//注意：queryGoods1集合包含queryGoods2集合
			
			for (KuCunCSHGoodsPO kuCunCSHGoodsPO : queryGoods1) {
				
				for (KuCunCSHGoods2PO kuCunCSHGoods2PO : queryGoods2) {
					if(kuCunCSHGoodsPO.getGoodId()==kuCunCSHGoods2PO.getGoodId()){
						kuCunCSHGoodsPO.setGoodCount(kuCunCSHGoods2PO.getGoodCount());
					}
				}
			}
			
			if(searchValue==""){
				//搜索框无条件
				resultGoods.addAll(queryGoods1);
				System.out.println("xixi");
			}else{
				//搜索框有条件:商品名称 或商品货号（int） 模糊查询
				for (KuCunCSHGoodsPO goods : queryGoods1) {
					if(goods.getGoodName()!=null&&(goods.getGoodId()+"")!=null&&(goods.getGoodName().indexOf(searchValue)!=-1||(goods.getGoodId()+"").indexOf(searchValue)!=-1)){
						resultGoods.add(goods);
						
					}
				}
			}
		
		}
		
		return resultGoods;
	}

	
	
	
	
	/**
	 * 通过仓库Id得到已设置库存商品   该仓库的是当前用户的
	 * return  某个仓库的所有的已设置库存商品
	 * @author 第九小组组员张俊
	 */
	
	public List<KuCunCSHGoods2PO> getGoodIdById(int warehouseId){
		//查询当前某个仓库的已设置商品
		String sql="select * from caigou_goodwarehouse where warehouseId=?";
		Connection connection = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		
		List<KuCunCSHGoods2PO> goods=new ArrayList<KuCunCSHGoods2PO>();
		KuCunCSHGoods2PO good=null;
		
		
		try {
			connection = JdbcUtil.getConnection();
			stat = connection.prepareStatement(sql);
			stat.setInt(1,warehouseId);
			rs=stat.executeQuery();
			while(rs.next()){
				good=new KuCunCSHGoods2PO();
				good.setGoodId(rs.getInt("goodId"));
				good.setGoodCount(rs.getInt("goodCount"));
				goods.add(good);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.free(connection);
		}
		return goods;
	}
	
	
	/**
	 * 通过仓库名得到当前用户的仓库id
	 * return  仓库的ID
	 * @author 第九小组组员张俊
	 */
	@Override
	public int getWarehouseId(String buttonValue, int userId) {
		int warehouseId=-1;
		
		String sql="select wareHouseId from  caigou_warehouse  where wareHouseName=? and  userId=?";
		Connection connection = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		
		try {
			connection = JdbcUtil.getConnection();
			stat = connection.prepareStatement(sql);
			stat.setString(1,buttonValue);
			stat.setInt(2, userId);
			rs=stat.executeQuery();
			while(rs.next()){
				warehouseId=rs.getInt("wareHouseId");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.free(connection);
		}
		
		return warehouseId;
	}
	

	/**
	 * 查询所有出已设置库存的商品goodId
	 * @author 第九小组组员张俊
	 */
	@Override
	public List<Integer> queryGoodId(int warehouseId) {
		String sql="select goodId from caigou_goodwarehouse where  warehouseId=?";
		List<Integer> goodIds=new ArrayList<>();
		//数据库操作
		Connection connection = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		
		try {
			connection = JdbcUtil.getConnection();
			stat = connection.prepareStatement(sql);
			stat.setInt(1, warehouseId);
			rs=stat.executeQuery();
			while(rs.next()){
				goodIds.add(rs.getInt("goodId"));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

		return goodIds;
	}
	
	
	/**
	 * 插入库存
	 * @author 第九小组组员张俊
	 */
	@Override
	public void insertGoodCount(int goodId, int warehouseId, int goodCount,String buttonValue) {
		String sql="insert into caigou_goodwarehouse values (?,?,?,?)";
		List<Object> params = new  ArrayList<>();
		params.add(goodId);
		params.add(warehouseId);
		params.add(goodCount);
	    params.add(buttonValue);
		this.SaveOrUpdate(sql, params);
		
	}

	/**
	 * 更新库存
	 * @author 第3小组组组长李金城
	 */
	@Override
	public void updateGoodCount(int goodId,int warehouseId, int goodCount) {
		
		String sql = "update caigou_goodwarehouse set goodCount = ? where goodId = ? and warehouseId=?";
		List<Object> params = new  ArrayList<>();
		params.add(goodCount);
		params.add(goodId);
		params.add(warehouseId);
		this.SaveOrUpdate(sql, params);
	}

	
	
	
	@Override
	public List<KuCunCSHGoodsPO> mapRow(ResultSet rs) throws Exception {
		List<KuCunCSHGoodsPO> goods=new ArrayList<KuCunCSHGoodsPO>();
		KuCunCSHGoodsPO kuncunGoods=null;
		while(rs.next()){
			kuncunGoods=new KuCunCSHGoodsPO();
			kuncunGoods.setSku(rs.getString("sku"));
			kuncunGoods.setGoodName(rs.getString("goodName"));
			kuncunGoods.setGoodId(rs.getInt("goodId"));
			kuncunGoods.setGoodCount(0);
			goods.add(kuncunGoods);
		}
		
		return goods;
	}





}
