package mjy.login.util;

import org.apache.commons.mail.EmailException;  
import org.apache.commons.mail.HtmlEmail;

public class MailUtil {

    public boolean send(Mail mail) {  
        // ����email
        HtmlEmail email = new HtmlEmail();  
        try {
            // ������SMTP���ͷ����������֣�163�����£�"smtp.163.com"
            email.setHostName(mail.getHost());
            // �ַ����뼯������  
            email.setCharset(Mail.ENCODEING);
            // �ռ��˵�����  
            email.addTo(mail.getReceiver());
            // �����˵�����
            email.setFrom(mail.getSender(), mail.getName());
            // �����Ҫ��֤��Ϣ�Ļ���������֤���û���-���롣�ֱ�Ϊ���������ʼ��������ϵ�ע�����ƺ����� 
            email.setAuthentication(mail.getUsername(), mail.getPassword());  
            // Ҫ���͵��ʼ����� 
            email.setSubject(mail.getSubject());
            // Ҫ���͵���Ϣ������ʹ����HtmlEmail���������ʼ�������ʹ��HTML��ǩ  
            email.setMsg(mail.getMessage());
            // ���� 
            email.send();
            return true;
        } catch (EmailException e) {
            e.printStackTrace();
            return false;
        }
    }
}