package mjy.login.service.Impl;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;

import mjy.login.beans.po.EmployeePO;
import mjy.login.beans.po.InvitedUserPO;
import mjy.login.beans.po.RepPO;
import mjy.login.beans.po.UserPO;
import mjy.login.dao.EmployeeDao;
import mjy.login.dao.RepDao;
import mjy.login.dao.UserDao;
import mjy.login.dao.impl.EmployeeDaoImpl;
import mjy.login.dao.impl.InvitedUserDaoImpl;
import mjy.login.dao.impl.RepDaoImpl;
import mjy.login.dao.impl.UserDaoImpl;
import mjy.login.util.MD5Util;
import mjy.login.util.SendEmailUtil;
import mjy.login.util.ServiceException;

public class RegisterActivaService {
	
	private InvitedUserDaoImpl userDaoImpl = new InvitedUserDaoImpl();
	/**
	 * 处理激活请求
	 * @param userBy
	 * @param name
	 * @param email
	 * @param phone
	 */
	public void processInvitation(int userBy,String name,String email,String phone,String post) {
		//获取被邀请人信息
		InvitedUserPO invitedUserPo = new InvitedUserPO();
		invitedUserPo.setInvitedUserBy(userBy);
		invitedUserPo.setInvitedUserName(name);
		invitedUserPo.setInvitedUserEmail(email);
		invitedUserPo.setInvitedUserPhone(phone);
		invitedUserPo.setInvitedUserPost(post);
		System.out.println("职位"+post);
		Date time= new java.sql.Date(new java.util.Date().getTime());//把当前时间转换成可插入数据库的date
		invitedUserPo.setInvitedUserRegisterTime(time);//邀请时间
		invitedUserPo.setInvitedUserActivationState(0);//激活状态设置为0(未激活);
		invitedUserPo.setInvitedUserActivationCode(MD5Util.encode2hex(email));//通过邮箱生成对应的激活码
		
		userDaoImpl.save(invitedUserPo);//保存被邀请用户的注册信息
		//邮件内容
		StringBuffer sb=new StringBuffer("恭喜您成功接收到卖家云注册邀请，点击下面激活码到邀请加入页面激活账号，48小时有效，否则重新注册账号，链接只能使用一次，请尽快激活！</br>");
        sb.append("卖家云邀请激活码:<a href='http://localhost:8088/MaiJiaYun/Login/html/invitation.html' target='_blank'>"); 
        sb.append(invitedUserPo.getInvitedUserActivationCode());
        sb.append("</a>");
	        
	       //发送邮件
//	      Email mail = new Email("smtp.163.com");
//	        mail.setNeedAuth(true);
//	        mail.setSubject("卖家云邀请注册激活");
//	        mail.setBody(sb.toString());
//	        mail.setTo(email);
//	        mail.setFrom("13147199444@163.com");
//	        mail.setNamePass("13147199444@163.com","OZtn1234");
//	        mail.sendout();
//	        System.out.println("邮件完毕");
	     SendEmailUtil.send(email, sb.toString());
	        
	}
	/**
	 * 处理注册激活
	 * @param ActivationCode：激活码
	 * @return 
	 * @throws ParseException 
	 * 
	 */
	//传送激活码
	public boolean processActivate(String ActivationCode ) throws ParseException,ServiceException {
		//数据访问       通过激活码获取用户数据
		InvitedUserPO user = userDaoImpl.find(ActivationCode);
		boolean result = false;
		if(user!=null) {//验证用户是否存在
			//验证激活状态
			if(user.getInvitedUserActivationState()==0)  {
				//没激活
				Date currentTime = new Date();  //获取当前时间
				//验证链接是否过期
				currentTime.before(user.getLastActivateTime());//与有效期时间对比
				if(currentTime.before(user.getLastActivateTime())) {//当前时间在注册有效期之前即还没过�?
					//再验证激活码是否正确
					if(ActivationCode.equals(user.getInvitedUserActivationCode())) {
						//激活成功
						System.out.println("==设置前==="+user.getInvitedUserActivationState());
						user.setInvitedUserActivationState(1);//设置用户激活状态为1
						System.out.println("==设置后==="+user.getInvitedUserActivationState());
						//更改用户信息
						userDaoImpl.update(user);
						
						result = true;
					}else {
						throw new ServiceException("激活码不正确");
					}
						
					}else{
						throw new ServiceException("激活码已经过期");
				}
			}else {
				throw new ServiceException("邮箱已经激活，请登录");
			}
		}else {
			throw new ServiceException("邮箱未注册(或邮箱地址不存在)");
		}
		return result;
	}
	/**
	 * 通过邀请码获取被邀请人信息
	 * @param activationCode
	 * @return
	 */
	public InvitedUserPO getInvitedUserPO(String activationCode){

			return userDaoImpl.find(activationCode);

	}
	
	
	public void registerInvitedUser(String activationCode,String password){
		InvitedUserPO invitedUserPO=getInvitedUserPO(activationCode);
		EmployeeDao employeeDao=new EmployeeDaoImpl();
		UserDao userDao =new UserDaoImpl();
		RepDao repDao=new RepDaoImpl();
		
		//封装UserPO对象
		UserPO user=new UserPO();
		user.setUserType("emp");
		user.setUserName(invitedUserPO.getInvitedUserName());
		user.setUserNickname(invitedUserPO.getInvitedUserName());
		user.setUserPassword(password);
		user.setUserEmail(invitedUserPO.getInvitedUserEmail());
		user.setUserPhoneNumber(invitedUserPO.getInvitedUserPhone());
		//保存UserPO到数据库
		userDao.registerUser(user);
		
		
		//保存员工信息
		EmployeePO employeePO=new EmployeePO();
		employeePO.setBossUserId(invitedUserPO.getInvitedUserBy());
		//取出员工ID
		Integer empId=userDao.getUserPO(invitedUserPO.getInvitedUserEmail()).getUserId();
		employeePO.setUserId(empId);;
		employeeDao.saveEmployeePO(employeePO);
		
		//保存岗位信息
		String post=invitedUserPO.getInvitedUserPost();
		String[] posts =post.split(",");
		Integer postId;
		RepPO repPO;
		ArrayList<RepPO> list=new ArrayList<>();
		for (String string : posts) {
			repPO=new RepPO();
			 postId=Integer.parseInt(string);
			 repPO.setEmpId(empId);
			 repPO.setPostId(postId);
			 list.add(repPO);
		}
		repDao.saveRep(list);
		
	}
	
	
	
	
}
