package mjy.login.dao.impl;

import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import mjy.login.beans.po.InvitedUserPO;
import mjy.login.dao.BaseDao;
import mjy.login.dao.InvitedUserDao;
public class InvitedUserDaoImpl extends BaseDao<InvitedUserPO> implements InvitedUserDao {
	
	/**
	 * @param InvitedUserPO
	 * 保存被邀请人信息
	 */
	@Override
	public boolean save(InvitedUserPO user) {
		String sql = "insert into common_inviteduser(invitedUserBy,invitedUserName,invitedUserPhone,invitedUserEmail,"
				+"invitedUserPost,invitedUserActivatedState,invitedUserActivationCode,invitedUserRegisterTime)value(?,?,?,?,?,?,?,?)";
		List<Object> params = new ArrayList<>();
		params.add(user.getInvitedUserBy());
		params.add(user.getInvitedUserName());
		params.add(user.getInvitedUserPhone());
		params.add(user.getInvitedUserEmail());
		params.add(user.getInvitedUserPost());
		params.add(user.getInvitedUserActivationState());
		params.add(user.getInvitedUserActivationCode());
		params.add(user.getInvitedUserRegisterTime());
		SaveOrUpdate(sql, params);
		return true;
	}
	/**@param InvitedUserPO
	 * 更新用户信息
	 */
	@Override
	public boolean update(InvitedUserPO user) {
		String sql = "update common_inviteduser set invitedUserBy=?,invitedUserEmail=?,invitedUserActivationState=?,"
				+ "invitedUserActivationCode=?,invitedUserRegisterTime=?";
		List<Object> params=new ArrayList<>();
		params.add(user.getInvitedUserBy());
		params.add(user.getInvitedUserEmail());
		params.add(user.getInvitedUserActivationState());
		params.add(user.getInvitedUserActivationCode());
		params.add(user.getInvitedUserRegisterTime());
		return SaveOrUpdate(sql, params);
	}

	@Override
	public InvitedUserPO find(String activationCode) {
		//获取被邀请人的信息

		String sql="select * from common_inviteduser  where invitedUserActivationCode=?";
		List<Object> params=new ArrayList<>();
		params.add(activationCode);
		return queryForSingle(sql, params);
	}

	public static void main(String[] args) {
	System.out.println(new InvitedUserDaoImpl().find("7ae12aa0a3077ff435fb4283b4081c14"));	
	}
	@Override
	public List<InvitedUserPO> mapRow(ResultSet result) throws Exception {
		List<InvitedUserPO> userInfos=new ArrayList<>();
		InvitedUserPO userInfoPO =null;
			while (result.next()) {
				userInfoPO= new InvitedUserPO();
				userInfoPO.setInvitedUserId(result.getInt(1));
				userInfoPO.setInvitedUserBy(result.getInt(2));
				userInfoPO.setInvitedUserName(result.getString(3));
				userInfoPO.setInvitedUserPhone(result.getString(4));
				userInfoPO.setInvitedUserEmail(result.getString(5));
				userInfoPO.setInvitedUserPost(result.getString(6));
				userInfoPO.setInvitedUserActivationState(result.getInt(7));
				userInfoPO.setInvitedUserActivationCode(result.getString(8));
				userInfoPO.setInvitedUserRegisterTime(result.getDate(9));
				userInfos.add(userInfoPO);
				
			}
		return userInfos;
	}

}
