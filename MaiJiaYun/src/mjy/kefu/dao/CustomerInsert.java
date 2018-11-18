package mjy.kefu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mjy.common.util.jdbc.BaseDao;
import mjy.common.util.jdbc.JdbcUtil;
import mjy.kefu.beans.CustomerBeanPO;

public class CustomerInsert extends BaseDao<Object> {
	private String newId;

	public String saveCustomer(CustomerBeanPO customer) {
		String sql = "insert into order_buyer (userId,buyerName,buyerTel,buyerPhone,buyerPostcode,buyerProvince,buyerCity,buyerDistrict,buyerLocation,buyerAddress) VALUES (?,?,?,?,?,?,?,?,?,?);";
		List<Object> arrays = new ArrayList<Object>();
		arrays.add(customer.getUserId());
		arrays.add(customer.getBuyerName());
		arrays.add(customer.getBuyerTel());
		arrays.add(customer.getBuyerPhone());
		arrays.add(customer.getBuyerPostCode());
		arrays.add(customer.getBuyerProvince());
		arrays.add(customer.getBuyerCity());
		arrays.add(customer.getBuyerDistrict());
		arrays.add(customer.getBuyerLocation());
		arrays.add(customer.getBuyerAddress());

		boolean result = SaveOrUpdate(sql, arrays);
		if(result==true&&newId!=null){
			return newId;
		}else{
			return "0";
		}
	}

	@Override
	public boolean SaveOrUpdate(String sql, List<Object> params) {
		Connection connection = null;
		PreparedStatement stat = null;
		try {
			connection = JdbcUtil.getConnection();

			stat = connection.prepareStatement(sql);
			int parameterIndex = 1;
			for (Object param : params) {
				stat.setObject(parameterIndex, param);
				parameterIndex++;
			}
			stat.executeUpdate();
			ResultSet rs = stat.getGeneratedKeys();
			if (rs.next()) {
				newId = rs.getLong(1)+"";
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if (connection.getAutoCommit()) {
					JdbcUtil.free(connection);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}

	@Override
	public List<Object> mapRow(ResultSet rs) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}
