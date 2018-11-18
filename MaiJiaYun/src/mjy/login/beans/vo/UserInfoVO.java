package mjy.login.beans.vo;

import java.io.Serializable;
import java.util.List;

import mjy.login.beans.po.BossPO;
import mjy.login.beans.po.UserPO;

public class UserInfoVO implements Serializable{
	//�û����� �� Ա�������ϰ壩
	private String userType;
	
	//�û�������Ϣ
	private	UserPO userPO;
	
	//�ϰ���Ϣ
	private BossPO bossPO;
	 
	//��λ��Ϣ����
	private List<PostVO> postVOs;
	
	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public UserPO getUserPO() {
		return userPO;
	}

	public void setUserPO(UserPO userInfo) {
		this.userPO = userInfo;
	}

	public BossPO getBossPO() {
		return bossPO;
	}

	public void setBossPO(BossPO bossPO) {
		this.bossPO = bossPO;
	}

	public List<PostVO> getPostVOs() {
		return postVOs;
	}

	public void setPostVOs(List<PostVO> postVOs) {
		this.postVOs = postVOs;
	}

	@Override
	public String toString() {
		return "UserInfoVO [userType=" + userType + ", userPO=" + userPO + ", bossPO=" + bossPO + ", postVOs=" + postVOs
				+ "]";
	}



	
}
