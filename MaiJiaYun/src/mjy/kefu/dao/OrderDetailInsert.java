package mjy.kefu.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.common.util.jdbc.BaseDao;
import mjy.kefu.beans.OrderDetailBeanVO;

public class OrderDetailInsert extends BaseDao<Object>{
	public boolean orderDetailInsert(List<OrderDetailBeanVO> array) {
		boolean result=true;
		for(int index=0;index<array.size();index++){
			String sql="insert into order_detail(orderCode,goodId,wareHouserId,detailGoodNum,goodPrice,detailGoodPrivilege,detailSellPrice,detailTotal) VALUES(?,?,?,?,?,?,?,?);";
			List<Object> arrays = new ArrayList<Object>();
			arrays.add(((OrderDetailBeanVO)array.get(index)).getOrderCode());
			arrays.add(((OrderDetailBeanVO)array.get(index)).getGoodId());
			arrays.add(((OrderDetailBeanVO)array.get(index)).getWareHouseId());
			arrays.add(((OrderDetailBeanVO)array.get(index)).getDetailGoodNum());
			arrays.add(((OrderDetailBeanVO)array.get(index)).getGoodPrice());
			arrays.add(((OrderDetailBeanVO)array.get(index)).getDetailGoodPrivilege());
			//arrays.add(((OrderDetailBeanVO)array.get(index)).getDetailGoodDiscount());
			arrays.add(((OrderDetailBeanVO)array.get(index)).getDetailSellPrice());
			arrays.add(((OrderDetailBeanVO)array.get(index)).getDetailTotal());
			result=result&&SaveOrUpdate(sql, arrays);
		}
		return result;
	}

	@Override
	public List<Object> mapRow(ResultSet rs) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}
