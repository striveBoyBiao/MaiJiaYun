package mjy.login.util;

import java.io.Serializable;

@SuppressWarnings("serial")  
public class Mail implements Serializable {  
  
    public static final String ENCODEING = "UTF-8";  
  
    private String host="smtp.163.com"; // �����ʼ�������,�������163��,�Լ����ҿ���ص�

    private String sender="13147199444@163.com"; // �����˵�����  
  
    private String receiver; // �ռ��˵�����  
  
    private String name; // �������ǳ�  
  
    private String username="13147199444@163.com"; // �˺�  
  
    private String password="OZtn1234"; // ����  
  
    private String subject; // ����  
  
    private String message; // ��Ϣ(֧��HTML)  
  
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