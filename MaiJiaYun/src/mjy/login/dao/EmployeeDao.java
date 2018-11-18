package mjy.login.dao;

import java.util.List;

import mjy.login.beans.po.EmployeePO;

public interface EmployeeDao {
	/**
	 *通过员工id获取员工PO对象 
	 * @param empID
	 * @return
	 */
	EmployeePO getEmploeeyByEmpID(Integer empID);
	
	
	
	/**
	 *通过老板id获取员工PO对象集合
	 * @param empID
	 * @return
	 */
	List<EmployeePO> getEmploeeyByBossID(Integer bossID);	
	
	
	/**
	 * 保存员工PO对象
	 * @param employeePO
	 * @return
	 */
	boolean  saveEmployeePO(EmployeePO employeePO);
}
