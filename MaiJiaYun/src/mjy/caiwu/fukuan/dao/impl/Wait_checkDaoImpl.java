package mjy.caiwu.fukuan.dao.impl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import mjy.caiwu.fukuan.beans.FuKuanVo;
import mjy.caiwu.fukuan.beans.WcPageInfo;
import mjy.caiwu.fukuan.dao.Wait_checkDao;
import mjy.common.util.jdbc.JdbcUtil;
/**
 * 待财务审核
 * @author student
 *
 */
public class Wait_checkDaoImpl extends BaseDao<FuKuanVo> implements  Wait_checkDao {

	/**
	 * 从付款中查询数据
	 * 
	 */
	@Override
	public List<FuKuanVo> queryFk(List<Integer> allId) {
		List<Object> list=new ArrayList<>();
		String sql="select fkNo,fkSkName,fkNumber,fkShouldpayMoney,userNickname,fkCreaterTime from caiwu_fukuan cf join common_user cu on cf.fkCreaterId=cu.userId  where fkState=1 and fkCreaterId in (";
		
		for(int i=0;i<allId.size();i++){
			list.add(allId.get(i));
			if(i==0){
				sql+="?";
			}else{
				sql+=",?";
			}
			
		}
		
		sql+=")";
		
		sql+="order by fkCreaterTime desc";
		
		
		sql = sql + " LIMIT " + WcPageInfo.pageBegin + ","+WcPageInfo.pageSize;
		
		List<FuKuanVo> waitCheck=queryForList(sql,list);
		
		return waitCheck;
	}
	
	
	/**
	 *处理结果集
	 */
	@Override
	public List<FuKuanVo> mapRow(ResultSet rs) throws Exception {
		List<FuKuanVo> list=new ArrayList<>();
		FuKuanVo waitCheck=null;
		while(rs.next()){
			
			waitCheck=new FuKuanVo();
			waitCheck.setFkNo(rs.getString("fkNo"));
			waitCheck.setFkSkName(rs.getString("fkSkName"));
			waitCheck.setFkNumber(rs.getInt("fkNumber"));
			waitCheck.setFkShouldpayMoney(rs.getDouble("fkShouldpayMoney"));
			waitCheck.setOther1(rs.getString("userNickname"));
			waitCheck.setFkCreaterTime(rs.getString("fkCreaterTime"));
			list.add(waitCheck);
		}
		return list;
	}
	
	
	
