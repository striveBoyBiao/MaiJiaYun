package mjy.kuguan.chukudan.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import mjy.common.util.jdbc.TransactionManager;


public class JdbcUtil {
	static String url = "jdbc:mysql://192.168.41.2:3306/maijiayun?characterEncoding=utf8";
	static String user = "sa";
	static String password = "sa";
	
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
	//	if(conn==null){
			try {
				conn = DriverManager.getConnection(url, user, password);
				connections.set(conn);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//����ȡ����connection���浽ThreadLocal��
	//	}
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
