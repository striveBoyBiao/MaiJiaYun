package mjy.kefu.service;

import mjy.common.util.jdbc.JdbcUtil;
import mjy.common.util.jdbc.TransactionManager;
import mjy.kefu.dao.OrderDelete;

public class OrderDeleteService {
	private OrderDelete orderdelete=new OrderDelete();
	
	
	public boolean orderDelete(String orderCode,int userId) throws Exception {
		/*orderInsert.orderInsert(orderBeanVOLyl);
		int result=orderDetailInsert.orderDetailInsert(array);
		if(result==0){
			return false;
		}else{
			return true;
		}*/
		TransactionManager tm=null;
		try {

			tm=JdbcUtil.getTransactionManager();
			// 开启事物 setAutoCommit=false;
			tm.startTransaction();
			orderdelete.orderDetailDelete(orderCode);
			orderdelete.orderOrderDelete(orderCode,userId);
			orderdelete.yiShouDelete(orderCode);
			// 提交事物 关闭连接
			tm.commitAndClose();
			return true;
		} catch (Exception ex) {
			// 回滚事物 关闭连接
			tm.rollbackAndClose();
			ex.printStackTrace();
			return false;
		}
	}
}