package mjy.common.util.jdbc;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * 管理连接对象的提交 、回滚 、开启事务等操作
 * @author igeek
 *
 */
public class TransactionManager {
	private Connection connection = null;
	
	public TransactionManager(Connection connection){
		this.connection=connection;
	}
	
	
	/**
	 * 开启事务
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
	 * 提交事务
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
	 * 回滚事务
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
