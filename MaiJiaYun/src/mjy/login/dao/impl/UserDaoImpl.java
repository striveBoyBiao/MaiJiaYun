package mjy.login.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mjy.common.util.jdbc.JdbcUtil;
import mjy.login.beans.po.UserPO;
import mjy.login.beans.vo.ForgetInfoVO;
import mjy.login.beans.vo.LoginInfoVO;
import mjy.login.dao.BaseDao;
import mjy.login.dao.UserDao;

public class UserDaoImpl extends BaseDao<UserPO> implements UserDao{
	
	@Override
	public UserPO getUserInfo(LoginInfoVO loginInfo) {

		String sql = "";
		if (loginInfo.getAccType().equals("phone")) {
			sql = "select * from common_user  where userPhoneNo=? and userpassword=?";
		} else if (loginInfo.getAccType().equals("email")) {
			sql = "select * from common_user  where useremail=? and userpassword=?";
		}
		List<Object> params=new ArrayList<>();
		params.add(loginInfo.getAccountNo());
		params.add(loginInfo.getPassword());
		return queryForSingle(sql, params);
	}
	
	@Override
	public UserPO getUserPO(String email) {
		String sql = "select * from common_user  where userEmail=?";
		List<Object> params=new ArrayList<>();
		params.add(email);
		return queryForSingle(sql, params);
	}

	
	
	/**
	 * 修改用户信息
	 * @param user
	 * @return
	 */
	public boolean saveUser(UserPO user) {
		String sql = "update common_user set userPhoneNo=?,userPassword=?,userType=?,userNickname=?,userName=?,userEmail=?,userImgPath=?  where userId=?";
		List<Object> params=new ArrayList<>();
		params.add(user.getUserPhoneNumber());
		params.add(user.getUserPassword());
		params.add(user.getUserType());
		params.add(user.getUserNickname());
		params.add(user.getUserName());
		params.add(user.getUserEmail());
		params.add(user.getUserImgPath());
		params.add(user.getUserId());
		
		return SaveOrUpdate(sql, params);
	}
	
	

	public boolean checkAccNo(String accontNo, String accType) {
		boolean b = false;
		Connection conn = JdbcUtil.getConnection();
		String sql = "";
		if (accType.equals("phone")) {
			sql = "select * from common_user  where userphoneNo=? ";
		} else if (accType.equals("email")) {
			sql = "select * from common_user  where useremail=? ";		
		}else if(accType.equals("shop")){
			sql = "select * from common_boss  where bossCompanyName=? ";	
		}
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, accontNo);
			ResultSet result = preparedStatement.executeQuery();
				if (result.next())
					b = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.free(conn);
		}
		return b;
	}

	@Override
	public List<UserPO> mapRow(ResultSet result) throws Exception {
		List<UserPO> userInfos=new ArrayList<>();
		UserPO userInfoPO;
			while (result.next()) {
				userInfoPO = new UserPO();
				userInfoPO.setUserId(result.getInt(1));
				userInfoPO.setUserPhoneNumber(result.getString(2));
				userInfoPO.setUserPassword(result.getString(3));
				userInfoPO.setUserType(result.getString(4));
				userInfoPO.setUserNickname(result.getString(5));
				userInfoPO.setUserName(result.getString(6));
				userInfoPO.setUserEmail(result.getString(7));
				userInfoPO.setUserImgPath(result.getString(8));
				userInfos.add(userInfoPO);
				
			}
		return userInfos;
	}
	/**
	 * 邮箱存在检测
	 * @param email
	 * @return 存在的邮箱返回true
	 */
	public boolean emailExistCheck(String email){
		return checkAccNo(email, "email");
	}
	
	/**
	 * 手机号码存在检测
	 * @param phoneNo
	 * @return 存在的手机号返回true
	 */
	public boolean phoneNoExistCheck(String phoneNo){
		return checkAccNo(phoneNo, "phone");
	}
	//店铺名的存在
	@Override
	public boolean shopCheck(String shop) {
		return checkAccNo(shop, "shop");
	}  
	/**
	 * 注册用户
	 */
	@Override
	public boolean registerUser(UserPO user) {
		// TODO Auto-generated method stub
		String sql = "insert into common_user (userPhoneNo,userName,userNickName,userPassword,userType,userEmail) value(?,?,?,?,?,?)";
		List<Object> lists = new ArrayList<>();
		lists.add(user.getUserPhoneNumber());
		lists.add(user.getUserName());
		lists.add(user.getUserNickname());
		lists.add(user.getUserPassword());
		lists.add(user.getUserType());
		lists.add(user.getUserEmail());
		SaveOrUpdate(sql, lists);
		return true;
	}

	@Override
	public UserPO getUserInfo(Integer userId) {
		String sql = "select * from common_user  where userId=?";
		List<Object> params=new ArrayList<>();
		params.add(userId);
		return queryForSingle(sql, params);
	}

	@Override
	public boolean updateUser(ForgetInfoVO forgetInfo) {
		// TODO Auto-generated method stub
		String sql = "update common_user set userPassword=? where userEmail=?";
		List<Object> params=new ArrayList<>();
		params.add(forgetInfo.getPassword());
		params.add(forgetInfo.getEmail());
		return SaveOrUpdate(sql, params);
	}


	
}
