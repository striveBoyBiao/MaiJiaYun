package mjy.login.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EmailCheck{
	public static void sendEmail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json;charset=utf-8");
		String email=req.getParameter("email");
		int num = (int)(Math.random()*10000);
		String m="";
		if(num>999){
			m=num+"";
		}else if(num>99){
			m="0"+num;
		}else if(num>9){
			m="00"+num;
		}else{
			m="000"+num;
		}
		HttpSession s = req.getSession();
		s.setMaxInactiveInterval(60);
		s.setAttribute("emailnum", m);
		Mail mail = new Mail();
		mail.setReceiver(email.trim());
		mail.setSubject("卖家云");
		mail.setMessage("您的验证码是"+m+"   温馨提示：请妥善保管");
		PrintWriter out=resp.getWriter();
		String str="";
		if(new MailUtil().send(mail)){
			str="发送成功！";
		}else{
			str="请检查邮箱";
		}
		out.println("{\"retu\":\""+str+"\"}");
	}
}
