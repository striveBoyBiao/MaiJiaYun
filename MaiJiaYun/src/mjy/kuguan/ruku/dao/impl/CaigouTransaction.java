package mjy.kuguan.ruku.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

import mjy.common.util.jdbc.JdbcUtil;
import mjy.common.util.jdbc.TransactionManager;
import mjy.kuguan.ruku.dao.RukuUserDao;
import mjy.kuguan.ruku.po.CaigourukuPO;


/**
 * 采购单用事务：采购入库表删除 与 已完成入库表插入
 * @author student
 *
 */
public class CaigouTransaction {
	//设置本类入库单类型显示内容
	private final String RUKU_TYPE = "采购入库";
	
	private Connection conn;
	private PreparedStatement prep;
	private TransactionManager transactionManager;
	private RukuUserDao rukuUserDao = new RukuUserDaoImpl();
	/**
	 * 【事务操作】
	 * 将该条采购入库单1.插入入库完成表2.从采购入库表中删除
	 * @param 该条采购单PO对象
	 * @param 该单入库确认人
	 */
	public void caigouruku(int caigouBossId, CaigourukuPO caigourukuPO, int wanchengChecker){
		//获取连接
		conn = JdbcUtil.getConnection();
		
		//把连接部署给事务管理
		transactionManager = JdbcUtil.getTransactionManager();
		
		//设置非自动提交,开启事务
		transactionManager.startTransaction();
		
		/*	事务执行主体	*/
		
		//插入语句
		String sqlInsert = "insert into kuguan_rukuwancheng values(?,?,?,?,?,?,?,?,?,?,?)";
		//删除语句
		String sqlDelete = "delete from kuguan_caigouruku where caigouBossId = ? and caigouCode = ?";
		
		try {
			// 执行插入操作
			prep = conn.prepareStatement(sqlInsert);
			prep.setString(1, Thread.currentThread().hashCode() + "-" + System.currentTimeMillis());//设置业务无关唯一id
			prep.setInt(2,caigouBossId);								//设置bossId
			prep.setString(3, caigourukuPO.getCaigouCode());			//设置入库单编号
			prep.setString(4, caigourukuPO.getCaigouCaigoudanCode());	//设置相关单据号
			prep.setString(5, RUKU_TYPE);								//设置入库类型
			prep.setInt(6, caigourukuPO.getCaigouInCount());			//设置入库数量
			prep.setString(7, caigourukuPO.getCaigouSetTime());			//设置制单时间
			prep.setInt(8, rukuUserDao.getSelectIdByName(caigourukuPO.getCaigouAuthor()).get(0));	//设置制单人
			prep.setInt(9, wanchengChecker); 							//设置确认人（唯一输入）
			prep.setString(10, new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));//获取当前时刻（HH为24小时制）
			prep.setString(11, caigourukuPO.getCaigouNote()); 			//设置本单备注
			prep.executeUpdate();
			
			//int i=1/0;	//测试
			
			// 执行删除操作
			prep = conn.prepareStatement(sqlDelete);
			prep.setInt(1, caigouBossId);
			prep.setString(2, caigourukuPO.getCaigouCode());
			prep.executeUpdate();
			
		} catch (Exception e) {//此处Exception应包含上述所有可能异常
			// 期间出现异常时,回滚&释放链接
			transactionManager.rollbackAndClose();
			e.printStackTrace();
			return;//防止运行finally
			
		} finally {
			// 无异常，提交事务&释放链接
			transactionManager.commitAndClose();
		}

	}
	 
}
