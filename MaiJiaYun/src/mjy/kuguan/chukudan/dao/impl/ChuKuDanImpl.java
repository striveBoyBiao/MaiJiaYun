package mjy.kuguan.chukudan.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;


import mjy.kuguan.chukudan.dao.IChuKuDanDao;
import mjy.kuguan.chukudan.po.ChuKuDanPO;
import mjy.kuguan.chukudan.util.JdbcUtil;
import mjy.kuguan.chukudan.vo.ChuKuDanVO;



public class ChuKuDanImpl extends BaseDao<ChuKuDanPO> implements IChuKuDanDao {

	int i=001;
	public void insert(ChuKuDanPO chuku) {
		String sql = "insert into kuguan_chukudan(chukudanCode,chukuxiangguandanCode,chukuType,chukuCangku,chukuNum,"
				+ "chukuPeople,chukuState,chukudanTime,chukudanPeople)"
				+ " value(?,?,?,?,?,?,?,?,?)";

		List<Object> params = new ArrayList<Object>();
		params.add("CKD"+((i++)+""));
		params.add(chuku.getChukuxiangguandanCode());
		params.add(chuku.getChukuType());
		params.add(chuku.getChukuCangku());
		params.add(chuku.getChukuNum());
		params.add("管理员");
		params.add(chuku.getChukuState());
		params.add(chuku.getChukudanTime());
		params.add(chuku.getChukudanPeople());
		this.SaveOrUpdate(sql, params);
	}

	@Test
	public void testss(){
//		ChuKuDanPO chu=new ChuKuDanPO();
//		for (int i = 100; i < 150; i++) {
//			chu.setChukudanCode("CKDB30"+i);
//			chu.setChukuxiangguandanCode("DB30"+i);
//			chu.setChukuType(2);
//			chu.setChukuCangku("一号仓库");
//			chu.setChukuNum(100);
//			chu.setChukuPeople("管理员");
//			chu.setChukuState(2);
//			chu.setChukudanTime("2016-12-01 21:05:03");
//			chu.setChukudanPeople("管理员");
//			insert(chu);
//		}
		
		List<ChuKuDanPO> k = getAllcgu(1,10,null,null);
		for (ChuKuDanPO chuKuDanPO : k) {
			System.out.println(chuKuDanPO.toString());
		}
	}
	
	public void update(ChuKuDanPO chuku) {
		String sql = "update kuguan_chukudan set chukuState=? where chukudanId=?";

		List<Object> params = new ArrayList<Object>();
		params.add(chuku.getChukuState());
		params.add(chuku.getChukudanId());

		this.SaveOrUpdate(sql, params);
	}

	public void deleteByID(int chukudanId) {
		String sql = "delete from kuguan_chukudan where chukudanId=?";

		List<Object> params = new ArrayList<Object>();
		params.add(chukudanId);

		this.SaveOrUpdate(sql, params);
	}

	/**
	 * 多条件的查询
	 * 
	 * @param employeePO
	 * @return
	 */
	@Override
	public List<ChuKuDanPO> listBy(ChuKuDanVO chukuvo) {
		// 存放sql语句执行的参数
		List<Object> params = new ArrayList<Object>();

		// 根据查询参数写出要执行sql语句
		String sql = "select * from kuguan_chukudan where 1=1 ";

		if (chukuvo != null && chukuvo.getChukuType() != null && !chukuvo.getChukuType().equals("")) {
			sql = sql + " and chukuType= ?";
			params.add( chukuvo.getChukuType() );
		}
		if (chukuvo != null && chukuvo.getChukuState() != null && !chukuvo.getChukuState().equals("")) {
			sql = sql + " and chukuState= ?";
			params.add(chukuvo.getChukuState());
		}
		if (chukuvo != null && chukuvo.getChukuCangku() != null && !chukuvo.getChukuCangku().equals("")) {
			sql = sql + " and chukuCangku= ?";
			params.add(chukuvo.getChukuState());
		}
		if (chukuvo != null && chukuvo.getDanCode() != null && !chukuvo.getDanCode().equals("")) {
			sql = sql + " and  ( chukudanCode=? or chukuxiangguandanCode =?)";
			params.add("%" + chukuvo.getDanCode() + "%");
			params.add("%" + chukuvo.getDanCode() + "%");
		}
//      分页查询需要加的内容：
//		if (chukuvo != null && chukuvo.getRowStart() != null) {
//			sql = sql + " LIMIT " + chukuPO.getRowStart() + "," + PageInfo.pageSize;
//		}
		return this.queryForList(sql, params);
	}

	/**
	 * RS->ChuKuDan
	 * 
	 * @throws SQLException
	 */
	@Override
	public List<ChuKuDanPO> mapRow(ResultSet rs) throws Exception {
		List<ChuKuDanPO> chukus = new ArrayList<ChuKuDanPO>();
		ChuKuDanPO chuku = null;

		while (rs.next()) {
			chuku = new ChuKuDanPO();
			chuku.setChukudanId(rs.getInt("chukudanId"));
			chuku.setChukudanCode(rs.getString("chukudanCode"));
			chuku.setChukuxiangguandanCode(rs.getString("chukuxiangguandanCode"));
			chuku.setChukuType(rs.getInt("chukuType"));
			chuku.setChukuCangku(rs.getString("chukuCangku"));
			chuku.setChukuNum(rs.getInt("chukuNum"));;
			chuku.setChukuPeople(rs.getString("chukuPeople"));
			chuku.setChukudanTime(rs.getString("chukudanTime"));
			chuku.setChukudanPeople(rs.getString("chukudanPeople"));
			chuku.setChukuState(rs.getInt("chukuState"));

			chukus.add(chuku);
		}

		return chukus;
	}

