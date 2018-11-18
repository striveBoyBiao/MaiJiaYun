package mjy.login.util;

import java.util.Date;  
import java.util.Properties;  
import javax.mail.Authenticator;  
import javax.mail.Message;  
import javax.mail.MessagingException;  
import javax.mail.PasswordAuthentication;  
import javax.mail.Session;  
import javax.mail.Transport;  
import javax.mail.internet.AddressException;  
import javax.mail.internet.InternetAddress;  
import javax.mail.internet.MimeMessage;  
  
/** 
 * 类描述：发送邮件工具类 
 */  
public class SendEmailUtil {  
      
	public static final String HOST = "smtp.163.com";//设置邮箱服务器
    public static final String PROTOCOL = "smtp";   //设置协议
    public static final String FROM = "13147199444@163.com";//发件人的email
    public static final String PWD = "OZtn1234";//发件人密码
    public static final int PORT = 25;

    /**
     * 获取Session
     * @return
     */
    private static Session getSession() {
        Properties props = new Properties();
        props.put("mail.smtp.host", HOST);//设置服务器地址
        props.put("mail.store.protocol" , PROTOCOL);//设置协议
        props.put("mail.smtp.auth" , true);
        props.put("mail.smtp.port", PORT);//设置端口

        Authenticator authenticator = new Authenticator() {
            @Override
            //把用户名密码传到PasswordAuthentication这个类中去,实现验证
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM, PWD);
            }
        };
        Session session = Session.getDefaultInstance(props , authenticator);

        return session;
    }

    public static void send(String toEmail , String content) {
        Session session = getSession();
        try {
            System.out.println("--send--"+content);
            // 定义邮件信息，绑定session和邮件服务
            Message msg = new MimeMessage(session);

            //设置邮件属性
            msg.setFrom(new InternetAddress(FROM));
            InternetAddress address = new InternetAddress(toEmail);
            msg.setRecipient(Message.RecipientType.TO, address);
            msg.setSubject("卖家云邀请注册激活邮件");
            msg.setSentDate(new Date());
            msg.setContent(content , "text/html;charset=utf-8");
            //发送邮件
            Transport.send(msg);
        }
        catch (MessagingException mex) {
            mex.printStackTrace();
        }
    }
}