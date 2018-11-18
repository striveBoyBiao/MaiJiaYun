package mjy.login.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.login.beans.po.EmployeePO;
import mjy.login.dao.BaseDao;
import mjy.login.dao.EmployeeDao;

public class EmployeeDaoImpl  extends BaseDao<EmployeePO>   implements EmployeeDao {




	@Override
	public EmployeePO getEmploeeyByEmpID(Integer empID) {
		String 	sql = "select * from common_employee  where userID=? ";
		List<Object> params=new ArrayList<>();
		params.add(empID);
		return queryForSingle(sql, params);
	}

	@Override
	public List<EmployeePO> getEmploeeyByBossID(Integer bossUserID) {
		String 	sql = "select * from common_employee  where employeeBossUserID=? ";
		List<Object> params=new ArrayList<>();
		params.add(bossUserID);
		return queryForList(sql, params);
	}

	
	
	
	

	@Override
	public List<EmployeePO>  mapRow(ResultSet rs) throws Exception {
		List<EmployeePO> employees=new ArrayList<>();
		EmployeePO employeePO=null;
			while (rs.next()) {
				employeePO=new EmployeePO();
				employeePO.setUserId(rs.getInt(1));
				employeePO.setBossUserId(rs.getInt(2));
				employees.add(employeePO);
			}
		return employees;

		
		
		
		
		
	}

	@Override
	public boolean saveEmployeePO(EmployeePO employeePO) {
		String 	sql = "insert into common_employee values(?,?)";
		List<Object> params=new ArrayList<>();
		params.add(employeePO.getUserId());
		params.add(employeePO.getBossUserId());
		return SaveOrUpdate(sql, params);
	}
}
