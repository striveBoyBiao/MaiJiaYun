package mjy.login.service;

import java.util.List;

import mjy.login.beans.po.UserPO;
import mjy.login.beans.vo.UserInfoVO;

public interface RelationshipService {
	List<UserPO> getTs(UserPO userPo);
	List<UserPO> getTs(UserInfoVO userInfoVo);
	UserPO getBossUserPO(Integer userId);
}
