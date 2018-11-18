package mjy.login.service.Impl;

import java.util.ArrayList;
import java.util.List;

import mjy.login.beans.po.EmployeePO;
import mjy.login.beans.po.UserPO;
import mjy.login.beans.vo.UserInfoVO;
import mjy.login.dao.EmployeeDao;
import mjy.login.dao.UserDao;
import mjy.login.dao.impl.EmployeeDaoImpl;
import mjy.login.dao.impl.UserDaoImpl;
import mjy.login.service.RelationshipService;

public class RelationshipServiceImpl implements RelationshipService{

	EmployeeDao employeeDao = new EmployeeDaoImpl();
	UserDao userDao = new UserDaoImpl();
	@Override
	public List<UserPO> getTs(UserPO userPo) {
		// TODO Auto-generated method stub
		List<UserPO> us = new ArrayList<>();
		int bossid ;
		if(userPo.getUserType().equals("boss")){
			bossid=userPo.getUserId();
		}else{
			EmployeePO e = employeeDao.getEmploeeyByEmpID(userPo.getUserId());
			bossid=e.getBossUserId();
			us.add(userDao.getUserInfo(bossid));
		}
		List<EmployeePO> es = employeeDao.getEmploeeyByBossID(bossid);
		for (EmployeePO ep : es) {
			us.add(userDao.getUserInfo(ep.getUserId()));
		}
		if(us.size()==0){
			return null;
		}
		return us;
	}
	@Override
	public List<UserPO> getTs(UserInfoVO userInfoVo) {
		return this.getTs(userInfoVo.getUserPO());
	}
	@Override
	public UserPO getBossUserPO(Integer userId) {
		return new UserDaoImpl().getUserInfo(userId);
	}
	
}
