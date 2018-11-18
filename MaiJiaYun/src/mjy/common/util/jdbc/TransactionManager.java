package mjy.common.util.jdbc;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * �������Ӷ�����ύ ���ع� ����������Ȳ���
 * @author igeek
 *
 */
public class TransactionManager {
	private Connection connection = null;
	
	public TransactionManager(Connection connection){
		this.connection=connection;
	}
	
	
	/**
	 * ��������
	 */
	public void startTransaction(){
		try {
			connection.setAutoCommit(false);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * �ύ����
	 */
	public void commitAndClose(){
		
		try {
			connection.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JdbcUtil.free(connection);
		}
		
	}
	
	/**
	 * �ع�����
	 */
	public void rollbackAndClose(){
		try {
			connection.rollback();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JdbcUtil.free(connection);
		}
		
	}
	
}
