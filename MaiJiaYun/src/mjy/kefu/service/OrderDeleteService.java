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
			// �������� setAutoCommit=false;
			tm.startTransaction();
			orderdelete.orderDetailDelete(orderCode);
			orderdelete.orderOrderDelete(orderCode,userId);
			orderdelete.yiShouDelete(orderCode);
			// �ύ���� �ر�����
			tm.commitAndClose();
			return true;
		} catch (Exception ex) {
			// �ع����� �ر�����
			tm.rollbackAndClose();
			ex.printStackTrace();
			return false;
		}
	}
}