	@Test
	public void test1(){
		System.out.println(gettbCount("",""));
		
	}

	
	@Override
	public List<ChuKuDanPO> getAllcgu(int pageNum,int pageSize,String chukuNum,String cangku ) {
		//当前页码的公式=(pageNum-1)*pageSize
		int startIndex = pageNum <= 1?0:(pageNum-1)*pageSize;
		String sql = "select * from kuguan_chukudan where chukuType = 1 and chukuState = 1";
		
		if(chukuNum != null && !chukuNum.equals("")){
			sql += " and chukudanCode like '%"+chukuNum+"%'";
		}
		
		if(cangku != null && !cangku.equals("")){
			sql += " and chukuCangku = '"+cangku+"'";
		}
		
		sql += " limit "+startIndex+","+pageSize;
		return query(sql);
	}
	 
	@Override
	public List<ChuKuDanPO> getAlltb(int pageNum,int pageSize,String chukuNum,String cangku ) {
		int startIndex=pageNum<=1?0:(pageNum-1)*pageSize;
		String sql = "select * from kuguan_chukudan where chukuType = 2 and chukuState = 1";
		
		if(chukuNum != null && !chukuNum.equals("")){
			sql += " and chukudanCode like '%"+chukuNum+"%'";
		}
		
		if(cangku != null && !cangku.equals("")){
			sql += " and chukuCangku = '"+cangku+"'";
		}
		
		sql += " limit "+startIndex+","+pageSize;
		return query(sql);
	}
	
	@Override
	public List<ChuKuDanPO> getAllywc(int pageNum,int pageSize,String chukuNum,String cangku ) {
		int startIndex=pageNum<=1?0:(pageNum-1)*pageSize;
		String sql = "select * from kuguan_chukudan where chukuState = 2";
		
		if(chukuNum != null && !chukuNum.equals("")){
			sql += " and chukudanCode like '%"+chukuNum+"%'";
		}
		
		if(cangku != null && !cangku.equals("")){
			sql += " and chukuCangku = '"+cangku+"'";
		}
		
		sql += " limit "+startIndex+","+pageSize;
		return query(sql);
	}
	
	@Override
	public int getcgCount(String chukuNum,String cangku) {
		String sql="select count(*) from kuguan_chukudan where chukuType = 1 and chukuState = 1";
		
		if(chukuNum !=null && !chukuNum.equals("")){
			sql += " and chukudanCode like '%"+chukuNum+"%'";
		}
		
		if(cangku != null && !cangku.equals("")){
			sql += " and chukuCangku = '"+cangku+"'";
		}
		
		return getNum(sql);
	}

	@Override
	public int gettbCount(String chukuNum,String cangku) {
		String sql="select count(*) from kuguan_chukudan where chukuType = 2 and chukuState = 1";
		
		if(chukuNum !=null && !chukuNum.equals("")){
			sql += " and chukudanCode like '%"+chukuNum+"%'";
		}
		
		if(cangku != null && !cangku.equals("")){
			sql += " and chukuCangku = '"+cangku+"'";
		}
		return getNum(sql);
	}

	@Override
	public int getywcCount(String chukuNum,String cangku) {
		String sql="select count(*) from kuguan_chukudan where chukuState = 2";
		
		if(chukuNum !=null && !chukuNum.equals("")){
			sql += " and chukudanCode like '%"+chukuNum+"%'";
		}
		
		if(cangku != null && !cangku.equals("")){
			sql += " and chukuCangku = '"+cangku+"'";
		}
		
		return getNum(sql);
	}
	
	@Override
	public String getTypeById(int chukudanId) {
		List<Object> params = new ArrayList<Object>();

		// 根据查询参数写出要执行sql语句
		String sql = "select * from kuguan_chukudan where chukudanId=? ";

		params.add(chukudanId);
		
		List<ChuKuDanPO> lists = this.queryForList(sql, params);
		
		int type = 0;
		for (ChuKuDanPO chuKuDanPO : lists) {
			type=chuKuDanPO.getChukuType();
		}
		if(type==1){
			return "采购退货出库";
		}else{
			return "调拨出库";
		}
		
	}

	@Override
	public ChuKuDanPO querybyId(int chukuID) {
		
		// 存放sql语句执行的参数
				List<Object> params = new ArrayList<Object>();

				// 根据查询参数写出要执行sql语句
				String sql = "select * from kuguan_chukudan where chukudanId = ? ";

				params.add(chukuID);

				return this.queryForList(sql, params).get(0);
	}
	
	@Override
	public List getCangku() {
		String sql = "select wareHouseName from kuguan_cangku";
		Connection con = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		List list=new ArrayList<>();
		try {
			con=JdbcUtil.getConnection();
			stat=con.prepareStatement(sql);
			rs=stat.executeQuery();
			while(rs.next()){
				list.add(rs.getString("wareHouseName"));
			}
		} catch (Exception e) {
		}finally {
			this.closeAll(con, stat, rs);
		}
		return list;
	}

	@Override
	public int getMaxId() {
		List<Object> params = new ArrayList<Object>();

		// 根据查询参数写出要执行sql语句
		String sql = "select * from kuguan_chukudan where 1=1 ";
		
		List<ChuKuDanPO> chukudans = this.queryForList(sql, params);

		return  chukudans.get(chukudans.size()-1).getChukudanId();
		
	}
}

	
