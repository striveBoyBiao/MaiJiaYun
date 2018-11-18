package mjy.kuguan.ruku.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import mjy.common.util.jdbc.JdbcUtil;
import mjy.common.util.jdbc.TransactionManager;
import mjy.kuguan.ruku.dao.RukuUserDao;
import mjy.kuguan.ruku.po.DiaoborukuPO;

/**
 * 调拨单用事务：调拨入库单删除 与 已完成入库表插入
 * @author student
 *
 */
public class DiaoboTransaction {
	//设置本类入库类型显示内容
	private final String RUKU_TYPE = "调拨入库";
	
	private Connection conn;
	private PreparedStatement prep;
	private TransactionManager transactionManager;
	private RukuUserDao rukuUserDao = new RukuUserDaoImpl();
	
	/**
	 * 【实务操作】
	 * 将该条调拨入库单1.插入入库完成表 2.从采购入库表中删除
	 * @param diaoborukuPO
	 * @param wanchengChecker
	 */
	public void diaoboruku(int diaoboBossId, DiaoborukuPO diaoborukuPO, int wanchengChecker){
		//获取连接
		conn = JdbcUtil.getConnection();

		//将连接部署于事务管理
		transactionManager = JdbcUtil.getTransactionManager();
		
		//开启事务，关闭自动提交
		transactionManager.startTransaction();
		
		/*	事务执行主体	*/
		
		//插入语句
		String sqlInsert = "insert into kuguan_rukuwancheng values(?,?,?,?,?,?,?,?,?,?,?)";
		//删除语句
		String sqlDelete = "delete from kuguan_diaoboruku where diaoboBossId = ? and diaoboCode = ?";
		
		try {
			//执行插入操作
			prep = conn.prepareStatement(sqlInsert);
			prep.setString(1, Thread.currentThread().hashCode() + "-" + System.currentTimeMillis());
			prep.setInt(2, diaoboBossId);
			prep.setString(3, diaoborukuPO.getDiaoboCode());			//设置入库单编号
			prep.setString(4, diaoborukuPO.getDiaoboDiaobodanCode());	//设置相关单据号
			prep.setString(5, RUKU_TYPE); 								//设置入库类型
			prep.setInt(6, diaoborukuPO.getDiaoboInCount()); 			//设置入库数量
			prep.setString(7, diaoborukuPO.getDiaoboSetTime()); 		//设置制单时间
			prep.setInt(8, rukuUserDao.getSelectIdByName(diaoborukuPO.getDiaoboAuthor()).get(0)); 			//设置制单人
			prep.setInt(9, wanchengChecker); 						//设置确认人（唯一输入项）
			prep.setString(10, new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));//设置确认时间
			prep.setString(11, diaoborukuPO.getDiaoboNote()); 			//设置本单备注
			prep.executeUpdate();
			
			//int i=1/0;	//测试
			
			//执行删除操作
			prep = conn.prepareStatement(sqlDelete);
			prep.setInt(1, diaoboBossId);
			prep.setString(2, diaoborukuPO.getDiaoboCode());
			prep.executeUpdate();
			
		} catch (Exception e) {//此处Exception应包含上述所有可能异常
			// 期间出现异常时,回滚&释放链接
			transactionManager.rollbackAndClose();
			e.printStackTrace();
			return;//防止运行finally
		} finally {
			//无异常则提交
			transactionManager.commitAndClose();
		}
	}
}
