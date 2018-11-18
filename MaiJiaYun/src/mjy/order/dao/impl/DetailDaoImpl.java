package mjy.order.dao.impl;
/**
 * 买家表查询
 */
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mjy.order.bean.vo.Detail;
import mjy.order.dao.DetailDao;
import mjy.order.dao.RowMap;

public class DetailDaoImpl extends BaseDao<Detail> implements DetailDao{

	
	//对表order_detail中的所有数据进行查询
	@Override
	public List<Detail> detailQuery() {
		String sql ="select * from order_detail";
		List<Object> parames=new ArrayList<Object>();
		
		return query(sql, parames, new RowMapAdaptive<Detail>() {
			
			@Override
			public List<Detail> mapRows(ResultSet res) {
				List<Detail> list=null;
				try {
					while(res.next()){
						list=new ArrayList<Detail>();
						Detail detail= new Detail();
						detail.setDetailId(res.getInt("detailId"));
						detail.setOrderId(res.getInt("orderId"));
						detail.setGoodId(res.getInt("goodId"));
						detail.setWareHouserId(res.getInt("wareHouserId"));
						detail.setDetailGoodNum(res.getInt("detailGoodNum"));
						detail.setGoodPrice(res.getDouble("goodPrice"));
						detail.setDetailGoodPrivilege(res.getDouble("detailGoodPrivilege"));
						detail.setDetailGoodDiscount(res.getFloat("detailGoodDiscount"));
						detail.setDetailSellPrice(res.getDouble("detailSellPrice"));
						detail.setDetailTotal(res.getDouble("detailTotal"));
						
						list.add(detail);
						
					}
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
				return list;
			}
		});
		
	}

}
