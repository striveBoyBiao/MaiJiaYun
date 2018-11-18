package mjy.login.util;

import java.util.Properties;
/**JavaMail并不是绝对支持每一个协议，目前支持IMAP、 SMTP和 POP3。
 * 常用邮箱服务器设置
 * 邮箱收发服务器(pop3\stmp)设置 
 * 	163邮箱 (可用)
	POP3服务器:pop.163.com 
	SMTP服务器:smtp.163.com 
   
    sohu邮箱 (可用有延迟)
	POP3服务器：pop3.sohu.com 
	SMTP服务器：smtp.sohu.com
	
    QQ邮箱 //(经过测试qq邮箱用这个程序无法发邮件)
	POP3服务器：pop.qq.com 
	SMTP服务器：smtp.qq.com 
	SMTP服务器需要身份验证。
	
	smtp-mail.outlook.com
 */

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class Email {
	private MimeMessage mimeMsg;  // 整个MIME邮件对象 
    private Session session;  //专门用来发送邮件的Session会话  
    private Properties props;  //封装邮件发送时的一些配置信息的一个属性对象 
    private String username;  //发件人的用户名 (发件人邮箱地址)  
    private String password;  //发件人的密码 (发件人邮箱密码)
    private Multipart mp;  //用来实现附件添加的组件
    /** 
     * 发送参数初始化,有的服务器不需要用户验证，所以这里对用户名和密码进行初始化"" 
     *  
     * @param smtp 
     * SMTP服务器的地址，比如要用QQ邮箱，哪么应为："smtp.qq.com"，163为："smtp.163.com" 
     */ 
    public Email(String smtp) {  
        username = "";  
        password = "";  
        // 设置邮件服务器  
        setSmtpHost(smtp);  
        // 创建邮件  
        createMimeMessage();  
    }  
    /** 
     * 设置发送邮件的主机(JavaMail需要Properties来创建一个session对象。 
     * 它将寻找字符串"mail.smtp.host"，属性值就是发送邮件的主机); 
     *  
     * @param hostName 
     */  
    public void setSmtpHost(String hostName) {  
    	//System.out.println("设置系统属性：mail.smtp.host = " + hostName);  
        if (props == null)  
            props = System.getProperties();  
        props.put("mail.smtp.host", hostName);  
    }  
    /** 
     * (这个Session类代表JavaMail 中的一个邮件session. 每一个基于 
     * JavaMail的应用程序至少有一个session但是可以有任意多的session。 在这个例子中, 
     * Session对象需要知道用来处理邮件的SMTP 服务器。 
     */  
    public boolean createMimeMessage() {  
        try {  
            //System.out.println("准备获取邮件会话对象！"); 
        	
            //用props对象来创建并初始化session对象   
            session = Session.getDefaultInstance(props, null);  
        }  
        catch (Exception e)  {  
        	//System.err.println("获取邮件会话对象时发生错误！" + e); 
            return false;  
        }  
        //System.out.println("准备创建MIME邮件对象！");  
        try {  
            //用session对象来创建并初始化邮件对象 
            mimeMsg = new MimeMessage(session);  
            // 生成附件组件的实例 
            mp = new MimeMultipart();  
        } catch (Exception e) {  
        	System.err.println("创建MIME邮件对象失败！" + e);  
            return false;  
        }  
        return true;  
    }  
    /** 
     * 设置SMTP的身份认证  
     */  
    public void setNeedAuth(boolean need){  
    	 //System.out.println("设置smtp身份认证：mail.smtp.auth = " + need);  
        if (props == null)  
        {  
            props = System.getProperties();  
        }  
        if (need)  
            props.put("mail.smtp.auth", "true");  
        else  
            props.put("mail.smtp.auth", "false");  
    }  
    /** 
     * 进行用户身份验证时，设置用户名和密码 
     */ 
    public void setNamePass(String name, String pass) {  
    	//System.out.println("程序得到用户名与密码");   
        username = name;  
        password = pass;  
    }  
    /** 
     * 设置邮件主题 
     *  
     * @param mailSubject 
     * @return 
     */ 
    public boolean setSubject(String mailSubject){  
    	//System.out.println("设置邮件主题！");  
        try {  
            mimeMsg.setSubject(mailSubject);  
        } catch (Exception e) {  
        	System.err.println("设置邮件主题发生错误！");  
            return false;  
        }  
        return true;  
    }  
    /** 
     * 设置邮件内容,并设置其为文本格式或HTML文件格式，编码方式为UTF-8 
     *  
     * @param mailBody 
     * @return 
     */   
    public boolean setBody(String mailBody) {  
        try {  
        	//System.out.println("设置邮件体格式");  
            BodyPart bp = new MimeBodyPart();  
            bp.setContent("<meta http-equiv=Content-Type content=text/html; charset=UTF-8>" + mailBody,  
                            "text/html;charset=UTF-8");  
            // 在组件上添加邮件文本  
            mp.addBodyPart(bp);  
        } catch (Exception e) {  
        	System.err.println("设置邮件正文时发生错误！" + e);  
            return false;  
        }  
        return true;  
    }  
    /** 
     * 增加发送附件 
     *  
     * @param filename 
     *            邮件附件的地址，只能是本机地址而不能是网络地址，否则抛出异常  
     * @return 
     */  
    public boolean addFileAffix(String filename) {  
    	//System.out.println("增加邮件附件：" + filename);  
        try {  
            BodyPart bp = new MimeBodyPart();  
            FileDataSource fileds = new FileDataSource(filename);  
            bp.setDataHandler(new DataHandler(fileds));  
            // 发送的附件前加上一个用户名的前缀  
            bp.setFileName(fileds.getName());  
            // 添加附件   
            mp.addBodyPart(bp);  
        } catch (Exception e) {  
        	System.err.println("增加邮件附件：" + filename + "发生错误！" + e);  
            return false;  
        }  
        return true;  
    }  
    /** 
     * 设置发件人地址 
     *  
     * @param from 
     *            发件人地址 
     * @return 
     */  
    public boolean setFrom(String from) {  
    	//System.out.println("设置发信人！"); 
        try {  
            mimeMsg.setFrom(new InternetAddress(from));  
        } catch (Exception e) {  
            return false;  
        }  
        return true;  
    }  
    /** 
     * 设置收件人地址 
     *  
     * @param to 
     *            收件人的地址 
     * @return 
     */ 
    public boolean setTo(String to) {  
    	 //System.out.println("设置收信人");  
        if (to == null)  
            return false;  
        try {  
            mimeMsg.setRecipients(javax.mail.Message.RecipientType.TO, InternetAddress.parse(to));
            //给一个给定的address设置一个确切的容器类型
        } catch (Exception e) {  
            return false;  
        }  
        return true;  
    }  
    /** 
     * 发送附件 
     *  
     * @param copyto 
     * @return 
     */ 
    public boolean setCopyTo(String copyto) {  
    	//System.out.println("发送附件到");  
        if (copyto == null)  
            return false;  
        try {  
            mimeMsg.setRecipients(javax.mail.Message.RecipientType.CC, InternetAddress.parse(copyto));  
        } catch (Exception e) {  
            return false;  
        }  
        return true;  
    }  
    /** 
     * 发送邮件 
     *  
     * @return 
     */  
    public boolean sendout() {  
        try {  
            mimeMsg.setContent(mp);  
            mimeMsg.saveChanges();  
            //System.out.println("正在发送邮件....");  
            Session mailSession = Session.getInstance(props, null);  
            Transport transport = mailSession.getTransport("smtp");  
            // 真正的连接邮件服务器并进行身份验证    
            transport.connect((String) props.get("mail.smtp.host"), username, password);  
            // 发送邮件   
            transport.sendMessage(mimeMsg, mimeMsg.getRecipients(javax.mail.Message.RecipientType.TO));  
            System.out.println("发送邮件成功！"); 
            transport.close();  
        } catch (Exception e) {  
        	System.err.println("邮件发送失败！" + e.getMessage());  
            e.printStackTrace();  
            return false;  
        }  
        return true;  
    }  
//  public static void main(String[] args) {  
//      /** 
//       * 
//       *************切切注意******** 
//       * 
//       *注意  用此程序发邮件必须邮箱支持smtp服务  在2006年以后申请的163邮箱是不支持的 
//       *我知道sina邮箱  sohu邮箱 qq邮箱支持  但是sina和qq邮箱需要手工设置开启此功能   
//       *所以在测试时最好使用这三个邮箱    
//       *sina邮箱的smtp设置方法如下 
//       *登录sina邮箱 依次点击 邮箱设置--->帐户--->POP/SMTP设置 将开启复选框选中 然后保存 
//       * 
//       */  
//      Email themail = new Email("smtp.163.com");//这里以新浪邮箱为例子  
//  	//Email themail = new Email("smtp.qq.com");//qq邮箱测试
//  	//Email themail = new Email("imap-mail.outlook.com");
//      //Email themail = new Email("smtp.sohu.com");
//      String mailbody = "<a href='http://maijiayun.cn/login.html/' target='_blank'>卖家云,</a>恭喜您成功注册卖家云了哦";//邮件正文  
//      themail.setNeedAuth(true);  
//      themail.setSubject("卖家云邮箱验证");//邮件主题  
//      themail.setBody(mailbody);//设置邮件正文  
//      themail.setTo("1452930742@qq.com");//收件人地址  
//      themail.setFrom("13147199444@163.com");//发件人地址  
//      //themail.setFrom("1513232926@qq.com");//发件人地址 
//     // themail.addFileAffix("2092_s.jpg");// 附件文件路径,例如：C:/222.jpg,*注；"/"的写法； 如果没有可以不写  
//      themail.setNamePass("13147199444@163.com","OZtn1234");//发件人地址和密码 **改为相应邮箱密码  
//      //密码错误会出现:javax.mail.AuthenticationFailedException: 535 5.7.0 Invalid login user or password
//      //邮箱不支持会出现530错误号码
//      themail.sendout();  
//  }
}
