package mjy.login.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mjy.common.servlet.BaseServlet;
import mjy.login.beans.po.BossPO;
import mjy.login.beans.po.UserPO;
import mjy.login.beans.vo.UserInfoVO;
import mjy.login.dao.impl.UserDaoImpl;
import mjy.login.service.Impl.UserInfoServiceImpl;
import mjy.login.util.EmailCheck;

@WebServlet("/registerServlet")
public class registerServlet extends BaseServlet {
	
	//发送邮件
	public void emailSend(HttpServletRequest req, HttpServletResponse resp){
		try {
			EmailCheck.sendEmail(req, resp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//注册
	public void register(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json;charset=utf-8");
		String phone=req.getParameter("phone");
		String gongsi=req.getParameter("gongsi");
		String psd=req.getParameter("psd");
		int bosstype=Integer.parseInt(req.getParameter("bosstype"));
		String emailnum=req.getParameter("emailnum");
		String email=req.getParameter("email");
		PrintWriter out=resp.getWriter();
		UserDaoImpl u = new UserDaoImpl();
		if(phone!=null){
			String str="";
			if(u.phoneNoExistCheck(phone.trim())){
				str=phone+"存在!";
			}else if(u.shopCheck(gongsi)){
				str=gongsi+"存在!";
			}
			else if(u.emailExistCheck(email)){
				str=email+"存在!";
			}
			else if(!emailnum.trim().equals(req.getSession().getAttribute("emailnum"))){
				str="邮箱或验证码错误!";
			}
			else{
				UserInfoVO uif = new UserInfoVO();
				BossPO bp = new BossPO();
				bp.setBossCompanyName(gongsi);
				bp.setBossType(bosstype);
				UserPO up = new UserPO();
				up.setUserPassword(psd);
				up.setUserPhoneNumber(phone);
				up.setUserEmail(email);
				up.setUserNickname("管理员");
				up.setUserType("boss");
				uif.setUserType("boss");
				uif.setBossPO(bp);
				uif.setUserPO(up);
				if(new UserInfoServiceImpl().registerUser(uif)){
					str="欢迎光临!";
					HttpSession s = req.getSession();
					s.setMaxInactiveInterval(36000);
					s.setAttribute("userInfoVO", uif);
				}else{
					str="注册失败！";
				}
			}
			out.println("{\"retu\":\""+str+"\"}");
		}
	}
}