package mjy.login.beans.vo;

import java.io.Serializable;

/**
 * ��¼��Ϣ��װ
 * @author student
 *
 */
public class LoginInfoVO implements Serializable{
//�˺�
private String accountNo;
//����
 private String password;
//�˺�����
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