	/**
	 * 查询有多少条数据
	 */
	@Override
	public  int queryCount(List<Integer> allId) {
		List<Object> list=new ArrayList<>();
		String	sql="select count(*) from caiwu_fukuan where  fkState=1 and fkCreaterId in (";
		for(int i=0;i<allId.size();i++){
			list.add(allId.get(i));
			if(i==0){
				sql+="?";
			}else{
				sql+=",?";
			}
			
		}
		
		sql+=")";
		
		List<Integer> num=getCount(sql,list);
		
		int s=0;
		if(num.size()>0){
			s=num.get(0);
		}
		
		return s;
	}
	
	
	/**
	 * 查询有多少条数据
	 */
	public List<Integer> getCount(String sql, List<Object> params){
		Connection connection = null;
		PreparedStatement stat = null;
		ResultSet rs = null;

		List<Integer> objs = new ArrayList<Integer>();
		try {
			connection = JdbcUtil.getConnection();

			stat = connection.prepareStatement(sql);
			int parameterIndex = 1;
			for (int i=0;i<params.size();i++) {
				stat.setObject(parameterIndex, params.get(i));
				parameterIndex++;
			}
			rs = stat.executeQuery();
			while(rs.next()){
				objs.add(rs.getInt(1));
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		} finally {
			JdbcUtil.free(connection);
		}
		return objs;
	}
	
	

	/**
	 * 从采购中查询数据
	 * 
	 * 
	 */
	@Override
	public List<FuKuanVo> queryCg(String purchaseCode) {
		List<Object> list=new ArrayList<>();
		list.add(purchaseCode);
		String sql="select purchaseCode,supplierCName,purchaseNumber,purchaseSum,cp.userId,creatTime from caigou_purchase cp join caigou_supplier cs on cp.supplierId=cs.supplierId  where cp.purchaseCode=?";
		List<FuKuanVo> fk=getCg(sql,list);
		
		return fk;
	}
	
	
	
	/**
	 *从采购中查询数据
	 */
	public List<FuKuanVo> getCg(String sql, List<Object> params){
		Connection connection = null;
		PreparedStatement stat = null;
		ResultSet rs = null;

		List<FuKuanVo> objs = new ArrayList<FuKuanVo>();
		try {
			connection = JdbcUtil.getConnection();

			stat = connection.prepareStatement(sql);
			int parameterIndex = 1;
			for (int i=0;i<params.size();i++) {
				stat.setObject(parameterIndex, params.get(i));
				parameterIndex++;
			}

			rs = stat.executeQuery();
			while(rs.next()){
				FuKuanVo fk=new FuKuanVo();
				fk.setFkNo(rs.getString("purchaseCode"));
				fk.setFkSkName(rs.getString("supplierCName"));
				fk.setFkNumber(rs.getInt("purchaseNumber"));
				fk.setFkShouldpayMoney(rs.getDouble("purchaseSum"));
				fk.setFkCreaterId(rs.getInt("userId"));
				fk.setFkCreaterTime(rs.getString("creatTime"));
				fk.setFkState(1);
				objs.add(fk);
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		} finally {
			JdbcUtil.free(connection);
		}
		return objs;
		
	}
	

	
	

	/**
	 *将数据插入到付款单中
	 */
	@Override
	public void insert(List<FuKuanVo> waitCheck) {
		List<Object> list=null;
		String sql="insert into caiwu_fukuan(fkNo,fkSkName,fkNumber,fkShouldpayMoney,fkShouzhilxId,fkCreaterId,fkCreaterTime,fkState,fkzhDafaultId) value(?,?,?,?,?,?,?,?,?)";
		for(int i=0;i<waitCheck.size();i++){
			
			list=new ArrayList<>();
			list.add(waitCheck.get(i).getFkNo());
			list.add(waitCheck.get(i).getFkSkName());
			list.add(waitCheck.get(i).getFkNumber());
			list.add(waitCheck.get(i).getFkShouldpayMoney());
			list.add(3);
			list.add(waitCheck.get(i).getFkCreaterId());
			list.add(waitCheck.get(i).getFkCreaterTime());
			list.add(waitCheck.get(i).getFkState());
			list.add(waitCheck.get(i).getFkzhDafaultId());
		}
		SaveOrUpdate(sql, list);
	}

	

	

	
	/**
	 * 模糊查询数据
	 */
	@Override
	public List<FuKuanVo> querySelect(String str,List<Integer> allId) {
		String sql="select fkNo,fkSkName,fkNumber,fkShouldpayMoney,userNickname,fkCreaterTime from caiwu_fukuan cf join common_user cu on cf.fkCreaterId=cu.userId  where fkState=1 and (fkNo like ? or fkSkName like ? or fkSkNickName like ? ) and fkCreaterId in (";
		List<Object> list=new ArrayList<>();
		list.add("%"+str+"%");
		list.add("%"+str+"%");
		list.add("%"+str+"%");
		for(int i=0;i<allId.size();i++){
			list.add(allId.get(i));
			if(i==0){
				sql+="?";
			}else{
				sql+=",?";
			}
			
		}
		
		sql+=")";
		
		sql+="order by fkCreaterTime desc";
		
		
		
		sql = sql + " LIMIT " + WcPageInfo.pageBegin + ","+WcPageInfo.pageSize;
		List<FuKuanVo> waitCheck=queryForList(sql,list);
		return waitCheck;
	}

	
	/**
	 *获取银行卡ID
	 */
	@Override
	public List<Integer> queryfkzhBankId(int bossId){
		List<Integer> dafaultBankId=new ArrayList<>();
		List<Object> list=new ArrayList<>();
		List<Object> list2=null;
		Integer fkzhDafaultId=null;
		String sql="select shopId from caigou_shop where userId=?";
		String sql2="select fkzhDafaultId from caiwu_fukuanzh where flshopId=? and dafaultBankId=1 ";
		list.add(bossId);
		List<Integer> shopId=getCount(sql,list);
		for(int i=0;i<shopId.size();i++){
			list2=new ArrayList<>();
			list2.add(shopId.get(i));
			fkzhDafaultId=getfkzhDafaultId(sql2,list2);
			if(fkzhDafaultId!=null){
				dafaultBankId.add(fkzhDafaultId);
			}
		}
		return dafaultBankId;
	}
	
	
	
	/**
	 * 获取银行卡ID
	 */
	public Integer getfkzhDafaultId(String sql, List<Object> params){
		Connection connection = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		Integer fkzhDafaultId=null;
		try {
			connection = JdbcUtil.getConnection();
			stat = connection.prepareStatement(sql);
			int parameterIndex = 1;
			for (int i=0;i<params.size();i++) {
				stat.setObject(parameterIndex, params.get(i));
				parameterIndex++;
			}
			rs = stat.executeQuery();
			
			while(rs.next()){
				fkzhDafaultId=rs.getInt("fkzhDafaultId");
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		} finally {
			JdbcUtil.free(connection);
		}
		return fkzhDafaultId;
		
	}

	/**
	 *修改付款单的状态为2
	 */
	@Override
	public void update(String id) {
		String sql="update caiwu_fukuan set fkState=2 where fkNo=?";
		List<Object> list=new ArrayList<>();
		list.add(id);
		SaveOrUpdate(sql,list);
		
	}
	/**
	 * 修改创建时间
	 */
	@Override
	public void updateTime(String str) {
		List<Object> list=new ArrayList<>();
		String sql="update caiwu_fukuan set fkCreaterTime=? where fkNo=?";
		String s=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ").format(new Date());
		list.add(s);
		list.add(str);
		SaveOrUpdate(sql,list);
	}
	
	/**
	 * 删除数据
	 */
	@Override
	public void delete(String id) {
		String sql="delete from caiwu_fukuan where fkNo=?";
		List<Object> list=new ArrayList<>();
		list.add(id);
		SaveOrUpdate(sql, list);
		
	}


	/**
	 * 修改采购单的状态为1
	 */
	@Override
	public void updataCaoGou(String id) {
		List<Object> list=new ArrayList<>();
		String sql="update caigou_purchase set state=1 where purchaseCode=?";
		list.add(id);
		SaveOrUpdate(sql, list);
		
	}


	/**
	 *修改采购单的状态为3
	 */
	@Override
	public void updataCgState(String id) {
		List<Object> list=new ArrayList<>();
		String sql="update caigou_purchase set state=3 where purchaseCode=?";
		list.add(id);
		SaveOrUpdate(sql, list);
	}


	/**
	 *模糊查询有多少条数据
	 */
	@Override
	public int queryCount(String str,List<Integer> allId) {
		List<Object> list=new ArrayList<>();
		String	sql="select count(*) from caiwu_fukuan where  fkState=1 and (fkNo like ? or fkSkName like ? or fkSkNickName like ? ) and fkCreaterId in (";
		list.add("%"+str+"%");
		list.add("%"+str+"%");
		list.add("%"+str+"%");
		for(int i=0;i<allId.size();i++){
			list.add(allId.get(i));
			if(i==0){
				sql+="?";
			}else{
				sql+=",?";
			}
			
		}
		
		sql+=")";
		
		
		List<Integer> num=getCount(sql,list);
		int s=0;
		if(num.size()>0){
			s=num.get(0);
		}
		return s;
	}


	/**
	 * 找到所有ID
	 */
	@Override
	public List<Integer> selectEmployeeBossID(int bossID) {
		String sql="select userId from common_employee where employeeBossUserId=?";
		List<Object> list=new ArrayList<>();
		list.add(bossID);
		List<Integer> AllId=getCount(sql,list);
		AllId.add(bossID);
		
		return AllId;
	}


	



	

	
	
	
	
	
	
	
	
	
	
}
