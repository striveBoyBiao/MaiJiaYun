package mjy.kefu.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.common.util.jdbc.BaseDao;
import mjy.kefu.beans.CustomerBeanPO;
import mjy.kefu.beans.CustomerBeanVO;

public class CustomerQuery extends BaseDao<CustomerBeanPO> {

	public List<CustomerBeanPO> customerQuery(CustomerBeanVO customerBeanVO){
		String sql="select buyerId,buyerName,buyerTel ,buyerPostcode,buyerLocation,b.provincesCode,b.provincesName,c.cityCode,c.cityName,d.areaCode,d.areaName from order_buyer a join kefu_provinces b on a.buyerProvince=b.provincesCode join kefu_cities c on a.buyerCity=c.cityCode join kefu_areas d on a.buyerDistrict=d.areaCode where ";
		List<Object> params=new ArrayList<Object>();
		if(!customerBeanVO.getUserId().equals(null)){
			sql=sql+" a.userId=?";
			params.add(customerBeanVO.getUserId());
		}
		if(customerBeanVO.getName()!=null){
			sql=sql+" and ( a.buyerName like ? or a.buyerTel like ? )";
			params.add("%"+customerBeanVO.getName()+"%");
			params.add("%"+customerBeanVO.getName()+"%");
		}
		return queryForList(sql, params);
	}
	public List<CustomerBeanPO> yishouQuery(String buyerId){	
		String sql="select buyerId,buyerName,buyerTel ,buyerPostcode,buyerLocation,b.provincesCode,b.provincesName,c.cityCode,c.cityName,d.areaCode,d.areaName from order_buyer a join kefu_provinces b on a.buyerProvince=b.provincesCode join kefu_cities c on a.buyerCity=c.cityCode join kefu_areas d on a.buyerDistrict=d.areaCode where a.buyerId="+buyerId;
		List<Object> list = new ArrayList<>();
		return queryForList(sql, list);
	}

	@Override
	public List<CustomerBeanPO> mapRow(ResultSet rs) throws Exception {
		List<CustomerBeanPO> list = new ArrayList<CustomerBeanPO>();
		CustomerBeanPO customer = null;
		while (rs.next()) {
			customer = new CustomerBeanPO();
			customer.setBuyerId(rs.getString("buyerId"));
			customer.setBuyerName(rs.getString("buyerName"));
			customer.setBuyerTel(rs.getString("buyerTel"));
			customer.setBuyerPostCode(rs.getString("buyerPostcode"));
			customer.setProvincesCode(rs.getString("provincesCode"));
			customer.setBuyerProvince(rs.getString("provincesName"));
			customer.setCityCode(rs.getString("cityCode"));
			customer.setBuyerCity(rs.getString("cityName"));
			customer.setAreaCode(rs.getString("areaCode"));
			customer.setBuyerDistrict(rs.getString("areaName"));
			customer.setBuyerLocation(rs.getString("buyerLocation"));
			list.add(customer);
		}
		return list;
	}
}
