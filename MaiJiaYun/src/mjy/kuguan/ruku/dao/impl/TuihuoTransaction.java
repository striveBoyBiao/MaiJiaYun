package mjy.kuguan.ruku.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

import mjy.common.util.jdbc.JdbcUtil;
import mjy.common.util.jdbc.TransactionManager;
import mjy.kuguan.ruku.dao.RukuUserDao;
import mjy.kuguan.ruku.po.TuihuorukuPO;


/**
 * 退货单用事务：退货入库表删除 与 已完成入库表插入
 * @author student
 *
 */
public class TuihuoTransaction {
	//设置本类入库单类型显示内容
	private final String RUKU_TYPE = "销售退货入库";
	
	private Connection conn;
	private PreparedStatement prep;
	private TransactionManager transactionManager;
	private RukuUserDao rukuUserDao = new RukuUserDaoImpl();
	
	/**
	 * 【事务操作】
	 * 将该条退货入库单1.插入入库完成表 2.从销售退货入库单删除
	 * @param tuihuorukuPO
	 * @param wanchengChecker
	 */
	public void tuihuoruku(int tuihuoBossId, TuihuorukuPO tuihuorukuPO, int wanchengChecker){
		//获取连接
		conn = JdbcUtil.getConnection();
		
		//将连接部署在事务管理器上
		transactionManager = JdbcUtil.getTransactionManager();
		
		//开启事务
		transactionManager.startTransaction();
		
		/*	事务执行主体	*/
		
		//插入语句
		String sqlInsert = "insert into kuguan_rukuwancheng values(?,?,?,?,?,?,?,?,?,?,?)";
		//删除语句
		String sqlDelete = "delete from kuguan_tuihuoruku where tuihuoBossId = ? and tuihuoCode = ?";
		
		
		try {
			//执行插入操作
			prep = conn.prepareStatement(sqlInsert);
			prep.setString(1, Thread.currentThread().hashCode() + "-" + System.currentTimeMillis());//设置业务无关唯一主键
			prep.setInt(2, tuihuoBossId);								//设置当前BossId
			prep.setString(3, tuihuorukuPO.getTuihuoCode());			//设置入库单编号
			prep.setString(4, tuihuorukuPO.getTuihuoTuihuodanCode()); 	//设置相关单号
			prep.setString(5, RUKU_TYPE); 								//设置入库类型
			prep.setInt(6, tuihuorukuPO.getTuihuoInCount()); 			//设置入库数量
			prep.setString(7, tuihuorukuPO.getTuihuoSetTime()); 		//设置制单时间
			prep.setInt(8, rukuUserDao.getSelectIdByName(tuihuorukuPO.getTuihuoAuthor()).get(0)); //设置制单人
			prep.setInt(9, wanchengChecker); 						//设置确认人（唯一输入）
			prep.setString(10, new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));//获取当前时刻作为确认时间
			prep.setString(11, tuihuorukuPO.getTuihuoNote()); 			//设置本单备注
			prep.executeUpdate();
			
			//int i = 1/0;	//测试
			
			//执行删除操作
			prep = conn.prepareStatement(sqlDelete);
			prep.setInt(1, tuihuoBossId);
			prep.setString(2, tuihuorukuPO.getTuihuoCode());
			prep.executeUpdate();
			
		} catch (Exception e) {//此处Exception应包含上述所有可能异常
			// 异常回滚&释放
			transactionManager.rollbackAndClose();
			e.printStackTrace();
			return;
			
		} finally {
			//无异常提交事物&释放链接
			transactionManager.commitAndClose();
		}
	}
}
