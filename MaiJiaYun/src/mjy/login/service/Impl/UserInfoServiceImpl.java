package mjy.login.service.Impl;

import java.util.List;

import mjy.login.beans.po.BossPO;
import mjy.login.beans.po.EmployeePO;
import mjy.login.beans.po.PostPO;
import mjy.login.beans.po.UserPO;
import mjy.login.beans.vo.LoginInfoVO;
import mjy.login.beans.vo.UserInfoVO;
import mjy.login.dao.BossDao;
import mjy.login.dao.EmployeeDao;
import mjy.login.dao.PostDao;
import mjy.login.dao.UserDao;
import mjy.login.dao.impl.BossDaoImpl;
import mjy.login.dao.impl.EmployeeDaoImpl;
import mjy.login.dao.impl.PostDaoImpl;
import mjy.login.dao.impl.UserDaoImpl;
import mjy.login.service.UserInfoService;
import mjy.login.util.InitUser;

/**
 * �û���Ϣservice
 * 
 * @author student
 *
 */
public class UserInfoServiceImpl implements UserInfoService {
	UserDao userDao = new UserDaoImpl();
	EmployeeDao empDao=new EmployeeDaoImpl();
	BossDao bossDao = new BossDaoImpl();
	PostDao postDao = new PostDaoImpl();
	
	@Override
	public boolean registerUser(UserInfoVO userInfo) {
		// TODO Auto-generated method stub
		
		try {
			InitUser initUser=new InitUser();
			userDao.registerUser(userInfo.getUserPO());
			BossPO b = userInfo.getBossPO();
			b.setUserID(userDao.getUserPO(userInfo.getUserPO().getUserEmail()).getUserId());
			System.out.println("userid:"+b.getUserID());
			bossDao.registerBossPO(b);
			initUser.initExtLimit(b.getUserID());
			initUser.initCode(b.getUserID());
			return true;
		} catch (Exception e) { 
			
			
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	public String getErrorMessage(LoginInfoVO loginInfo){
		String message="";
		if(userDao.checkAccNo(loginInfo.getAccountNo(), loginInfo.getAccType())){
			message="密码错误";
		}else{
			message="用户名不存在";
			
		}
		return message;
	}
	
	@Override
	public UserInfoVO getUserInfoVO(LoginInfoVO loginInfo) {
		UserInfoVO userInfoVO = new UserInfoVO();
		UserPO userPO = userDao.getUserInfo(loginInfo);

		if (userPO == null) {
			return null;
		} else {

			String userType = userPO.getUserType();
			userInfoVO.setUserType(userType);
			userInfoVO.setUserPO(userPO);
			
			BossPO boss;
			if (userType.equals("boss")) {//�����û����ϰ壬
				boss= bossDao.getBossPO(userPO.getUserId());
			} else {//�����û���Ա����

				
				
				EmployeePO emp = empDao.getEmploeeyByEmpID(userPO.getUserId());
				boss = bossDao.getBossPO(emp.getBossUserId());
			}
			userInfoVO.setBossPO(boss);
			return userInfoVO;
		}
	}

	@Override
	public boolean saveUserPO(UserPO userPO) {
		return	userDao.saveUser(userPO);

	}

	@Override
	public List<PostPO> getEmplPost(Integer userid) {
		// TODO Auto-generated method stub
		List<PostPO> posts = postDao.getPosts(userid);
		return posts;
	}
	public static void main(String[] args) {
		//System.out.println(new UserInfoServiceImpl().getEmplPost(10002));
	}
	@Override
	public boolean savePost(List<PostPO> posts,Integer userid) {
		// TODO Auto-generated method stub
		return false;
	}

}
