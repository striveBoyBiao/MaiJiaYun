package mjy.login.beans.vo;

import java.io.Serializable;

/**
 * 登录信息封装
 * @author student
 *
 */
public class LoginInfoVO implements Serializable{
//账号
private String accountNo;
//密码
 private String password;
//账号类型
 private String accType;
 
 
 
 
public String getAccountNo() {
	return accountNo;
}
public void setAccountNo(String accountNo) {
	this.accountNo = accountNo;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getAccType() {
	return accType;
}
public void setAccType(String accType) {
	this.accType = accType;
}

}
