package mjy.login.util;

import java.io.Serializable;

@SuppressWarnings("serial")  
public class Mail implements Serializable {  
  
    public static final String ENCODEING = "UTF-8";  
  
    private String host="smtp.163.com"; // 设置邮件服务器,如果不用163的,自己找找看相关的

    private String sender="13147199444@163.com"; // 发件人的邮箱  
  
    private String receiver; // 收件人的邮箱  
  
    private String name; // 发件人昵称  
  
    private String username="13147199444@163.com"; // 账号  
  
    private String password="OZtn1234"; // 密码  
  
    private String subject; // 主题  
  
    private String message; // 信息(支持HTML)  
  
    public String getHost() {  
        return host;  
    }  

    public String getSender() {  
        return sender;  
    }  
   
  
    public String getReceiver() {  
        return receiver;  
    }  
  
    public void setReceiver(String receiver) {  
        this.receiver = receiver;  
    }  
  
    public String getName() {  
        return name;  
    }  
  
    public void setName(String name) {  
        this.name = name;  
    }  
  
    public String getUsername() {  
        return username;  
    }  
   
  
    public String getPassword() {  
        return password;  
    }  
   
  
    public String getSubject() {  
        return subject;  
    }  
  
    public void setSubject(String subject) {  
        this.subject = subject;  
    }

    public String getMessage() {  
        return message;  
    }  
    
    
    public void setMessage(String message) {  
        this.message = message;  
    }  
  
}  