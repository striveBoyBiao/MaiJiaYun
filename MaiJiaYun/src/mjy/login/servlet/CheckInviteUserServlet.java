package mjy.login.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.common.servlet.BaseServlet;
import mjy.login.dao.impl.UserDaoImpl;
@WebServlet("/CheckInviteUser")
public class CheckInviteUserServlet extends BaseServlet {
	//手机检测
	private UserDaoImpl udi = new UserDaoImpl();
	public void checkPhone(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		boolean checkPhone = false;
		String userPhone = req.getParameter("phone");
		checkPhone = udi.phoneNoExistCheck(userPhone);
			if(checkPhone==true) {//手机号存在?
				 resp.getWriter().write("{\"message\":\"true\"}");
			}else{
				 resp.getWriter().write("{\"message\":\"false\"}");	
			}			
		}
	//邮箱检测
	public void checkEmail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		boolean checkEmail = false; 
		String userEmail = req.getParameter("email");
		checkEmail = udi.emailExistCheck(userEmail);
		System.out.println("邮箱检测"+checkEmail);
		if(checkEmail==true) {//邮箱存在
			 resp.getWriter().write("{\"message\":\"true\"}");
		}else{
			 resp.getWriter().write("{\"message\":\"false\"}");
		}
	}
	
}
