
package mjy.kefu.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.common.util.jdbc.BaseDao;

public class OrderDelete extends BaseDao<Object> {
	public boolean orderDetailDelete(String orderCode){
		String sql="delete  from order_detail where orderCode = ?";
//				+" and userId = '"+userId+"'";
		ArrayList<Object> params=new ArrayList<Object>();
		params.add(orderCode);
		return SaveOrUpdate(sql, params);
	}
	
	public boolean orderOrderDelete(String orderCode,int userId){
		String sql="delete  from order_order where orderCode = ?"
				+" and userId = '"+userId+"'";
		ArrayList<Object> params=new ArrayList<Object>();
		params.add(orderCode);
		return SaveOrUpdate(sql, params);
	}
	public boolean yiShouDelete(String orderCode){
		String sql="delete  from caiwu_shoukuan where skReceiptsCode = ?";
//				+" where userId = ";
		ArrayList<Object> params=new ArrayList<Object>();
		params.add(orderCode);
		return SaveOrUpdate(sql, params);
	}
	
	@Override
	public List<Object> mapRow(ResultSet rs) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	
}