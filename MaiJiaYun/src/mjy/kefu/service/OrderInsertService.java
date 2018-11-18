package mjy.kefu.service;

import java.util.List;

import mjy.common.util.jdbc.JdbcUtil;
import mjy.common.util.jdbc.TransactionManager;
import mjy.kefu.beans.OrderBeanPOLyl;
import mjy.kefu.beans.OrderDetailBeanVO;
import mjy.kefu.dao.OrderDetailInsert;
import mjy.kefu.dao.OrderInsert;

public class OrderInsertService {
	private OrderInsert orderInsert=new OrderInsert();
	private OrderDetailInsert orderDetailInsert=new OrderDetailInsert();
	
	public boolean orderInsert(OrderBeanPOLyl orderBeanVOLyl,List<OrderDetailBeanVO> array) throws Exception {
		TransactionManager tm=null;
		try {

			tm=JdbcUtil.getTransactionManager();
			// �������� setAutoCommit=false;
			tm.startTransaction();
			
			orderInsert.orderInsert(orderBeanVOLyl);
			orderDetailInsert.orderDetailInsert(array);
			orderInsert.yiShouInsert(orderBeanVOLyl);
			
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
