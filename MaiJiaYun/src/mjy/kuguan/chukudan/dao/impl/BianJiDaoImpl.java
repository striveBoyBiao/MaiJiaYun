package mjy.kuguan.chukudan.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mjy.kuguan.chukudan.dao.IBianJiDao;
import mjy.kuguan.chukudan.po.BianJiPO;






public class BianJiDaoImpl extends BaseDao<BianJiPO> implements IBianJiDao{

	
	public void insert(BianJiPO bianji) {
		String sql = "insert into kuguan_chukuedit(chukudanId,"
				+ "bjskuCode,bjgoodName,bjgoodProperty,bjxuchukuNum,"
				+ "bjyichukuNum,bjbencichukuNum,bjbeizhu,bjchukuBeizhu,bjcangku)"
				+ " value(?,?,?,?,?,?,?,?,?,?)";

		List<Object> params = new ArrayList<Object>();
		
		params.add(bianji.getChukudanId());
		params.add(bianji.getBjskuCode());
		params.add(bianji.getBjgoodName());
		params.add(bianji.getBjgoodProperty());
		params.add(bianji.getBjxuchukuNum());
		params.add(bianji.getBjyichukuNum());
		params.add(bianji.getBjbencichukuNum());
		params.add(bianji.getBjbeizhu());
		params.add(bianji.getBjchukuBeizhu());
		params.add(bianji.getBjcangku());
	
		this.SaveOrUpdate(sql, params);
	}

	public void update(BianJiPO bianji) {
	//	"update kuguan_chukudan set chukuState=? where chukudanId=?"
		String sql = "update kuguan_chukuedit set bjbencichukuNum=?,bjbeizhu=?,bjyichukuNum=? "
				+ "where chukudanId=?";
				

		List<Object> params = new ArrayList<Object>();
		params.add(bianji.getBjbencichukuNum());
		params.add(bianji.getBjbeizhu());
		params.add(bianji.getBjyichukuNum());
		params.add(bianji.getChukudanId());

		this.SaveOrUpdate(sql, params);
	}

	public void deleteByID(int chukudanId) {
		String sql = "delete from kuguan_chukuedit where chukudanId=?";

		List<Object> params = new ArrayList<Object>();
		params.add(chukudanId);

		this.SaveOrUpdate(sql, params);
	}

	/**
	 * 查询
	 * 
	 * @param 
	 * @return
	 */
	@Override
	public List<BianJiPO> listBy(int chukudanId) {
		// 存放sql语句执行的参数
		List<Object> params = new ArrayList<Object>();

		// 根据查询参数写出要执行sql语句
		String sql = "select * from kuguan_chukuedit where chukudanId = ? ";
		params.add(chukudanId);

		return this.queryForList(sql, params);
	}

	/**
	 * RS->ChuKuDan
	 * 
	 * @throws SQLException
	 */
	@Override
	public List<BianJiPO> mapRow(ResultSet rs) throws Exception {
		List<BianJiPO> bianjis = new ArrayList<BianJiPO>();
		BianJiPO bianji = null;

		while (rs.next()) {
			bianji = new BianJiPO();
			bianji.setBjId(rs.getInt("bjId"));
			bianji.setChukudanId(rs.getInt("chukudanId"));
			bianji.setBjskuCode(rs.getString("bjskuCode"));
			bianji.setBjgoodName(rs.getString("bjgoodName"));
			bianji.setBjgoodProperty(rs.getString("bjgoodProperty"));
			bianji.setBjxuchukuNum(rs.getInt("bjxuchukuNum"));;
			bianji.setBjyichukuNum(rs.getInt("bjyichukuNum")); 
			bianji.setBjbencichukuNum(rs.getInt("bjbencichukuNum"));
			bianji.setBjbeizhu(rs.getString("bjbeizhu"));
			bianji.setBjchukuBeizhu(rs.getString("bjchukuBeizhu"));
			bianji.setBjcangku(rs.getString("bjcangku"));

			bianjis.add(bianji);
		}

		return bianjis;
	}


	







}
