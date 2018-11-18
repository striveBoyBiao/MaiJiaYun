package mjy.common.util.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class JdbcUtil {
	static String url = "jdbc:mysql://localhost:3306/mjy?characterEncoding=utf8";
	static String user = "root";
	static String password = "root";
	
	//ʹ��ThreadLocalΪÿ���̱߳���connection�ĸ���
	static ThreadLocal<Connection> connections=new ThreadLocal<Connection>();
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static Connection getConnection() {
		//1.��ThreadLocal�л�ȡ��ǰ�̵߳�connection
		Connection conn = connections.get();
		if(conn==null){
			try {
				conn = DriverManager.getConnection(url, user, password);
				connections.set(conn);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//����ȡ����connection���浽ThreadLocal��
			connections.set(conn);		
			}
		return conn;
	}

	/**
	 * ��������������
	 * @return
	 */
	public static TransactionManager getTransactionManager() {
		return new TransactionManager(getConnection());
	}
	
	public static void free(Connection conn) {
		try {
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			//ɾ��ThreadLocal�е�ǰ�̶߳�Ӧ��connection
			connections.remove();
		}
	}
}
